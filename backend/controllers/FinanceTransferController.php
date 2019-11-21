<?php

namespace backend\controllers;

use Yii;
use backend\models\FinanceTransfer;
use backend\models\FinanceTransferSearch;
use backend\models\FinanceChartOfAccount;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * FinanceTransferController implements the CRUD actions for FinanceTransfer model.
 */
class FinanceTransferController extends Controller
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
     * Lists all FinanceTransfer models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new FinanceTransferSearch();
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
        $model = new FinanceTransfer();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->status = 1;
        if ($model->load(Yii::$app->request->post())) {
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('finance_transfer', 11);

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $from_chart_account = new FinanceChartOfAccount();
                $from_chart_account->date = $model->date;
                $from_chart_account->transaction_type = 'Transfer';
                $from_chart_account->doc_id = $model->doc_id;
                $from_chart_account->name = null;
                $from_chart_account->name_type = null;
                $from_chart_account->description = $model->description;
                $from_chart_account->debit = 0;
                $from_chart_account->credit = $model->amount;
                $from_chart_account->balance = $model->amount;
                $from_chart_account->account_type = 3; //Bank
                $from_chart_account->chart_of_account = $model->from_account; //Cash on Hand / in Bank
                $from_chart_account->created_date = date('Y-m-d H:i:s');
                $from_chart_account->created_by = Yii::$app->user->getId();
                $from_chart_account->status = 1;
                if(!$from_chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->from_account);

                $to_chart_account = new FinanceChartOfAccount();
                $to_chart_account->date = $model->date;
                $to_chart_account->transaction_type = 'Transfer';
                $to_chart_account->doc_id = $model->doc_id;
                $to_chart_account->name = null;
                $to_chart_account->name_type = null;
                $to_chart_account->description = $model->description;
                $to_chart_account->debit = $model->amount;
                $to_chart_account->credit = 0;
                $to_chart_account->balance = $model->amount;
                $to_chart_account->account_type = 3; //Bank
                $to_chart_account->chart_of_account = $model->to_account; //Cash on Hand / in Bank
                $to_chart_account->created_date = date('Y-m-d H:i:s');
                $to_chart_account->created_by = Yii::$app->user->getId();
                $to_chart_account->status = 1;
                if(!$to_chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->to_account);

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

                $from_chart_account = new FinanceChartOfAccount();
                $from_chart_account->date = $model->date;
                $from_chart_account->transaction_type = 'Transfer';
                $from_chart_account->doc_id = $model->doc_id;
                $from_chart_account->name = null;
                $from_chart_account->name_type = null;
                $from_chart_account->description = $model->description;
                $from_chart_account->debit = 0;
                $from_chart_account->credit = $model->amount;
                $from_chart_account->balance = $model->amount;
                $from_chart_account->account_type = 3; //Bank
                $from_chart_account->chart_of_account = $model->from_account; //Cash on Hand / in Bank
                $from_chart_account->created_date = date('Y-m-d H:i:s');
                $from_chart_account->created_by = Yii::$app->user->getId();
                $from_chart_account->status = 1;
                if(!$from_chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->from_account);

                $to_chart_account = new FinanceChartOfAccount();
                $to_chart_account->date = $model->date;
                $to_chart_account->transaction_type = 'Transfer';
                $to_chart_account->doc_id = $model->doc_id;
                $to_chart_account->name = null;
                $to_chart_account->name_type = null;
                $to_chart_account->description = $model->description;
                $to_chart_account->debit = $model->amount;
                $to_chart_account->credit = 0;
                $to_chart_account->balance = $model->amount;
                $to_chart_account->account_type = 3; //Bank
                $to_chart_account->chart_of_account = $model->to_account; //Cash on Hand / in Bank
                $to_chart_account->created_date = date('Y-m-d H:i:s');
                $to_chart_account->created_by = Yii::$app->user->getId();
                $to_chart_account->status = 1;
                if(!$to_chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->to_account);

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

            $model = FinanceTransfer::findOne(['doc_id' => $id]);
            $model->status = 0;
            if(!$model->save()) throw new Exception("Failed to update transfer!");

            FinanceChartOfAccount::updateAll(
                [
                    'status' => 0,
                    'updated_by' => Yii::$app->user->getId(),
                    'updated_date'=>Date('Y-m-d H:i:s')
                ],
                //condition
                ['doc_id'=>$id]
            );

            GlobalFunction::AutoCorrectChartOfAccount(3, $model->from_account);
            GlobalFunction::AutoCorrectChartOfAccount(3, $model->to_account);

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

    public function actionDependent() {
        if(Yii::$app->request->post('action') =='chart_of_account_from'){
            $chart_of_account = Yii::$app->request->post('id');
            $chart_of_account_bank = FinanceChartOfAccount::find()
                ->select(['COALESCE(balance, 0) as balance'])
                ->where(['account_type'=>3, 'chart_of_account'=>$chart_of_account, 'status'=>1])
                ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
                ->limit(1)
                ->one();
            if(empty($chart_of_account_bank)){
                $chart_of_account_bank_amount = 0;
            }else{
                $chart_of_account_bank_amount = $chart_of_account_bank->balance;
            }

            $chart_of_account_to = Yii::$app->db->createCommand("
                SELECT * 
                FROM chart_account 
                WHERE id_account_type =3 
                AND id != :id
                AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)")
            ->bindParam(':id', $chart_of_account)->queryAll();

            $response = ['chart_of_account' => $chart_of_account_to, 'amount' => $chart_of_account_bank_amount];

            return json_encode($response);
        }

        if(Yii::$app->request->post('action') =='chart_of_account_to'){
            $chart_of_account = Yii::$app->request->post('id');
            $chart_of_account_bank = FinanceChartOfAccount::find()
                ->select(['COALESCE(balance, 0) as balance'])
                ->where(['account_type'=>3, 'chart_of_account'=>$chart_of_account, 'status'=>1])
                ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
                ->limit(1)
                ->one();
            if(empty($chart_of_account_bank)){
                $chart_of_account_bank_amount = 0;
            }else{
                $chart_of_account_bank_amount = $chart_of_account_bank->balance;
            }

            return json_encode($chart_of_account_bank_amount);
        }
    }


    protected function findModel($id)
    {
        if (($model = FinanceTransfer::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
