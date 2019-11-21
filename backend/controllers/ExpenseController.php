<?php

namespace backend\controllers;

use Yii;
use backend\models\Expense;
use backend\models\ExpenseData;
use backend\models\ExpenseSearch;
use backend\models\FinanceChartOfAccount;
use backend\models\FinanceChartOfAccountAmount;
use backend\models\FinancePayBill;
use backend\models\FinancePayBillData;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * ExpenseController implements the CRUD actions for Expense model.
 */
class ExpenseController extends Controller
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
     * Lists all Expense models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new ExpenseSearch();
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

    public function actionCreate($project_id)
    {
        $model = new Expense();

        if ($model->load(Yii::$app->request->post())) {
            $model->type_id = 1; //Expense
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('expense', 3);
            $model->paid_amount = $model->is_bill == 0 ? $model->total_amount : 0;
            $model->balance_amount = $model->total_amount - $model->paid_amount;
            $model->status = $model->balance_amount == 0 ? 1 : $model->balance_amount > 0 ? 4 : 3;
            if($model->is_bill == 0){
                $model->status = 1;
            }
            $model->created_date = date('Y-m-d H:i:s');
            $model->created_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            $model->updated_by = Yii::$app->user->getId();

            if($model->id_related_to == 1){
                $name_type = 'supplier';
            }else if($model->id_related_to == 2){
                $name_type = 'customer';
            }else if($model->id_related_to == 3){
                $name_type = 'project';
            }

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $chart_of_account_name = Yii::$app->request->post('chart_of_account_name');
                $description = Yii::$app->request->post('description');
                $amount = Yii::$app->request->post('amount');

                foreach ($description as $key => $value) {
                    $costing = new ExpenseData();
                    $costing->id_expense = $model->id;
                    $costing->chart_of_account = $chart_of_account_name[$key];
                    $costing->description = $description[$key];
                    $costing->amount = $amount[$key];
                    $costing->status = 1;
                    if(!$costing->save()){throw new Exception("Failed to save expense data");}

                    $account_type = \backend\models\ChartAccount::find()
                        ->where(['id'=> $chart_of_account_name[$key]])
                        ->one();

                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = $amount[$key];
                    $chart_account->credit = 0;
                    $chart_account->balance = $amount[$key];
                    $chart_account->account_type = $account_type->id_account_type;
                    $chart_account->chart_of_account = $chart_of_account_name[$key];
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account");}
                    GlobalFunction::AutoCorrectChartOfAccount($account_type->id_account_type, $chart_of_account_name[$key]);
                    //End Chart of Account

                }

                if($model->is_bill == 0){ // 0 not allow to pay bill, 1 allow to pay bill
                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->paid_amount;
                    $chart_account->balance = $model->paid_amount;
                    $chart_account->account_type = 3; //Bank
                    $chart_account->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                    GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                    //End Chart of Account Bank
                } else {
                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->total_amount;
                    $chart_account->balance = $model->total_amount;
                    $chart_account->account_type = 44;
                    $chart_account->chart_of_account = 62;
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Payable");}
                    GlobalFunction::AutoCorrectChartOfAccount(44, 62);
                    //End Chart of Account Payable
                }
                    

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
            'project_id' =>$project_id
        ]);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 

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

            $model->type_id = 1; //Expense
            $model->paid_amount = $model->is_bill == 0 ? $model->total_amount : 0;
            $model->balance_amount = $model->total_amount - $model->paid_amount;
            $model->status = $model->balance_amount == 0 ? 1 : $model->balance_amount > 0 ? 4 : 3;
            $model->updated_date = date('Y-m-d H:i:s');
            $model->updated_by = Yii::$app->user->getId();

            if($model->id_related_to == 1){
                $name_type = 'supplier';
            }else if($model->id_related_to == 2){
                $name_type = 'customer';
            }else if($model->id_related_to == 3){
                $name_type = 'project';
            }

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $chart_of_account_name = Yii::$app->request->post('chart_of_account_name');
                $description = Yii::$app->request->post('description');
                $amount = Yii::$app->request->post('amount');

                ExpenseData::deleteAll(['id_expense'=>$model->id]);
                FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                foreach ($description as $key => $value) {
                    $costing = new ExpenseData();
                    $costing->id_expense = $model->id;
                    $costing->chart_of_account = $chart_of_account_name[$key];
                    $costing->description = $description[$key];
                    $costing->amount = $amount[$key];
                    $costing->status = 1;
                    if(!$costing->save()){throw new Exception("Failed to save expense data");}

                    $account_type = \backend\models\ChartAccount::find()
                        ->where(['id'=> $chart_of_account_name[$key]])
                        ->one();

                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = $amount[$key];
                    $chart_account->credit = 0;
                    $chart_account->balance = $amount[$key];
                    $chart_account->account_type = $account_type->id_account_type;
                    $chart_account->chart_of_account = $chart_of_account_name[$key];
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account");}
                    GlobalFunction::AutoCorrectChartOfAccount($account_type->id_account_type, $chart_of_account_name[$key]);
                    //End Chart of Account

                }

                if($model->is_bill == 0){ // 0 not allow to pay bill, 1 allow to pay bill
                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->paid_amount;
                    $chart_account->balance = $model->paid_amount;
                    $chart_account->account_type = 3; //Bank
                    $chart_account->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Bank");}
                    GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                    //End Chart of Account Bank
                } else {
                    $chart_account = new FinanceChartOfAccount();
                    $chart_account->date = $model->date;
                    $chart_account->transaction_type = 'Expense';
                    $chart_account->doc_id = $model->doc_id;
                    $chart_account->name = $model->id_related_profile;
                    $chart_account->name_type = $name_type;
                    $chart_account->description = $model->remark;
                    $chart_account->debit = 0;
                    $chart_account->credit = $model->total_amount;
                    $chart_account->balance = $model->total_amount;
                    $chart_account->account_type = 44;
                    $chart_account->chart_of_account = 62;
                    $chart_account->created_date = date('Y-m-d H:i:s');
                    $chart_account->created_by = Yii::$app->user->getId();
                    $chart_account->status = 1;
                    if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Payable");}
                    GlobalFunction::AutoCorrectChartOfAccount(44, 62);
                    //End Chart of Account Payable
                }
                //End Chart of Account Bank
                    

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
            'chart_of_account_bank_amount' => $chart_of_account_bank_amount,
        ]);
    }

    public function actionPayBill()
    {
        $model = new FinancePayBill();

        if ($model->load(Yii::$app->request->post())) {
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('finance_pay_bill', 10);
            $model->status = 1;
            $model->created_date = date('Y-m-d H:i:s');
            $model->created_by = Yii::$app->user->getId();

            if($model->id_related_to == 1){
                $name_type = 'supplier';
            }else if($model->id_related_to == 2){
                $name_type = 'customer';
            }else if($model->id_related_to == 3){
                $name_type = 'project';
            }

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {

                $transaction = new Expense();
                $transaction->type_id = 2; //Pay Bill
                $transaction->date = $model->date;
                $transaction->doc_id = $model->doc_id;
                $transaction->id_related_to = $model->id_related_to;
                $transaction->id_related_profile = $model->id_related_profile;
                $transaction->id_payment_method = $model->id_payment_method;
                $transaction->cheque_number = $model->cheque_number;
                $transaction->clearing_date = $model->clearing_date;
                $transaction->is_bill = 0;
                $transaction->remark = $model->remark;
                $transaction->chart_of_account = $model->id_chart_of_account;
                $transaction->status = 1;
                $transaction->total_amount = $model->amount;
                $transaction->paid_amount = $model->amount;
                $transaction->balance_amount = 0;
                $transaction->created_by = Yii::$app->user->getId();
                $transaction->created_date = date('Y-m-d H:i:s');
                if(!$transaction->save(false)){throw new Exception("Failed to save transaction");}

                if(!$model->save()) throw new Exception("Failed to Save!");

                $bill_id = Yii::$app->request->post('bill_id');
                $bill_date = Yii::$app->request->post('bill_date');
                $doc_id = Yii::$app->request->post('doc_id');
                $description = Yii::$app->request->post('description');
                $total_amount = Yii::$app->request->post('total_amount');
                $paid_amount = Yii::$app->request->post('paid_amount');

                foreach ($description as $key => $value) {
                    $data_pay_bill = new FinancePayBillData();
                    $data_pay_bill->pay_bill_id = $model->id;
                    $data_pay_bill->bill_id = $bill_id[$key];
                    $data_pay_bill->doc_id = $doc_id[$key];
                    $data_pay_bill->bill_date = $bill_date[$key];
                    $data_pay_bill->description = $description[$key];
                    $data_pay_bill->total_amount = $total_amount[$key];
                    $data_pay_bill->paid_amount = $paid_amount[$key];
                    $data_pay_bill->status = 1;
                    if(!$data_pay_bill->save()){throw new Exception("Failed to save pay bill data");}

                    $bill_data = Expense::findOne($bill_id[$key]);
                    $bill_data->paid_amount = $paid_amount[$key];
                    $bill_data->balance_amount = $bill_data->total_amount - $bill_data->paid_amount;
                    if($bill_data->balance_amount == 0){
                        $file_status = 1;
                    }
                    if($bill_data->balance_amount > 0){
                        $file_status = 3;
                    }
                    if($bill_data->paid_amount == 0){
                        $file_status = 4;
                    }
                    $bill_data->status =$file_status;
                    if(!$bill_data->save()){throw new Exception("Failed to save bill data");}
                }

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Pay Bill';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = $model->id_related_profile;
                $chart_account_bank->name_type = $name_type;
                $chart_account_bank->description = $model->remark;
                $chart_account_bank->debit = 0;
                $chart_account_bank->credit = $model->amount;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 3; //Bank
                $chart_account_bank->chart_of_account = $model->id_chart_of_account; //Cash on Hand / in Bank
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->id_chart_of_account);
                //End Chart of Account Bank

                $chart_account_payable = new FinanceChartOfAccount();
                $chart_account_payable->date = $model->date;
                $chart_account_payable->transaction_type = 'Pay Bill';
                $chart_account_payable->doc_id = $model->doc_id;
                $chart_account_payable->name = $model->id_related_profile;
                $chart_account_payable->name_type = $name_type;
                $chart_account_payable->description = $model->remark;
                $chart_account_payable->debit = $model->amount;
                $chart_account_payable->credit = 0;
                $chart_account_payable->balance = $model->amount;
                $chart_account_payable->account_type = 44;
                $chart_account_payable->chart_of_account = 62;
                $chart_account_payable->created_date = date('Y-m-d H:i:s');
                $chart_account_payable->created_by = Yii::$app->user->getId();
                $chart_account_payable->status = 1;
                if(!$chart_account_payable->save()){throw new Exception("Failed to save Chart of Account Payable");}
                GlobalFunction::AutoCorrectChartOfAccount(44, 62);
                //End Chart of Account Payable
                    

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

        return $this->renderAjax('pay_bill', [
            'model' => $model
        ]);
    }

    public function actionUpdatePayBill($id)
    {
       
        $model_transaction​ = Expense::findOne($id);
        $model = FinancePayBill::findOne(['doc_id'=>$model_transaction​->doc_id]);

        if ($model->load(Yii::$app->request->post())) {
            $model->status = 1;
            $model->updated_date = date('Y-m-d H:i:s');
            $model->updated_by = Yii::$app->user->getId();

            if($model->id_related_to == 1){
                $name_type = 'supplier';
            }else if($model->id_related_to == 2){
                $name_type = 'customer';
            }else if($model->id_related_to == 3){
                $name_type = 'project';
            }

            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {   
                $model_transaction​->date = $model->date;
                $model_transaction​->id_related_to = $model->id_related_to;
                $model_transaction​->id_related_profile = $model->id_related_profile;
                $model_transaction​->id_payment_method = $model->id_payment_method;
                $model_transaction​->cheque_number = $model->cheque_number;
                $model_transaction​->clearing_date = $model->clearing_date;
                $model_transaction​->is_bill = 0;
                $model_transaction​->remark = $model->remark;
                $model_transaction​->chart_of_account = $model->id_chart_of_account;
                $model_transaction​->status = 1;
                $model_transaction​->total_amount = $model->amount;
                $model_transaction​->paid_amount = $model->amount;
                $model_transaction​->balance_amount = 0;
                $model_transaction​->updated_by = Yii::$app->user->getId();
                $model_transaction​->updated_date = date('Y-m-d H:i:s');
                if(!$model_transaction​->save(false)){throw new Exception("Failed to save transaction");}

                if(!$model->save()) throw new Exception("Failed to Save!");

                $bill_id = Yii::$app->request->post('bill_id');
                $bill_date = Yii::$app->request->post('bill_date');
                $doc_id = Yii::$app->request->post('doc_id');
                $description = Yii::$app->request->post('description');
                $total_amount = Yii::$app->request->post('total_amount');
                $paid_amount = Yii::$app->request->post('paid_amount');

                //Clear bill transaction paid amount
                    $pay_bill_data = FinancePayBillData::find()
                        ->where(['pay_bill_id'=>$model->id])
                        ->all();
                    foreach ($pay_bill_data as $key => $value) {

                        $bill_transaction = \backend\models\Expense::find()
                        ->where(['doc_id'=>$value->doc_id])
                        ->andWhere(['!=', 'status', 5])
                        ->one();

                        $bill_transaction->paid_amount = $bill_transaction->paid_amount - $value->paid_amount;
                        $bill_transaction->balance_amount = $bill_transaction->total_amount - $bill_transaction->paid_amount;
                        $bill_transaction->updated_by = Yii::$app->user->getId();
                        $bill_transaction->updated_date = date('Y-m-d H:i:s');
                        $bill_transaction->status = $bill_transaction->balance_amount == 0 ? 1 : $bill_transaction->balance_amount > 0 ? 4 : 3;
                        if(!$bill_transaction->save()){throw new Exception("Failed to update transaction");}
                    }
                //End Clear bill transaction paid amount

                FinancePayBillData::deleteAll(['pay_bill_id' =>$model->id]);
                foreach ($description as $key => $value) {
                    $data_pay_bill = new FinancePayBillData();
                    $data_pay_bill->pay_bill_id = $model->id;
                    $data_pay_bill->bill_id = $bill_id[$key];
                    $data_pay_bill->doc_id = $doc_id[$key];
                    $data_pay_bill->bill_date = $bill_date[$key];
                    $data_pay_bill->description = $description[$key];
                    $data_pay_bill->total_amount = $total_amount[$key];
                    $data_pay_bill->paid_amount = $paid_amount[$key];
                    $data_pay_bill->status = 1;
                    if(!$data_pay_bill->save()){throw new Exception("Failed to save pay bill data");}

                    $bill_data = Expense::findOne($bill_id[$key]);
                    $bill_data->paid_amount = $paid_amount[$key];
                    $bill_data->balance_amount = $bill_data->total_amount - $bill_data->paid_amount;
                    if($bill_data->balance_amount == 0){
                        $file_status = 1;
                    }
                    if($bill_data->balance_amount > 0){
                        $file_status = 3;
                    }
                    if($bill_data->paid_amount == 0){
                        $file_status = 4;
                    }
                    $bill_data->status = $file_status;
                    if(!$bill_data->save()){throw new Exception("Failed to save bill data");}
                }

                FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Pay Bill';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = $model->id_related_profile;
                $chart_account_bank->name_type = $name_type;
                $chart_account_bank->description = $model->remark;
                $chart_account_bank->debit = 0;
                $chart_account_bank->credit = $model->amount;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 3; //Bank
                $chart_account_bank->chart_of_account = $model->id_chart_of_account; //Cash on Hand / in Bank
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Failed to save Chart of Account Bank");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->id_chart_of_account);
                //End Chart of Account Bank

                $chart_account_payable = new FinanceChartOfAccount();
                $chart_account_payable->date = $model->date;
                $chart_account_payable->transaction_type = 'Pay Bill';
                $chart_account_payable->doc_id = $model->doc_id;
                $chart_account_payable->name = $model->id_related_profile;
                $chart_account_payable->name_type = $name_type;
                $chart_account_payable->description = $model->remark;
                $chart_account_payable->debit = $model->amount;
                $chart_account_payable->credit = 0;
                $chart_account_payable->balance = $model->amount;
                $chart_account_payable->account_type = 44;
                $chart_account_payable->chart_of_account = 62;
                $chart_account_payable->created_date = date('Y-m-d H:i:s');
                $chart_account_payable->created_by = Yii::$app->user->getId();
                $chart_account_payable->status = 1;
                if(!$chart_account_payable->save()){throw new Exception("Failed to save Chart of Account Payable");}
                GlobalFunction::AutoCorrectChartOfAccount(44, 62);
                //End Chart of Account Payable
                    

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

        return $this->renderAjax('pay_bill', [
            'model' => $model
        ]);
    }

    public function actionVoidPayBill($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {
            $model_transaction​ = Expense::findOne(['doc_id'=>$id]);
            $model_transaction​->status = 5;
            $model_transaction​->updated_by = Yii::$app->user->getId();
            $model_transaction​->updated_date = date('Y-m-d H:i:s');
            if(!$model_transaction​->save()) throw new Exception("Failed to update transaction!");

            $model = FinancePayBill::findOne(['doc_id'=>$model_transaction​->doc_id]);
            $model->status = 5;
            $model->updated_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception("Failed to update pay bill!");

            //Clear bill transaction paid amount
                $pay_bill_data = FinancePayBillData::find()
                    ->where(['pay_bill_id'=>$model->id])
                    ->all();
                foreach ($pay_bill_data as $key => $value) {

                    $bill_transaction = \backend\models\Expense::find()
                    ->where(['doc_id'=>$value->doc_id])
                    ->andWhere(['!=', 'status', 5])
                    ->one();

                    $bill_transaction->paid_amount = $bill_transaction->paid_amount - $value->paid_amount;
                    $bill_transaction->balance_amount = $bill_transaction->total_amount - $bill_transaction->paid_amount;
                    $bill_transaction->updated_by = Yii::$app->user->getId();
                    $bill_transaction->updated_date = date('Y-m-d H:i:s');
                    $bill_transaction->status = $bill_transaction->balance_amount == 0 ? 1 : $bill_transaction->balance_amount > 0 ? 4 : 3;
                    if(!$bill_transaction->save()){throw new Exception("Failed to update transaction");}
                }
            //End Clear bill transaction paid amount

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
            GlobalFunction::AutoCorrectChartOfAccount(44, 62);

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

    public function actionVoidExpense($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {
            $model = Expense::findOne(['doc_id'=>$id]);
            $model->status = 5;
            $model->updated_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception("Failed to update transaction!");

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

            $data = ExpenseData::find()->where(['id_expense' => $model->id])->all();

            foreach ($data as $key => $value) {
                $account_type = \backend\models\ChartAccount::find()
                    ->where(['id'=> $value->chart_of_account])
                    ->one();

                GlobalFunction::AutoCorrectChartOfAccount($account_type->id_account_type, $value->chart_of_account);
            }

            GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
            GlobalFunction::AutoCorrectChartOfAccount(44, 62);

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

    public function actionValidation($id = null){

        $model = $id === null ? new Expense : Expense::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    public function actionDependent(){
        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='chart_of_account_amount'){
                $id = Yii::$app->request->post('id');
                $response = \backend\models\FinanceChartOfAccountAmount::find()->where(['chart_of_account'=>$id])->one();
                if (empty($response)){
                    $amount = 0;
                }else{
                    $amount = $response->ending_balance;
                }

                return json_encode($amount);
            }
            if(Yii::$app->request->post('action') =='get_profile'){
                $id = Yii::$app->request->post('id');
                $response = [];
                if($id == 1){ //Supplier
                    $response = Yii::$app->db->createCommand("
                        SELECT id, CONCAT(supplier_name, ' (', company_name,')') as profile_name
                        FROM supplier_profile
                    ")->queryAll();
                } else if($id == 2){ //Customer
                    $response = Yii::$app->db->createCommand("
                        SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
                        FROM customer_profile
                    ")->queryAll();
                } else if($id == 3){ //Project
                    $response = Yii::$app->db->createCommand("
                        SELECT id, project_name as profile_name
                        FROM project
                    ")->queryAll();
                }
                return json_encode($response);
            }

            if(Yii::$app->request->post('action') == 'get_bill_data'){
                $id = Yii::$app->request->post('id');

                $response = Yii::$app->db->createCommand("
                    SELECT *
                    FROM expense
                    WHERE type_id = 1
                    AND `status` <> 5
                    AND is_bill = 1
                    AND balance_amount > 0
                    AND id_related_profile = :id
                ")->bindParam(':id', $id)
                ->queryAll();

                $max_date = '';
                if(!empty($response)){
                    $max_date = max(array_column($response, 'date'));
                }
                
                return json_encode(['data' => $response, 'max_date' => $max_date]);
            }
        }
    }

    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id);

        $id_related_profile = $model->id_related_profile;

        if($model->id_related_to == 1){ //Supplier
            $supplier_data = Yii::$app->db->createCommand("
                SELECT id, CONCAT(supplier_name, ' (', company_name,')') as profile_name
                FROM supplier_profile
                WHERE id = :id
            ")->bindParam(':id', $id_related_profile)->queryOne();
        }  
        if($model->id_related_to == 2){ //Customer
            $supplier_data = Yii::$app->db->createCommand("
                SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
                FROM customer_profile
                WHERE id = :id
            ")->bindParam(':id', $id_related_profile)->queryOne();
        }
        if($model->id_related_to == 3){
            $supplier_data = Yii::$app->db->createCommand("
                SELECT id, project_name as profile_name
                FROM project
                WHERE id = :id
            ")->bindParam(':id', $id_related_profile)->queryOne();
        }

        if($model->type_id == 1){
            $file_name = 'view_expense';
            $model_item = ExpenseData::findAll(['id_expense' => $model->id]);
            $model_item = empty($model_item) ? [] : $model_item;
            // $model_payment = FinancePayBillData::findAll(['bill_id'=>$model->id]);
            $model_payment = FinancePayBillData::find()
                ->innerJoin('finance_pay_bill', 'finance_pay_bill.id = finance_pay_bill_data.pay_bill_id')
                ->where(['!=','finance_pay_bill.status',5])
                ->all();
            $model_payment = empty($model_payment) ? [] : $model_payment;
        }
        if($model->type_id == 2){
            $model_pay_bill = FinancePayBill::findOne(['doc_id'=>$model->doc_id]);
            $file_name = 'view_pay_bill';
            $model_item = FinancePayBillData::findAll(['pay_bill_id' => $model_pay_bill->id]);
            $model_item = empty($model_item) ? [] : $model_item;
            $model_payment = [];
        }
        return $this->render($file_name, [
            'model' => $model,
            'supplier_data' => $supplier_data,
            'model_item' => $model_item,
            'model_payment'=> $model_payment
        ]);
    }

    protected function findModel($id)
    {
        if (($model = Expense::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
