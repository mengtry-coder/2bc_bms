<?php

namespace backend\controllers;

use Yii;
use backend\models\CustomerInvoice;
use backend\models\CustomerInvoiceData;
use backend\models\Proposal;
use backend\models\Quotation;
use backend\models\QuotationData;
use backend\models\ProposalData;
use backend\models\ProposalNote;
use backend\models\ProposalSearch;
use backend\models\CustomerProfile;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
use common\models\GlobalFunction;
/**
 * ProposalController implements the CRUD actions for Proposal model.
 */
class ProposalController extends Controller
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
     * Lists all Proposal models.
     * @return mixed
     */

     public function actionConvertToQuotation($id)
     {
       $model = $this->findModel($id);
       $model_customer = CustomerProfile::findOne(['id'=>$model->id_lead_customer]);
       $model_item = ProposalData::findAll(['id_proposal' => $id]);
       $model_item = empty($model_item) ? [] : $model_item;
       if ($model->load(Yii::$app->request->post())) {
           $transaction_exception = Yii::$app->db->beginTransaction();
           try
           {
               //Total Data
               $discount_overall = Yii::$app->request->post('discount_overall');
               $is_tax = Yii::$app->request->post('allow_tax');
               $discount_overall_amount = Yii::$app->request->post('discount_overall_amount');
               $discount_type_overall_hidden = Yii::$app->request->post('discount_type_overall_hidden');
               $sub_total_amount_hidden =  Yii::$app->request->post('sub_total_amount_hidden');
               $total_tax_hidden = Yii::$app->request->post('total_tax_hidden');
               $grand_total_amount_hidden = Yii::$app->request->post('grand_total_amount_hidden');

               $model_quotation = new Quotation();
               $model_quotation->name = $model->name;
               $model_quotation->code = (new GlobalFunction)->GenerateDocumentID('quotation', 5);
               $model_quotation->id_customer = $model->id_lead_customer;
               $model_quotation->date = $model->date;
               $model_quotation->open_till = $model->open_till;
               $model_quotation->currency = $model->currency;
               $model_quotation->discount_type = $model->discount_type;
               $model_quotation->allow_comment = $model->allow_comment;
               $model_quotation->status = $model->status;
               $model_quotation->assigned = $model->assigned;
               $model_quotation->to = $model->to;
               $model_quotation->is_converted_from_proposal = 1;

               $model_quotation->id_discount = $discount_type_overall_hidden;
               $model_quotation->discount_amount = $discount_overall_amount;
               $model_quotation->id_tax = \backend\models\Tax::findOne(1)->id;
               if(!empty($is_tax)){
                   $model_quotation->is_tax = 1;
               }else{
                   $model_quotation->is_tax = 0;
               }
               $model_quotation->id_tax = \backend\models\Tax::findOne(1)->id;
               $model_quotation->tax_amount = $total_tax_hidden;
               $model_quotation->sub_total = $sub_total_amount_hidden;
               $model_quotation->grand_total = $grand_total_amount_hidden;
               $model_quotation->total = $grand_total_amount_hidden;


               $model_quotation->id_project = $model->id_project;
               $model_quotation->address = $model->address;
               $model_quotation->city = $model->city;
               $model_quotation->country = $model->country;
               $model_quotation->email = $model->email;
               $model_quotation->phone = $model->phone;
               $model_quotation->created_date =  date('Y-m-d H:i:s');
               $model_quotation->created_by = Yii::$app->user->getId();
               $model_quotation->updated_date =  date('Y-m-d H:i:s');
               $model_quotation->updated_by = Yii::$app->user->getId();
               if(!$model_quotation->save()) throw new Exception("Failed to convet to Quotation!");
               // ========copy item========
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


               if(!empty($item_name)){
                   foreach ($item_name as $key => $value) {
                       $data = new QuotationData();
                       $data->id_quotation = $model_quotation->id;
                       $data->id_item = $id_item[$key];
                       $data->item_name = $item_name[$key];
                       $data->description = $description[$key];
                       $data->qty = $qty[$key];
                       $data->rate = $rate[$key];
                       $data->discount_type = $discount_type[$key];
                       $data->discount_amount = $discount_amount[$key];
                       $data->amount = $amount[$key];
                       if(!$data->save()) throw new Exception("Failed to Save Proposal Data!");
                   }
               }


               // ========copy item========
               $transaction_exception->commit();
               Yii::$app->session->setFlash('success', "Convert to Quotation successful");
               $this->redirect(['quotation/overview', 'id'=>$model_quotation->id]);

                // =======copy item========

           }
           catch (Exception $ex)
           {
               Yii::$app->session->setFlash('warning', $ex->getMessage());
               $transaction_exception->rollBack();
               return $this->redirect(Yii::$app->request->referrer);
           }


         }

         return $this->renderAjax('convert_to_quotation', [
             'model' => $model,
             'model_customer' => $model_customer,
             'model_item' => $model_item,

         ]);

     }
     public function actionConvertToInvoice($id)
     {
       $model = $this->findModel($id);
       $model_customer = CustomerProfile::findOne(['id'=>$model->id_lead_customer]);
       $model_item = ProposalData::findAll(['id_proposal' => $id]);
       $model_item = empty($model_item) ? [] : $model_item;
       if ($model->load(Yii::$app->request->post())) {
           $transaction_exception = Yii::$app->db->beginTransaction();
           try
           {
               //Total Data
               $discount_overall = Yii::$app->request->post('discount_overall');
               $is_tax = Yii::$app->request->post('allow_tax');
               $discount_overall_amount = Yii::$app->request->post('discount_overall_amount');
               $discount_type_overall_hidden = Yii::$app->request->post('discount_type_overall_hidden');
               $sub_total_amount_hidden =  Yii::$app->request->post('sub_total_amount_hidden');
               $total_tax_hidden = Yii::$app->request->post('total_tax_hidden');
               $grand_total_amount_hidden = Yii::$app->request->post('grand_total_amount_hidden');

               $model_invoice = new CustomerInvoice();
               $model_invoice->doc_id = (new GlobalFunction)->GenerateDocumentID('customer_invoice', 1);
               $model_invoice->id_customer = $model->id_lead_customer;
               $model_invoice->id_payment_method = 1;
               $model_invoice->date = $model->date;
               $model_invoice->currency = $model->currency;
               $model_invoice->status = 4;
               $model_invoice->is_converted_from_proposal = 1;

               $model_invoice->id_discount = $discount_type_overall_hidden;
               $model_invoice->discount_amount = $discount_overall_amount;
               $model_invoice->id_tax = \backend\models\Tax::findOne(1)->id;
               if(!empty($is_tax)){
                   $model_invoice->is_tax = 1;
               }else{
                   $model_invoice->is_tax = 0;
               }
               $model_invoice->id_tax = \backend\models\Tax::findOne(1)->id;
               $model_invoice->tax_amount = $total_tax_hidden;
               $model_invoice->sub_total = $sub_total_amount_hidden;
               $model_invoice->total_amount = $grand_total_amount_hidden;
               $model_invoice->id_project = $model->id_project;
               $model_invoice->created_date =  date('Y-m-d H:i:s');
               $model_invoice->created_by = Yii::$app->user->getId();
               $model_invoice->updated_date =  date('Y-m-d H:i:s');
               $model_invoice->updated_by = Yii::$app->user->getId();
               if(!$model_invoice->save()) throw new Exception("Failed to Convert to Invoice!");
               // ========copy item========
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


               if(!empty($item_name)){
                   foreach ($item_name as $key => $value) {
                       $data = new CustomerInvoiceData();
                       $data->id_customer_invoice = $model_invoice->id;
                       $data->id_item = $id_item[$key];
                       $data->item_name = $item_name[$key];
                       $data->description = $description[$key];
                       $data->qty = $qty[$key];
                       $data->rate = $rate[$key];
                       $data->discount_type = $discount_type[$key];
                       $data->discount_amount = $discount_amount[$key];
                       $data->amount = $amount[$key];
                       if(!$data->save()) throw new Exception("Failed to Save Proposal Data!");
                   }
               }


               // ========copy item========
               $transaction_exception->commit();
               Yii::$app->session->setFlash('success', "Convert to Invoice successful");
               $this->redirect(['customer-invoice/view', 'id'=>$model_invoice->id]);

                // =======copy item========

           }
           catch (Exception $ex)
           {
               Yii::$app->session->setFlash('warning', $ex->getMessage());
               $transaction_exception->rollBack();
               return $this->redirect(Yii::$app->request->referrer);
           }


         }

         return $this->renderAjax('convert_to_invoice', [
             'model' => $model,
             'model_customer' => $model_customer,
             'model_item' => $model_item,


         ]);

     }
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $request = Yii::$app->request;
        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));
        $id_lead_profile = $request->get('id_lead_profile',0);
        if($id_lead_profile != 0){
            $this->layout="lead_layout";
            $searchModel = new ProposalSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            // ========SUMMARY TOP=========
            // $idLead = Yii::$app->db->createCommand('
            //     select id_project from project_member where id_employee = "'.$id_employee_profile.'"
            // ')->queryAll();
            // $idProject = [];
            // foreach ($idLead as $row)
            // {
            // $explode = explode(",", $row["id_project"]);
            //     foreach ($explode as $id){
            //     array_push($idProject,$id);
            //     }
            // }

            // $dataProvider->query->where(['in','project.id',$idProject]);

            $month_status_1 = Proposal::find()->where(['status'=>1])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_2 = Proposal::find()->where(['status'=>2])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_3 = Proposal::find()->where(['status'=>3])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_4 = Proposal::find()->where(['status'=>4])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_5 = Proposal::find()->where(['status'=>5])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_6 = Proposal::find()->where(['status'=>6])->andWhere(['between', 'date', $month_start, $month_end])->count();

            $status_1 = Proposal::find()->where(['status'=>1])->count();
            $status_2 = Proposal::find()->where(['status'=>2])->count();
            $status_3 = Proposal::find()->where(['status'=>3])->count();
            $status_4 = Proposal::find()->where(['status'=>4])->count();
            $status_5 = Proposal::find()->where(['status'=>5])->count();
            $status_6 = Proposal::find()->where(['status'=>6])->count();
            $on_processing = Proposal::find()->where(['between','status',1,4])->count();
            $declined = Proposal::find()->where(['status'=>5])->count();
            $accepted = Proposal::find()->where(['status'=>6])->count();
            // ========SUMMARY TOP=========
        }else{
            $searchModel = new ProposalSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            // ========SUMMARY TOP=========
            $day = date('Y-m-d');
            $month_start = date('Y-m-01');
            $month_end = date("Y-m-t", strtotime($day));
            $month_status_1 = Proposal::find()->where(['status'=>1])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_2 = Proposal::find()->where(['status'=>2])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_3 = Proposal::find()->where(['status'=>3])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_4 = Proposal::find()->where(['status'=>4])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_5 = Proposal::find()->where(['status'=>5])->andWhere(['between', 'date', $month_start, $month_end])->count();
            $month_status_6 = Proposal::find()->where(['status'=>6])->andWhere(['between', 'date', $month_start, $month_end])->count();

            $status_1 = Proposal::find()->where(['status'=>1])->count();
            $status_2 = Proposal::find()->where(['status'=>2])->count();
            $status_3 = Proposal::find()->where(['status'=>3])->count();
            $status_4 = Proposal::find()->where(['status'=>4])->count();
            $status_5 = Proposal::find()->where(['status'=>5])->count();
            $status_6 = Proposal::find()->where(['status'=>6])->count();
            $on_processing = Proposal::find()->where(['between','status',1,4])->count();
            $declined = Proposal::find()->where(['status'=>5])->count();
            $accepted = Proposal::find()->where(['status'=>6])->count();
            // ========SUMMARY TOP=========
        }


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
            'month_status_5' => $month_status_5,
            'month_status_6' => $month_status_6,
            'status_1' => $status_1,
            'status_2' => $status_2,
            'status_3' => $status_3,
            'status_4' => $status_4,
            'status_5' => $status_5,
            'status_6' => $status_6,
            'on_processing' => $on_processing,
            'declined' => $declined,
            'accepted' => $accepted
        ]);
    }

    /**
     * Displays a single Proposal model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
     public function actionValidation($id = null){

         $model = $id === null ? new Proposal : Proposal::findOne($id);
         if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
             Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
             return \yii\widgets\ActiveForm::validate($model);
         }
     }

     public function actionNote($id_proposal)
     {
         $id_user = Yii::$app->user->identity->id;
         $model_note = ProposalNote::findOne(['id_proposal'=>$id_proposal
         , 'id_user'=>$id_user]);
         if(empty($model_note)){
             $model_note = new ProposalNote();
         }

         $model = $this->findModel($id_proposal);

         $current_page = Yii::$app->controller->id."-index";
         $this->view->params['current_page'] = $current_page;

         if ($model_note->load(Yii::$app->request->post())) {

             $model_note->id_proposal = $id_proposal;
             $model_note->id_user = $id_user;

             if($model_note->save()){
                 Yii::$app->session->setFlash('success', "Record updated successfully");
                 return $this->redirect(Yii::$app->request->referrer);
             }else{
                 Yii::$app->session->setFlash('warning', "Failed to update record");
                 return $this->redirect(Yii::$app->request->referrer);
             }
         }
         return $this->render('note', [
             'model' => $model,
             'model_note' => $model_note,
         ]);
     }
    public function actionView($id)
    {

        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    }
    public function actionOverview($id)
    {
      $current_page = Yii::$app->controller->id."-index";
      $this->view->params['current_page'] = $current_page;
      $model = $this->findModel($id);
      $model_customer = CustomerProfile::findOne(['id'=>$model->id_lead_customer]);
      $model_item = ProposalData::findAll(['id_proposal' => $id]);
      $model_item = empty($model_item) ? [] : $model_item;
        return $this->render('view', [
            'model' => $this->findModel($id),
            'model_customer' => $model_customer,
            'model_item' => $model_item,
        ]);
    }

        public function actionDependent(){

            if(Yii::$app->request->isAjax){

                if(Yii::$app->request->post('action') =='get_profile'){
                    $id = Yii::$app->request->post('id');
                    $response = [];
                    if($id == 2){ //Project
                        $response = Yii::$app->db->createCommand("
                            SELECT id, lead_name as profile_name
                            FROM lead_profile
                            where customer_status !=6
                        ")->queryAll();
                    }else if($id == 1){ //Customer
                        $response = Yii::$app->db->createCommand("
                            SELECT id, customer_name as profile_name
                            FROM customer_profile
                        ")->queryAll();
                    }
                    return json_encode($response);
                }
                if(Yii::$app->request->post('action') =='get_item_data'){
                    $id = Yii::$app->request->post('id');

                    $response = \backend\models\Item::find()->where(['id'=>$id])->asArray()->one();

                    return json_encode($response);
                }
            }
        }
        public function actionDependentGetCustomerInfo(){

            if(Yii::$app->request->isAjax){

                if(Yii::$app->request->post('action') =='get_profile'){
                    $id = Yii::$app->request->post('id');
                    $is_customer_lead = Yii::$app->request->post('is_customer_lead');
                    $response = [];
                    if($is_customer_lead == 1){ //is customer
                      $response = Yii::$app->db->createCommand("
                      SELECT a.address, a.email_address,
                             a.phone_number, b.`names` as city,
                             a.zip_code,
                             c.`names` as country,a.company_name
                              FROM customer_profile as a
                              LEFT JOIN city b on a.id_city = b.id
                              LEFT JOIN country c on c.id = a.id_country
                              where a.id = $id
                      ")->queryOne();
                    }else { //is lead
                      $response = Yii::$app->db->createCommand("
                      SELECT a.address, a.email_address,
                             a.phone_number, b.`names` as city,
                             a.zip_code,
                             c.`names` as country,a.company_name
                              FROM lead_profile as a
                              LEFT JOIN city b on a.id_city = b.id
                              LEFT JOIN country c on c.id = a.id_country
                              where a.id = $id
                      ")->queryOne();
                    }

                    return json_encode($response);
                }
            }
        }

    /**
     * Creates a new Proposal model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Proposal();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {

          $model->code = (new GlobalFunction)->GenerateDocumentID('proposal', 4);

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
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                if(!empty($is_tax)){
                    $model->is_tax = 1;
                }else{
                    $model->is_tax = 0;
                }
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                $model->tax_amount = $total_tax_hidden;
                $model->sub_total = $sub_total_amount_hidden;
                $model->grand_total = $grand_total_amount_hidden;
                $model->total = $grand_total_amount_hidden;

                if(!$model->save()) throw new Exception("Failed to Save!");

                if(!empty($item_name)){
                    foreach ($item_name as $key => $value) {
                        $data = new ProposalData();
                        $data->id_proposal = $model->id;
                        $data->id_item = $id_item[$key];
                        $data->item_name = $item_name[$key];
                        $data->description = $description[$key];
                        $data->qty = $qty[$key];
                        $data->rate = $rate[$key];
                        $data->discount_type = $discount_type[$key];
                        $data->discount_amount = $discount_amount[$key];
                        $data->amount = $amount[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Proposal Data!");
                    }
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
        ]);
    }

    /**
     * Updates an existing Proposal model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model_item = ProposalData::findAll(['id_proposal' => $id]);
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
            $model->total = $grand_total_amount_hidden;

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                $model->id_discount = $discount_type_overall_hidden;
                $model->discount_value = $discount_overall;
                $model->discount_amount = $discount_overall_amount;
                $model->id_tax = \backend\models\Tax::findOne(1)->id;
                if(!empty($is_tax)){
                    $model->is_tax = 1;
                }else{
                    $model->is_tax = 0;
                }
                $model->tax_amount = $total_tax_hidden;
                $model->sub_total = $sub_total_amount_hidden;
                $model->grand_total = $grand_total_amount_hidden;

                if(!$model->save()) throw new Exception("Failed to Save!");

                if(!empty($item_name)){
                    ProposalData::deleteAll(['id_proposal'=>$model->id]);
                    foreach ($item_name as $key => $value) {
                        $data = new ProposalData();
                        $data->id_proposal = $model->id;
                        $data->id_item = $id_item[$key];
                        $data->item_name = $item_name[$key];
                        $data->description = $description[$key];
                        $data->qty = $qty[$key];
                        $data->rate = $rate[$key];
                        $data->discount_type = $discount_type[$key];
                        $data->discount_amount = $discount_amount[$key];
                        $data->amount = $amount[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Proposal Data!");
                    }
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

        return $this->renderAjax('update', [
            'model' => $model,
            'model_item' => $model_item
        ]);
    }

    /**
     * Deletes an existing Proposal model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_proposal','proposal_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr);

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer);
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    /**
     * Finds the Proposal model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Proposal the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Proposal::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
