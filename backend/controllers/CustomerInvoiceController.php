<?php

namespace backend\controllers;

use Yii;
use backend\models\CustomerInvoice;
use backend\models\CustomerProfile;
use backend\models\CustomerInvoiceTag;
use backend\models\CustomerInvoiceData;
use backend\models\CustomerInvoiceSearch;
use backend\models\CustomerPaymentSearch;
use backend\models\CustomerPayment;
use backend\models\FinanceChartOfAccount;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
/**
 * CustomerInvoiceController implements the CRUD actions for CustomerInvoice model.
 */
class CustomerInvoiceController extends Controller
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
     * Lists all CustomerInvoice models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        // daratester code
        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));
        $request = Yii::$app->request;
        $id_customer_profile = $request->get('id_customer_profile',0);
        if($id_customer_profile != 0){
            $this->layout="customer_layout";
            $searchModel = new CustomerInvoiceSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['customer_invoice.id_customer'=>$id_customer_profile]);

            $month_status_1 = CustomerInvoice::find()->where(['status'=>1])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_2 = CustomerInvoice::find()->where(['status'=>2])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_3 = CustomerInvoice::find()->where(['status'=>3])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_4 = CustomerInvoice::find()->where(['status'=>4])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'date', $month_start, $month_end])->count();

            $status_1 = CustomerInvoice::find()->where(['status'=>1])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_2 = CustomerInvoice::find()->where(['status'=>2])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_3 = CustomerInvoice::find()->where(['status'=>3])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_4 = CustomerInvoice::find()->where(['status'=>4])->andWhere(['id_customer'=>$id_customer_profile])->count();

            $all_outstanding = CustomerInvoice::find()->select(['SUM(balance_amount) as balance_amount'])->where(['id_customer'=>$id_customer_profile])->one()->balance_amount;
            $all_over_due = CustomerInvoice::find()->select(['SUM(balance_amount) as balance_amount'])->where(['id_customer'=>$id_customer_profile])->andWhere(['status'=>2])->one()->balance_amount;
            $all_paid = CustomerInvoice::find()->select(['SUM(receive_amount) as receive_amount'])->where(['id_customer'=>$id_customer_profile])->one()->receive_amount;

        } else {
            $searchModel = new CustomerInvoiceSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $month_status_1 = CustomerInvoice::find()->where(['status'=>1])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_2 = CustomerInvoice::find()->where(['status'=>2])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_3 = CustomerInvoice::find()->where(['status'=>3])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_4 = CustomerInvoice::find()->where(['status'=>4])->andWhere(['between', 'date', $month_start, $month_end])->count();

            $status_1 = CustomerInvoice::find()->where(['status'=>1])->count();
            $status_2 = CustomerInvoice::find()->where(['status'=>2])->count();
            $status_3 = CustomerInvoice::find()->where(['status'=>3])->count();
            $status_4 = CustomerInvoice::find()->where(['status'=>4])->count();

            $all_outstanding = CustomerInvoice::find()->select(['SUM(balance_amount) as balance_amount'])->one()->balance_amount;
            $all_over_due = CustomerInvoice::find()->select(['SUM(balance_amount) as balance_amount'])->where(['status'=>2])->one()->balance_amount;
            $all_paid = CustomerInvoice::find()->select(['SUM(receive_amount) as receive_amount'])->one()->receive_amount;

        }
        // end daratester code

        // $searchModel = new CustomerInvoiceSearch();
        // $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

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
            'month_status_1' => $month_status_1,
            'month_status_2' => $month_status_2,
            'month_status_3' => $month_status_3,
            'month_status_4' => $month_status_4,
            'status_1' => $status_1,
            'status_2' => $status_2,
            'status_3' => $status_3,
            'status_4' => $status_4,
            'all_outstanding' => $all_outstanding,
            'all_over_due' => $all_over_due,
            'all_paid' => $all_paid
        ]);
    }

    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);
        $model_customer = CustomerProfile::findOne(['id'=>$model->id_customer]);

        $model_item = CustomerInvoiceData::findAll(['id_customer_invoice' => $id]);
        $model_item = empty($model_item) ? [] : $model_item;

        $model_payment = CustomerPayment::findAll(['id_customer_invoice'=>$id]);
        $model_payment = empty($model_payment) ? [] : $model_payment;

        // $current_page = Yii::$app->controller->id."-view";
        // $this->view->params['current_page'] = $current_page;

        return $this->render('view', [
            'model' => $model,
            'model_customer' => $model_customer,
            'model_item' => $model_item,
            'model_payment'=> $model_payment
        ]);
    }

    public function actionCreate($project_id)
    {
        $model = new CustomerInvoice();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {

            $model->status = 4;
            $model->doc_id = (new GlobalFunction)->GenerateDocumentID('customer_invoice', 1);

            //Row Data
            $item_name = Yii::$app->request->post('item');
            $id_item = Yii::$app->request->post('item_id');
            $description = Yii::$app->request->post('description');
            $qty = Yii::$app->request->post('qty');
            $rate = Yii::$app->request->post('rate');
            $discount_type = Yii::$app->request->post('discount_type');
            $discount_amount = Yii::$app->request->post('discount');
            $amount = Yii::$app->request->post('amount');
            //End Row Data

            //Total Data
            $discount_overall = Yii::$app->request->post('discount_overall');
            $is_tax = Yii::$app->request->post('allow_tax');
            $discount_overall_amount = Yii::$app->request->post('discount_overall_amount');
            $discount_type_overall_hidden = Yii::$app->request->post('discount_type_overall_hidden');
            $sub_total_amount_hidden =  Yii::$app->request->post('sub_total_amount_hidden');
            $total_tax_hidden = Yii::$app->request->post('total_tax_hidden');
            $grand_total_amount_hidden = Yii::$app->request->post('grand_total_amount_hidden');

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                $model->id_discount = $discount_type_overall_hidden;
                $model->discount_amount = $discount_overall_amount;
                $model->discount_value = $discount_overall;
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                if(!empty($is_tax)){
                    $model->is_tax = 1;
                }else{
                    $model->is_tax = 0;
                }
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                $model->tax_amount = $total_tax_hidden;
                $model->sub_total = $sub_total_amount_hidden;
                $model->total_amount = $grand_total_amount_hidden;
                $model->receive_amount = 0;
                $model->balance_amount = $grand_total_amount_hidden;

                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new CustomerInvoiceTag();
                        $tag->id_customer_invoice = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                if(!empty($item_name)){
                    foreach ($item_name as $key => $value) {
                        $data = new CustomerInvoiceData();
                        $data->id_customer_invoice = $model->id;
                        $data->id_item = $id_item[$key];
                        $data->item_name = $item_name[$key];
                        $data->description = $description[$key];
                        $data->qty = $qty[$key];
                        $data->rate = $rate[$key];
                        $data->discount_type = $discount_type[$key];
                        $data->discount_amount = $discount_amount[$key];
                        $data->amount = $amount[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Invoice Data!");
                    }
                }

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Invoice';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model->id_customer;
                $chart_account->name_type = 'Customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = $model->total_amount;
                $chart_account->debit = 0;
                $chart_account->balance = $model->total_amount;
                $chart_account->account_type = 1;
                $chart_account->chart_of_account = 1;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Sale Income");}
                GlobalFunction::AutoCorrectChartOfAccount(1, 1);

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Invoice';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model->id_customer;
                $chart_account->name_type = 'Customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = 0;
                $chart_account->debit = $model->total_amount;
                $chart_account->balance = $model->total_amount;
                $chart_account->account_type = 45;
                $chart_account->chart_of_account = 63;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Account Receivable");}
                GlobalFunction::AutoCorrectChartOfAccount(45, 63);

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
            'project_id' => $project_id
        ]);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model_customer = CustomerProfile::findOne(['id'=>$model->id_customer]);

        $model_item = CustomerInvoiceData::findAll(['id_customer_invoice' => $id]);
        $model_item = empty($model_item) ? [] : $model_item;

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {

            //Row Data
            $item_name = Yii::$app->request->post('item');
            $id_item = Yii::$app->request->post('item_id');
            $description = Yii::$app->request->post('description');
            $qty = Yii::$app->request->post('qty');
            $rate = Yii::$app->request->post('rate');
            $discount_type = Yii::$app->request->post('discount_type');
            $discount_amount = Yii::$app->request->post('discount');
            $amount = Yii::$app->request->post('amount');
            //End Row Data

            //Total Data
            $discount_overall = Yii::$app->request->post('discount_overall');
            $is_tax = Yii::$app->request->post('allow_tax');
            $discount_overall_amount = Yii::$app->request->post('discount_overall_amount');
            $discount_type_overall_hidden = Yii::$app->request->post('discount_type_overall_hidden');
            $sub_total_amount_hidden =  Yii::$app->request->post('sub_total_amount_hidden');
            $total_tax_hidden = Yii::$app->request->post('total_tax_hidden');
            $grand_total_amount_hidden = Yii::$app->request->post('grand_total_amount_hidden');

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                $model->id_discount = $discount_type_overall_hidden;
                $model->discount_amount = $discount_overall_amount;
                $model->discount_value = $discount_overall;
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                if(!empty($is_tax)){
                    $model->is_tax = 1;
                }else{
                    $model->is_tax = 0;
                }
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                $model->tax_amount = $total_tax_hidden;
                $model->sub_total = $sub_total_amount_hidden;
                $model->total_amount = $grand_total_amount_hidden;
                $model->balance_amount = $model->total_amount - $model->receive_amount;
                // $model->balance_amount = $grand_total_amount_hidden - $model->receive_amount;
                $model->status = $model->balance_amount == 0 ? 4 : $model->receive_amount < $grand_total_amount_hidden ? 3 : 1 ;

                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                CustomerInvoiceTag::deleteAll(['id_customer_invoice'=>$model->id]);
                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new CustomerInvoiceTag();
                        $tag->id_customer_invoice = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                if(!empty($item_name)){
                    CustomerInvoiceData::deleteAll(['id_customer_invoice'=>$model->id]);
                    foreach ($item_name as $key => $value) {
                        $data = new CustomerInvoiceData();
                        $data->id_customer_invoice = $model->id;
                        $data->id_item = $id_item[$key];
                        $data->item_name = $item_name[$key];
                        $data->description = $description[$key];
                        $data->qty = $qty[$key];
                        $data->rate = $rate[$key];
                        $data->discount_type = $discount_type[$key];
                        $data->discount_amount = $discount_amount[$key];
                        $data->amount = $amount[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Invoice Data!");
                    }
                }

                FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);
                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Invoice';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = $model->total_amount;
                $chart_account->debit = 0;
                $chart_account->balance = $model->total_amount;
                $chart_account->account_type = 1;
                $chart_account->chart_of_account = 1;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Sale Income");}
                GlobalFunction::AutoCorrectChartOfAccount(1, 1);

                $chart_account = new FinanceChartOfAccount();
                $chart_account->date = $model->date;
                $chart_account->transaction_type = 'Invoice';
                $chart_account->doc_id = $model->doc_id;
                $chart_account->name = $model->id_customer;
                $chart_account->name_type = 'customer';
                $chart_account->description = $model->doc_id;
                $chart_account->credit = 0;
                $chart_account->debit = $model->total_amount;
                $chart_account->balance = $model->total_amount;
                $chart_account->account_type = 45;
                $chart_account->chart_of_account = 63;
                $chart_account->created_date = date('Y-m-d H:i:s');
                $chart_account->created_by = Yii::$app->user->getId();
                $chart_account->status = 1;
                if(!$chart_account->save()){throw new Exception("Failed to save Chart of Account Account Receivable");}
                GlobalFunction::AutoCorrectChartOfAccount(45, 63);

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
            'model_item' => $model_item,
            'model_customer' => $model_customer
        ]);
    }

    public function actionVoid($id)
    {

        $transaction_exception = Yii::$app->db->beginTransaction();

        try
        {

            //Update status to Customer Invoice
            $model = CustomerInvoice::findOne(['doc_id'=>$id]);
            $model->status = 5;
            $model->updated_by = Yii::$app->user->getId();
            $model->updated_date = date('Y-m-d H:i:s');
            if(!$model->save()){throw new Exception("Error Code #VCI-001");}

            // FinanceChartOfAccount::deleteAll(['doc_id'=>$model->doc_id]);
            FinanceChartOfAccount::updateAll(
                [
                    'status' => 0,
                    'updated_by' => Yii::$app->user->getId(),
                    'updated_date'=>Date('Y-m-d H:i:s')
                ],
                //condition
                ['doc_id'=>$id]
            );
            GlobalFunction::AutoCorrectChartOfAccount(45, 63);
            GlobalFunction::AutoCorrectChartOfAccount(1, 1);

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Invoice #".$model->doc_id." has been voided");
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

        $model = $id === null ? new CustomerInvoice : CustomerInvoice::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    public function actionValidationPayment($id = null){

        $model = $id === null ? new CustomerPayment : CustomerPayment::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }


    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_item_data'){
                $id = Yii::$app->request->post('id');

                $response = \backend\models\Item::find()->where(['id'=>$id])->asArray()->one();

                return json_encode($response);
            }
            if(Yii::$app->request->post('action') =='get_customer_data'){
                $id = Yii::$app->request->post('id');

                $customer = \backend\models\CustomerProfile::find()->select(['shipping_address', 'billing_address'])->where(['id'=>$id])->asArray()->one();

                $project = \backend\models\Project::find()->where(['id_customer'=>$id])->asArray()->all();

                $response = ['customer' => $customer, 'project' => $project];

                return json_encode($response);
            }

            if(Yii::$app->request->post('action') =='invoice_payment'){
                $id = Yii::$app->request->post('id');
                $invoice_amount = Yii::$app->request->post('invoice_amount');

                if($invoice_amount > 0){
                    $model = $this->findModel($id);
                    $model->receive_amount = $invoice_amount;
                    $model->balance_amount = $model->total_amount - $model->receive_amount;
                    $model->status = $model->balance_amount == 0 ? 1 : 3;

                    if($model->save()){
                        return json_encode('success');
                    }else{
                        return json_encode('fail');
                    }

                }

            }
        }
    }


    protected function findModel($id)
    {
        if (($model = CustomerInvoice::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
