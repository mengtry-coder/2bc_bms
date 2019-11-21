<?php

namespace backend\controllers;

use Yii;
use backend\models\CustomerInvoice;
use backend\models\CustomerProfile;
use backend\models\CustomerPayment;
use backend\models\CustomerPaymentSearch;
use backend\models\FinanceChartOfAccount;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * CustomerPaymentController implements the CRUD actions for CustomerPayment model.
 */
class CustomerPaymentController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        // return [
        //     'access' => [
        //         'class' => \yii\filters\AccessControl::className(),
        //          'rules' => [
        //             [
        //             'allow' => true,
        //             'actions' => \backend\models\User::getUserPermission(Yii::$app->controller->id),
        //             'roles' => ['@'],
        //             ]
        //          ]
        //     ],
        // ];
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }


    public function actionPayment($id)
    {
        $model = new CustomerPayment();

        $model_invoice = CustomerInvoice::findOne(['id' => $id]);
        $model_invoice = empty($model_invoice) ? [] : $model_invoice;

        if ($model->load(Yii::$app->request->post())) {

            $model->created_date =  date('Y-m-d H:i:s');
            $model->created_by = Yii::$app->user->getId(); 
            $model->id_customer_invoice = $model_invoice->id;
            $model->status = 1;

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                $model->doc_id = (new GlobalFunction)->GenerateDocumentID('customer_payment', 2);
                $model->id_project = $model_invoice->id_project;

                if(!$model->save()) throw new Exception("Failed to Save!");

                $model_invoice->receive_amount = $model_invoice->receive_amount + $model->receive_amount;
                $model_invoice->balance_amount = $model_invoice->total_amount - $model_invoice->receive_amount;
                $model_invoice->status = $model_invoice->balance_amount == 0 ? 1 : 3;

                if(!$model_invoice->save()) throw new Exception("Failed to Save Invoice!");

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Payment';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model_invoice->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = $model->receive_amount;
                $chart_account->debit = 0;
                $chart_account->balance = $model->receive_amount;
                $chart_account->account_type = 45;
                $chart_account->chart_of_account = 63;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Account Receivable");}
                GlobalFunction::AutoCorrectChartOfAccount(45, 63);

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Payment';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model_invoice->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = 0;
                $chart_account->debit = $model->receive_amount;
                $chart_account->balance = $model->receive_amount;
                $chart_account->account_type = 3;
                $chart_account->chart_of_account = $model->chart_of_account;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save(false)){throw new Exception("Failed to save Chart of Account Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);

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

        return $this->renderAjax('payment', [
            'model' => $model,
            'model_invoice' => $model_invoice,
        ]);
    }

    public function actionDependent() {
        if(Yii::$app->request->post('action') =='chart_of_account_amount'){
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

    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        // daratester code 
         $request = Yii::$app->request;
         $day = date('Y-m-d');
         $month_start = date('Y-m-01');
         $month_end = date("Y-m-t", strtotime($day)); 
         $id_customer_profile = $request->get('id_customer_profile',0);
         if($id_customer_profile != 0){
             $this->layout="customer_layout";
             $searchModel = new CustomerPaymentSearch();
             $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
             $idCustomer = Yii::$app->db->createCommand('
                 select customer_invoice.id as id_customer_invoice from customer_invoice where customer_invoice.id_customer = "'.$id_customer_profile.'"
             ')->queryAll(); 
             $idCustomerInvoice = []; 
             foreach ($idCustomer as $row)
             { 
             $explode = explode(",", $row["id_customer_invoice"]);
                 foreach ($explode as $id){
                 array_push($idCustomerInvoice,$id);
                 }
             } 
             
             $dataProvider->query->where(['in','customer_payment.id_customer_invoice',$idCustomerInvoice]);

        }else{
            $searchModel = new CustomerPaymentSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        }
        // end daratester code
        
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

    public function actionView($id, $doc_id)
    {
        $model = CustomerPayment::findOne($id);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $old_model = $model->getOldAttributes();

        $model_invoice = CustomerInvoice::findOne(['doc_id' => $doc_id]);
        $model_invoice = empty($model_invoice) ? [] : $model_invoice;

        $model_customer = CustomerProfile::findOne(['id'=>$model_invoice->id_customer]);

        $chart_of_account = $model->chart_of_account;
        $chart_of_account_bank = FinanceChartOfAccount::find()
            ->select(['COALESCE(balance, 0) as balance'])
            ->where(['account_type'=>3, 'chart_of_account'=>$chart_of_account])
            ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
            ->limit(1)
            ->one();
        if(empty($chart_of_account_bank)){
            $chart_of_account_bank_amount = 0;
        }else{
            $chart_of_account_bank_amount = $chart_of_account_bank->balance;
        }

        if ($model->load(Yii::$app->request->post())) {

            if($model->status == 0){
                Yii::$app->session->setFlash('warning', "Can not update, this transaction has been voided");
                return $this->redirect(Yii::$app->request->referrer);
            }

            $model->updated_date =  date('Y-m-d H:i:s');
            $model->updated_by = Yii::$app->user->getId(); 

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                if(!$model->save()) throw new Exception("Failed to Save!");

                $model_invoice->id_project = $model_invoice->id_project;
                $model_invoice->receive_amount = ($model_invoice->receive_amount - $old_model['receive_amount']) + $model->receive_amount;
                $model_invoice->balance_amount = $model_invoice->total_amount - $model_invoice->receive_amount;
                $model_invoice->status = $model_invoice->balance_amount == 0 ? 1 : 3;

                if(!$model_invoice->save()) throw new Exception("Failed to Save Invoice!");

                FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Payment';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model_invoice->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = $model->receive_amount;
                $chart_account->debit = 0;
                $chart_account->balance = $model->receive_amount;
                $chart_account->account_type = 45;
                $chart_account->chart_of_account = 63;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save(false)){throw new Exception("Failed to save Chart of Account Account Receivable");}
                GlobalFunction::AutoCorrectChartOfAccount(45, 63);

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Payment';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model_invoice->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = 0;
                $chart_account->debit = $model->receive_amount;
                $chart_account->balance = $model->receive_amount;
                $chart_account->account_type = 3;
                $chart_account->chart_of_account = $model->chart_of_account;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save(false)){throw new Exception("Failed to save Chart of Account Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);

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

        return $this->render('view_payment', [
            'model' => $model,
            'model_customer' => $model_customer,
            'model_invoice' => $model_invoice,
            'chart_of_account_bank_amount' => $chart_of_account_bank_amount
        ]);
    }

    public function actionVoid($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {
            //Update Status Customer Payment
            $model = CustomerPayment::findOne(['doc_id' => $id]);
            $model->status = 0;
            $model->updated_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception("Error Code #VCP-001");

            //Clear Receive Amount to Customer Invoice
            $model_invoice = CustomerInvoice::findOne(['id'=>$model->id_customer_invoice]);
            $model_invoice->receive_amount = $model_invoice->receive_amount - $model->receive_amount;
            $model_invoice->balance_amount = $model_invoice->total_amount - $model_invoice->receive_amount;            
            $model_invoice->status = $model_invoice->balance_amount == 0 ? 1 : 3;
            $model_invoice->updated_by = Yii::$app->user->getId();
            $model_invoice->updated_date = date('Y-m-d H:i:s');
            if(!$model_invoice->save()){throw new Exception("Error Code #VCP-002");}

            FinanceChartOfAccount::updateAll(
                [
                    'status' => 0,
                    'updated_by' => Yii::$app->user->getId(),
                    'updated_date'=>Date('Y-m-d H:i:s')
                ],
                //condition
                ['doc_id'=>$model->doc_id]
            );

            // FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);
            GlobalFunction::AutoCorrectChartOfAccount(45, 63);
            GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Payment #".$model->doc_id." has been voided");
            return $this->redirect(Yii::$app->request->referrer); 
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage()); 
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }   
        
    }

    
    protected function findModel($id)
    {
        if (($model = CustomerPayment::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
