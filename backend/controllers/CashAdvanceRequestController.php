<?php

namespace backend\controllers;

use Yii;
use backend\models\PayPeriod;
use backend\models\CashAdvanceRequest;
use backend\models\CashAdvanceRequestSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * CashAdvanceRequestController implements the CRUD actions for CashAdvanceRequest model.
 */
class CashAdvanceRequestController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                 'rules' => [
                    [
                    'allow' => true,
                    'actions' => \backend\models\User::getUserPermission(Yii::$app->controller->id),
                    'roles' => ['@'],
                    ]
                 ]
            ],
        ];
    }

    /**
     * Lists all CashAdvanceRequest models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new CashAdvanceRequestSearch();
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


    /**
     * Creates a new CashAdvanceRequest model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CashAdvanceRequest();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 

        $id_approver = Yii::$app->user->identity->id_employee; 

        $is_approval = Yii::$app->db->createCommand('
            SELECT
                COUNT(hr_approval_permission_data.id) as is_appoval
            FROM hr_approval_permission_data
            LEFT JOIN hr_approval_permission on hr_approval_permission.id = hr_approval_permission_data.hr_approval_permission_id
            WHERE hr_approval_permission.approver_id = :id_approver 
        ')->bindParam(':id_approver',$id_approver)->queryOne();

        $pay_type_name = PayPeriod::find()->all();

        if ($model->load(Yii::$app->request->post())) {
            $model->status = 1;
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('cash_advance_request', 6);
            
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Error Code #CAR-001");

                //Chart of Account Bank
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $model->amount;
                    $chart_account->account_type = 3; //Bank
                    $chart_account->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-002");
                    GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                //End Chart of Account Bank

                //Check Chart of Account Current Asset
                    $chart_of_account_asset = \backend\models\FinanceChartOfAccountAmount::find()
                        ->where(['chart_of_account'=>51, 'account_type'=>9, 'name'=>$model->id_employee, 'name_type'=>'Employee'])
                        ->one();
                    if(empty($chart_of_account_asset)){
                        $chart_of_account_asset = new \backend\models\FinanceChartOfAccountAmount();
                        $chart_of_account_asset->chart_of_account = 51;
                        $chart_of_account_asset->account_type = 9;
                        $chart_of_account_asset->ending_balance = 0;
                        $chart_of_account_asset->name = $model->id_employee;
                        $chart_of_account_asset->name_type = 'Employee';
                        if(!$chart_of_account_asset->save()) throw new Exception("Error Code #CAR-003");
                    }
                    $chart_of_account_asset->ending_balance = $chart_of_account_asset->ending_balance + $model->amount;
                    if(!$chart_of_account_asset->save()) throw new Exception("Error Code #CAR-003");

                    $sum_chart_of_account_asset = \backend\models\FinanceChartOfAccountAmount::find()
                        ->select(['SUM(ending_balance) as ending_balance'])
                        ->where(['chart_of_account'=>51, 'account_type'=>9])
                        ->one();
                //End Check Chart of Account Current Asset

                //Chart of Account Current Asset
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $sum_chart_of_account_asset->ending_balance;
                    $chart_account->account_type = 9; //Current Asset
                    $chart_account->chart_of_account = 51; //Employee Cash Advances
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-004");
                    GlobalFunction::AutoCorrectChartOfAccount(9, 51);
                //End Chart of Account Current Asset

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
            'pay_type_name' => $pay_type_name,
            'is_approval' => $is_approval
        ]);
    }

    /**
     * Updates an existing CashAdvanceRequest model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $old_model = $model->getOldAttributes();

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        $pay_type_name = PayPeriod::find()->all();

        $id_approver = Yii::$app->user->identity->id_employee;
        $employee_id = $model->id_employee;        

        $is_approval = Yii::$app->db->createCommand('
            SELECT
                COUNT(hr_approval_permission_data.id) as is_appoval
            FROM hr_approval_permission_data
            LEFT JOIN hr_approval_permission on hr_approval_permission.id = hr_approval_permission_data.hr_approval_permission_id
            WHERE hr_approval_permission.approver_id = :id_approver
            AND hr_approval_permission_data.employee_id = :employee_id
        ')->bindParam(':id_approver',$id_approver)->bindParam(':employee_id',$employee_id)->queryOne();

        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                
                if(!$model->save()) throw new Exception("Error Code #CAR-001");


                //Update Chart of Account Amount
                $old_chart_account_amount = \backend\models\FinanceChartOfAccountAmount::find()
                ->where(['account_type'=>9,'chart_of_account'=>51, 'name'=> $model->id_employee, 'name_type'=>'employee'])
                ->one();
                $old_chart_account_amount->ending_balance = $old_chart_account_amount->ending_balance + $model->amount - $old_model['amount'];
                if(!$old_chart_account_amount->save()){throw new Exception("Error Code #CAR-002");}

                \backend\models\FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                //Chart of Account Bank
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $model->amount;
                    $chart_account->account_type = 3; //Bank
                    $chart_account->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-002");
                    GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                //End Chart of Account Bank

                //Chart of Account Current Asset
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $model->amount;
                    $chart_account->account_type = 9; //Current Asset
                    $chart_account->chart_of_account = 51; //Employee Cash Advances
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-004");
                    GlobalFunction::AutoCorrectChartOfAccount(9, 51);
                //End Chart of Account Current Asset

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
            'pay_type_name' => $pay_type_name,
            'is_approval' => $is_approval
        ]);
    }

    public function actionView($id)
    {
        $model = $this->findModel($id);
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $pay_type_name = PayPeriod::find()->all();

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 

        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Error Code #CAR-001");


                //Update Chart of Account Amount
                $old_chart_account_amount = \backend\models\FinanceChartOfAccountAmount::find()
                ->where(['account_type'=>9,'chart_of_account'=>51, 'name'=> $model->id_employee, 'name_type'=>'employee'])
                ->one();
                $old_chart_account_amount->ending_balance = $old_chart_account_amount->ending_balance + $model->amount - $old_model['amount'];
                if(!$old_chart_account_amount->save()){throw new Exception("Error Code #CAR-002");}

                \backend\models\FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                //Chart of Account Bank
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $model->amount;
                    $chart_account->account_type = 3; //Bank
                    $chart_account->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-002");
                    GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                //End Chart of Account Bank

                //Chart of Account Current Asset
                    $chart_account = new \backend\models\FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Cash Advance';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_employee;
                    $chart_account->name_type = 'employee';
                    $chart_account->description = $model->reason . ' - ' . $model->doc_id;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->amount;
                    $chart_account->balance = $model->amount;
                    $chart_account->account_type = 9; //Current Asset
                    $chart_account->chart_of_account = 51; //Employee Cash Advances
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()) throw new Exception("Error Code #CAR-004");
                    GlobalFunction::AutoCorrectChartOfAccount(9, 51);
                //End Chart of Account Current Asset

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

        return $this->render('view', [
            'model' => $model,
            'pay_type_name' => $pay_type_name
        ]);
    }
    
    public function actionVoid($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try
        {
            $model = CashAdvanceRequest::findOne(['doc_id'=>$id]);
            $model->status = 0;
            $model->updated_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            if(!$model->save()){throw new Exception("Error Code #CAR-001");}

            $old_chart_account_amount = \backend\models\FinanceChartOfAccountAmount::find()
            ->where(['account_type'=>9,'chart_of_account'=>51, 'name'=> $model->id_employee, 'name_type'=>'employee'])
            ->one();
            $old_chart_account_amount->ending_balance = $old_chart_account_amount->ending_balance - $model->amount;
            if(!$old_chart_account_amount->save()){throw new Exception("Error Code #CAR-002");}

            \backend\models\FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);
            GlobalFunction::AutoCorrectChartOfAccount(9, 51);
            GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Cash Advance #".$model->doc_id." has been voided");
            return $this->redirect(Yii::$app->request->referrer);
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage());
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    public function actionValidation($id = null){

        $model = $id === null ? new CashAdvanceRequest : CashAdvanceRequest::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    /**
     * Finds the CashAdvanceRequest model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CashAdvanceRequest the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CashAdvanceRequest::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
