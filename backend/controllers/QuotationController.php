<?php

namespace backend\controllers;

use Yii;
use backend\models\Quotation;
use backend\models\QuotationData;
use backend\models\CustomerInvoice;
use backend\models\CustomerInvoiceData;
use backend\models\QuotationNote;
use backend\models\QuotationSearch;
use backend\models\CustomerProfile;

use backend\models\Item;
use backend\models\ItemGroupType;
use backend\models\ItemGroupTemplateDetail;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;

/**
 * QuotationController implements the CRUD actions for Quotation model.
 */
class QuotationController extends Controller
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
     * Lists all Quotation models.
     * @return mixed
     */
     public function actionConvertToInvoice($id)
     {
       $model = $this->findModel($id);
       $model_customer = CustomerProfile::findOne(['id'=>$model->id_customer]);
       $model_item = QuotationData::findAll(['id_quotation' => $id]);
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
               $model_invoice->id_customer = $model->id_customer;
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

        $searchModel = new QuotationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // ========SUMMARY TOP=========
        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));
        $month_status_1 = Quotation::find()->where(['status'=>1])->andWhere(['between', 'date', $month_start, $month_end])->count();
        $month_status_2 = Quotation::find()->where(['status'=>2])->andWhere(['between', 'date', $month_start, $month_end])->count();
        $month_status_3 = Quotation::find()->where(['status'=>3])->andWhere(['between', 'date', $month_start, $month_end])->count();
        $month_status_4 = Quotation::find()->where(['status'=>4])->andWhere(['between', 'date', $month_start, $month_end])->count();
        $month_status_5 = Quotation::find()->where(['status'=>5])->andWhere(['between', 'date', $month_start, $month_end])->count();
        $month_status_6 = Quotation::find()->where(['status'=>6])->andWhere(['between', 'close_sale_date', $month_start, $month_end])->count();

        $status_1 = Quotation::find()->where(['status'=>1])->count();
        $status_2 = Quotation::find()->where(['status'=>2])->count();
        $status_3 = Quotation::find()->where(['status'=>3])->count();
        $status_4 = Quotation::find()->where(['status'=>4])->count();
        $status_5 = Quotation::find()->where(['status'=>5])->count();
        $status_6 = Quotation::find()->where(['status'=>6])->count();
        $on_processing = Quotation::find()->where(['between','status',1,4])->count();
        $declined = Quotation::find()->where(['status'=>5])->count();
        $accepted = Quotation::find()->where(['status'=>6])->count();

        // =============================================

        $today = date('Y-m-d');

        $monday = strtotime("last monday");
        $monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;
        $sunday = strtotime(date("Y-m-d",$monday)." +6 days");
        $week_start = date("Y-m-d",$monday);
        $week_end = date("Y-m-d",$sunday);

        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));

        $year_start = date('Y-m-d', strtotime('01/01'));
        $year_end = date('Y-m-d', strtotime('12/31'));


        $daily_actual = Quotation::find()
        ->select('SUM(grand_total) as grand_total')
        ->where(['close_sale_date' => $today])
        ->andWhere(['status' => 6])
        ->one();
        $daily_actual = $daily_actual->grand_total;

        $weekly_actual = Quotation::find()
        ->select('SUM(grand_total) as grand_total')
        ->where(['between', 'close_sale_date', $week_start, $week_end])
        ->andWhere(['status' => 6])
        ->one();
        $weekly_actual = $weekly_actual->grand_total;

        $monthly_actual = Quotation::find()
        ->select('SUM(grand_total) as grand_total')
        ->where(['between', 'close_sale_date', $month_start, $month_end])
        ->andWhere(['status' => 6])
        ->one();
        $monthly_actual = $monthly_actual->grand_total;

        $yearly_actual = Quotation::find()
        ->select('SUM(grand_total) as grand_total')
        ->where(['between', 'close_sale_date', $year_start, $year_end])
        ->andWhere(['status' => 6])
        ->one();
        $yearly_actual = $yearly_actual->grand_total;


        $current_month = date('m');
        $current_year = date('Y');
        if($current_month>=1 && $current_month<=3)
        {
            $start_date = strtotime('1-January-'.$current_year);  // timestamp or 1-Januray 12:00:00 AM
            $end_date = strtotime('1-April-'.$current_year);  // timestamp or 1-April 12:00:00 AM means end of 31 March
        }
        else  if($current_month>=4 && $current_month<=6)
        {
            $start_date = strtotime('1-April-'.$current_year);  // timestamp or 1-April 12:00:00 AM
            $end_date = strtotime('1-July-'.$current_year);  // timestamp or 1-July 12:00:00 AM means end of 30 June
        }
        else  if($current_month>=7 && $current_month<=9)
        {
            $start_date = strtotime('1-July-'.$current_year);  // timestamp or 1-July 12:00:00 AM
            $end_date = strtotime('1-October-'.$current_year);  // timestamp or 1-October 12:00:00 AM means end of 30 September
        }
        else  if($current_month>=10 && $current_month<=12)
        {
            $start_date = strtotime('1-October-'.$current_year);  // timestamp or 1-October 12:00:00 AM
            $end_date = strtotime('1-January-'.($current_year+1));  // timestamp or 1-January Next year 12:00:00 AM means end of 31 December this year
        }

        $quarter_start = date('Y-m-d', $start_date);
        $quarter_end = date('Y-m-d', $end_date);

        $quarterly_actual = Quotation::find()
        ->select('SUM(grand_total) as grand_total')
        ->where(['between', 'close_sale_date', $quarter_start, $quarter_end])
        ->andWhere(['status' => 6])
        ->one();
        $quarterly_actual = $quarterly_actual->grand_total;


        // =============================================

        $current_month = date('m');
        $current_year = date('Y');

        $budget_plan = Yii::$app->db->createCommand("
                SELECT 
                a.id_month as id_month, COALESCE(SUM(a.daily), 0) as daily, SUM(a.weekly) as weekly, SUM(a.monthly) as monthly,
                (
                    CASE 
                        WHEN :current_month <= 3 THEN SUM(b.quarter_1)
                        WHEN :current_month > 3 && :current_month <= 6 THEN SUM(b.quarter_2)
                        WHEN :current_month > 6 && :current_month <= 9 THEN SUM(b.quarter_3)
                        WHEN :current_month > 9 && :current_month <= 12 THEN SUM(b.quarter_4)
                        ELSE 0
                    END) AS quarterly
                FROM budget_set_up_data AS a
                INNER JOIN budget_set_up AS b ON a.id_budget_set_up = b.id
                WHERE a.id_month = :current_month
                AND b.`year` = :current_year")
        ->bindParam(':current_month', $current_month)
        ->bindParam(':current_year', $current_year)
        ->queryOne();
        $daily_plan = $budget_plan['daily'];
        $weekly_plan = $budget_plan['weekly'];
        $monthly_plan = $budget_plan['monthly'];
        $quarterly_plan = $budget_plan['quarterly'];

        $yearly_plan = \backend\models\BudgetSetUp::find()->select(['COALESCE(SUM(budget_value),0) as budget_value'])->where(['year'=>$current_year])->one()->budget_value;

        // ========SUMMARY TOP=========

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
            'accepted' => $accepted,
            'daily_plan' => $daily_plan,
            'weekly_plan' => $weekly_plan,
            'monthly_plan' => $monthly_plan,
            'quarterly_plan' => $quarterly_plan,
            'yearly_plan' => $yearly_plan,
            'daily_actual' => $daily_actual,
            'weekly_actual' => $weekly_actual,
            'monthly_actual' => $monthly_actual,
            'quarterly_actual' => $quarterly_actual,
            'yearly_actual' => $yearly_actual,
        ]);
    }

    /**
     * Displays a single Quotation model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionPdf($id)
    {

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id);
        $model_item = QuotationData::findAll(['id_quotation'=>$model->id]);
        $item_type = \backend\models\ItemGroupType::find()->all();

        $item_group = \backend\models\ItemGroup::find()->where(['status'=>1])->orderBy(['order_by'=>SORT_ASC])->all();
        $item_group = !empty($item_group) ? $item_group : [];

        $company_profile = \backend\models\CompanyProfile::findOne(['id'=>1]);
        $company_profile = !empty($company_profile) ? $company_profile : [];

        return $this->render('view_pdf', [
            'model' => $model,
            'model_item' => $model_item,
            'item_type' => $item_type,
            'item_group' => $item_group,
            'company_profile' => $company_profile
        ]);
    }
    public function actionNote($id_quotation)
    {
        $id_user = Yii::$app->user->identity->id;
        $model_note = QuotationNote::findOne(['id_quotation'=>$id_quotation
        , 'id_user'=>$id_user]);
        if(empty($model_note)){
            $model_note = new QuotationNote();
        }

        $model = $this->findModel($id_quotation);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        if ($model_note->load(Yii::$app->request->post())) {
            $model_note->id_quotation = $id_quotation;
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
    public function actionOverview($id)
    {
      $current_page = Yii::$app->controller->id."-index";
      $this->view->params['current_page'] = $current_page;
      $model = $this->findModel($id);
      $model_customer = CustomerProfile::findOne(['id'=>$model->id_customer]);
      $model_item = QuotationData::findAll(['id_quotation' => $id]);
      $model_item = empty($model_item) ? [] : $model_item;
        return $this->render('view', [
            'model' => $this->findModel($id),
            'model_customer' => $model_customer,
            'model_item' => $model_item,
        ]);
    }

    /**
     * Creates a new Quotation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Quotation();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();

        if ($model->load(Yii::$app->request->post())) {

          $model->code = (new GlobalFunction)->GenerateDocumentID('quotation', 5);
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

                if(!empty($model->close_sale_date)){
                    if($model->status == 6){

                        $close_sale_date = date_format(date_create($model->close_sale_date),'Y');

                        $budget_plan = \backend\models\BudgetSetUp::find()
                        ->where(['id_employee'=>$model->assigned, 'year'=>$close_sale_date])
                        ->one();

                        if(!empty($budget_plan)){
                            $budget_plan->actual = $budget_plan->actual + $model->grand_total;
                            $budget_plan->under_or_over = $budget_plan->actual - $budget_plan->budget_value;
                            if(!$budget_plan->save()) throw new Exception("Failed to Save Budget Plan!");
                        }
                    }
                }


              if(!$model->save()) throw new Exception("Failed to Save!");

              if(!empty($item_name)){
                  foreach ($item_name as $key => $value) {
                      $data = new QuotationData();
                      $data->id_quotation = $model->id;
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
    public function actionDependentGetCustomerInfo(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_profile'){
                $id = Yii::$app->request->post('id');
                $customer = [];
                $customer = Yii::$app->db->createCommand("
                SELECT a.address, a.email_address,
                       a.phone_number, b.`names` as city,
                       a.zip_code,
                       c.`names` as country,a.company_name
                        FROM customer_profile as a
                        LEFT JOIN city b on a.id_city = b.id
                        LEFT JOIN country c on c.id = a.id_country
                        where a.id = $id
                ")->queryOne();
                $project = \backend\models\Project::find()->where(['id_customer'=>$id])->asArray()->all();

                $response = ['customer' => $customer, 'project' => $project];
                return json_encode($response);
            }
        }
    }
    public function actionDependent(){

        if(Yii::$app->request->isAjax){
            if(Yii::$app->request->post('action') =='get_item_data'){
                $id = Yii::$app->request->post('id');

                $response = \backend\models\Item::find()->where(['id'=>$id])->asArray()->one();

                return json_encode($response);
            }
        }
    }



    /**
     * Updates an existing Quotation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $old_model = $model->getOldAttributes();

        $model_item = QuotationData::findAll(['id_quotation' => $id]);
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

                if(!empty($model->close_sale_date)){
                    if($model->status == 6){
                        $close_sale_date = date_format(date_create($model->close_sale_date),'Y');
                        if($old_model['status'] == 6){

                            $budget_plan = \backend\models\BudgetSetUp::find()
                            ->where(['id_employee'=>$model->assigned, 'year'=>$close_sale_date])
                            ->one();
                            if(!empty($budget_plan)){
                                $budget_plan->actual = $budget_plan->actual - $old_model['grand_total'] + $model->grand_total;
                                $budget_plan->under_or_over = $budget_plan->actual - $budget_plan->budget_value;
                                if(!$budget_plan->save()) throw new Exception("Failed to Save Budget Plan!");
                            }
                        }else{
                            $budget_plan = \backend\models\BudgetSetUp::find()
                            ->where(['id_employee'=>$model->assigned, 'year'=>$close_sale_date])
                            ->one();
                            if(!empty($budget_plan)){
                                $budget_plan->actual = $budget_plan->actual + $model->grand_total;
                                $budget_plan->under_or_over = $budget_plan->actual - $budget_plan->budget_value;
                                if(!$budget_plan->save()) throw new Exception("Failed to Save Budget Plan!");
                            }
                        }
                    }else{
                        if($old_model['status'] == 6){
                            $close_sale_date = date_format(date_create($model->close_sale_date),'Y');

                            $budget_plan = \backend\models\BudgetSetUp::find()
                            ->where(['id_employee'=>$model->assigned, 'year'=>$close_sale_date])
                            ->one();
                            if(!empty($budget_plan)){
                                $budget_plan->actual = $budget_plan->actual - $old_model['grand_total'];
                                $budget_plan->under_or_over = $budget_plan->actual - $budget_plan->budget_value;
                                if(!$budget_plan->save()) throw new Exception("Failed to Save Budget Plan!");
                            }
                        }
                    }
                }


                if(!$model->save()) throw new Exception("Failed to Save!");

                if(!empty($item_name)){
                    QuotationData::deleteAll(['id_quotation'=>$model->id]);
                    foreach ($item_name as $key => $value) {
                        $data = new QuotationData();
                        $data->id_quotation = $model->id;
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
     * Deletes an existing Quotation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Quotation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Quotation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Quotation::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
