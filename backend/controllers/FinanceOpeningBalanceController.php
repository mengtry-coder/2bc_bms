<?php

namespace backend\controllers;

use Yii;
use backend\models\FinanceOpeningBalance;
use backend\models\FinanceOpeningBalanceSearch;
use backend\models\FinanceChartOfAccount;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * FinanceOpeningBalanceController implements the CRUD actions for FinanceOpeningBalance model.
 */
class FinanceOpeningBalanceController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all FinanceOpeningBalance models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new FinanceOpeningBalanceSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        $total_items = $dataProvider->getTotalCount();

        $page_size = array_values( Yii::$app->params['page_size'])[0];
        $page_size_cookie = $current_page.'_page_size';
        if(isset($_REQUEST["page_size"])){
            if(intval($_REQUEST["page_size"])>0){
                $page_size = intval($_REQUEST["page_size"]);
                $set_cookies = Yii::$app->response->cookies;
                $set_cookies->add(new Cookie([
                'name' => $page_size_cookie,
                'value' => $page_size,
                'expire' => time() + (86400 * 3),
                ]));
            }
        } else {
            $get_cookies = Yii::$app->request->cookies;
            if ($get_cookies->has($page_size_cookie)) {
                $page_size = $get_cookies->getValue($page_size_cookie);
            }
        }

        $page = 0;
        $page_cookie = $current_page.'_page';
        if(isset($_REQUEST["page"])){
            if(intval($_REQUEST["page"])>0){
                $page = intval($_REQUEST["page"])-1;
                $set_cookies = Yii::$app->response->cookies;
                $set_cookies->add(new Cookie([
                'name' => $page_cookie,
                'value' => $page,
                'expire' => time() + (86400 * 3),
                ]));
            }
        } else {
            $get_cookies = Yii::$app->request->cookies;
            if ($get_cookies->has($page_cookie)) {
                $page = $get_cookies->getValue($page_cookie);
            }
        }
        $max_page = ceil($total_items / $page_size);

        $decrease_page = 0;
        while($page + 1 > $max_page){
            $page=$page-1;
            $decrease_page = 1;
        }
        if($decrease_page==1){
            $set_cookies = Yii::$app->response->cookies;
            $set_cookies->add(new Cookie([
            'name' => $page_cookie,
            'value' => $page,
            'expire' => time() + (86400 * 3),
            ]));
        }

        $dataProvider->pagination->pageSize = $page_size;
        $dataProvider->pagination->page = $page;

        return $this->render('index', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    

    public function actionCreate()
    {
        $model = new FinanceOpeningBalance();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->status = 1;
        if ($model->load(Yii::$app->request->post())) {
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('finance_opening_balance', 9);

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Opening Balance';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = null;
                $chart_account_bank->name_type = null;
                $chart_account_bank->description = 'Opening Balance - ' . $model->amount_in_word;
                $chart_account_bank->debit = $model->amount;
                $chart_account_bank->credit = 0;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 3; //Bank
                $chart_account_bank->chart_of_account = $model->id_chart_of_account; //Cash on Hand / in Bank
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->id_chart_of_account);

                $chart_account_equity = new FinanceChartOfAccount();
                $chart_account_equity->date = $model->date;
                $chart_account_equity->transaction_type = 'Opening Balance';
                $chart_account_equity->doc_id = $model->doc_id;
                $chart_account_equity->name = null;
                $chart_account_equity->name_type = null;
                $chart_account_equity->description = 'Opening Balance - ' . $model->amount_in_word;
                $chart_account_equity->debit = 0;
                $chart_account_equity->credit = $model->amount;
                $chart_account_equity->balance = $model->amount;
                $chart_account_equity->account_type = 7; 
                $chart_account_equity->chart_of_account = 202;//273                
                $chart_account_equity->created_date = date('Y-m-d H:i:s');
                $chart_account_equity->created_by = Yii::$app->user->getId();
                $chart_account_equity->status = 1;
                if(!$chart_account_equity->save()){throw new Exception("Failed to update Chart of Account Opening Balance Equity");}
                GlobalFunction::AutoCorrectChartOfAccount(7, 202);//273

                $transaction_exception->commit();
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(Yii::$app->request->referrer);  

            }
            catch (Exception $ex)
            {
                Yii::$app->session->setFlash('warning', $ex->getMessage()); 
                $transaction_exception->rollBack();
                return $this->redirect(Yii::$app->request->referrer);
            }   
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Opening Balance';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = null;
                $chart_account_bank->name_type = null;
                $chart_account_bank->description = 'Opening Balance - ' . $model->amount_in_word;
                $chart_account_bank->debit = $model->amount;
                $chart_account_bank->credit = 0;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 3; //Bank
                $chart_account_bank->chart_of_account = $model->id_chart_of_account; //Cash on Hand / in Bank
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->id_chart_of_account);

                $chart_account_equity = new FinanceChartOfAccount();
                $chart_account_equity->date = $model->date;
                $chart_account_equity->transaction_type = 'Opening Balance';
                $chart_account_equity->doc_id = $model->doc_id;
                $chart_account_equity->name = null;
                $chart_account_equity->name_type = null;
                $chart_account_equity->description = 'Opening Balance - ' . $model->amount_in_word;
                $chart_account_equity->debit = 0;
                $chart_account_equity->credit = $model->amount;
                $chart_account_equity->balance = $model->amount;
                $chart_account_equity->account_type = 7; 
                $chart_account_equity->chart_of_account = 202;//273                
                $chart_account_equity->created_date = date('Y-m-d H:i:s');
                $chart_account_equity->created_by = Yii::$app->user->getId();
                $chart_account_equity->status = 1;
                if(!$chart_account_equity->save()){throw new Exception("Failed to update Chart of Account Opening Balance Equity");}
                GlobalFunction::AutoCorrectChartOfAccount(7, 202);//273

                $transaction_exception->commit();
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(Yii::$app->request->referrer);  

            }
            catch (Exception $ex)
            {
                Yii::$app->session->setFlash('warning', $ex->getMessage()); 
                $transaction_exception->rollBack();
                return $this->redirect(Yii::$app->request->referrer);
            }   
        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }

    public function actionVoid($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {

            $model = FinanceOpeningBalance::findOne(['doc_id' => $id]);
            $model->status = 0;
            if(!$model->save()) throw new Exception("Failed to update opening blanace!");

            // FinanceChartOfAccount::deleteAll(['doc_id'=>$id]);

            FinanceChartOfAccount::updateAll(
                [
                    'status' => 0,
                    'updated_by' => Yii::$app->user->getId(),
                    'updated_date'=>Date('Y-m-d H:i:s')
                ],
                //condition
                ['doc_id'=>$id]
            );

            GlobalFunction::AutoCorrectChartOfAccount(3, $model->id_chart_of_account);
            GlobalFunction::AutoCorrectChartOfAccount(7, 202);//273

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Void successful");
            return $this->redirect(Yii::$app->request->referrer); 
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage()); 
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }   
        
    }

    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }


    protected function findModel($id)
    {
        if (($model = FinanceOpeningBalance::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
