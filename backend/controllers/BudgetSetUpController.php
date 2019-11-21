<?php

namespace backend\controllers;

use Yii;
use backend\models\BudgetSetupValueSearch;
use backend\models\BudgetSetUp;
use backend\models\BudgetSetupValue;
use backend\models\BudgetSetUpSearch;
use backend\models\BudgetSetUpData;
use backend\models\Quotation;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
/**
 * BudgetSetUpController implements the CRUD actions for BudgetSetUp model.
 */
class BudgetSetUpController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        // return [
        //     'verbs' => [
        //         'class' => VerbFilter::className(),
        //         'actions' => [
        //             'delete' => ['POST'],
        //         ],
        //     ],
        // ];
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
     * Lists all BudgetSetUp models.
     * @return mixed
     */
     public function actionGetDepartment(){

         if(Yii::$app->request->isAjax){

             if(Yii::$app->request->post('action') =='get_department'){
                 $id = Yii::$app->request->post('id');
                   $response = Yii::$app->db->createCommand("
                   SELECT * from employee_profile where id = $id
                   ")->queryAll();
                 return json_encode($response);
             }
         }
     }
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $searchModel = new BudgetSetUpSearch();
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

        $budget_plan_month = Yii::$app->db->createCommand("
                SELECT SUM(a.monthly) as monthly
                FROM budget_set_up_data AS a
                INNER JOIN budget_set_up AS b ON a.id_budget_set_up = b.id
                AND a.id_month = :current_month
                AND b.`year` = :current_year")
        ->bindParam(':current_month', $current_month)
        ->bindParam(':current_year', $current_year)
        ->queryScalar();
        $monthly_plan = $budget_plan_month;

        $yearly_plan = BudgetSetUp::find()->select(['COALESCE(SUM(budget_value),0) as budget_value'])->where(['year'=>$current_year])->one()->budget_value;


        return $this->render('index', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'monthly_plan' => $monthly_plan,
            'yearly_plan' => $yearly_plan,
            'daily_actual' => $daily_actual,
            'weekly_actual' => $weekly_actual,
            'monthly_actual' => $monthly_actual,
            'quarterly_actual' => $quarterly_actual,
            'yearly_actual' => $yearly_actual,
        ]);
    }

    /**
     * Displays a single BudgetSetUp model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;



        $page_size = array_values( Yii::$app->params['page_size'])[0];
        $page_size_cookie = $current_page.'_page_size';



        $model = $this->findModel($id);
        $budget_setup_id = $id;
        return $this->render('view', [
            'page_size' => $page_size,
            'model' => $model,
            'budget_setup_id' => $budget_setup_id,
        ]);
    }

    /**
     * Creates a new BudgetSetUp model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new BudgetSetUp();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();

        if ($model->load(Yii::$app->request->post())) {

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $model->quarter_1 = Yii::$app->request->post('quarterly_3');
                $model->quarter_2 = Yii::$app->request->post('quarterly_6');
                $model->quarter_3 = Yii::$app->request->post('quarterly_9');
                $model->quarter_4 = Yii::$app->request->post('quarterly_12');
                $model->budget_value = Yii::$app->request->post('yearly');

                if(!$model->save()) throw new Exception("Failed to Save!");

                $month_list = Yii::$app->request->post('month_list');
                $daily = Yii::$app->request->post('daily');
                $weekly = Yii::$app->request->post('weekly');
                $monthly = Yii::$app->request->post('monthly');
                // $quarterly = Yii::$app->request->post('quarterly');

                if((!empty($month_list)) || ($month_list != '')){
                    foreach ($month_list as $key => $value) {
                        $data = new BudgetSetUpData();
                        $data->id_budget_set_up = $model->id;
                        $data->id_month = $month_list[$key];
                        $data->daily = $daily[$key];
                        $data->weekly = $weekly[$key];
                        $data->monthly = $monthly[$key];
                        // $data->quarterly = $quarterly[$key];
                        if(!$data->save()) throw new Exception("Failed to Save month list!");
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
     * Updates an existing BudgetSetUp model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $model->quarter_1 = Yii::$app->request->post('quarterly_3');
                $model->quarter_2 = Yii::$app->request->post('quarterly_6');
                $model->quarter_3 = Yii::$app->request->post('quarterly_9');
                $model->quarter_4 = Yii::$app->request->post('quarterly_12');
                $model->budget_value = Yii::$app->request->post('yearly');
                
                if(!$model->save()) throw new Exception("Failed to Save!");

                $month_list = Yii::$app->request->post('month_list');
                $daily = Yii::$app->request->post('daily');
                $weekly = Yii::$app->request->post('weekly');
                $monthly = Yii::$app->request->post('monthly');
                // $quarterly = Yii::$app->request->post('quarterly');
                BudgetSetUpData::deleteAll(['id_budget_set_up'=>$model->id]);
                if((!empty($month_list)) || ($month_list != '')){
                    foreach ($month_list as $key => $value) {
                        $data = new BudgetSetUpData();
                        $data->id_budget_set_up = $model->id;
                        $data->id_month = $month_list[$key];
                        $data->daily = $daily[$key];
                        $data->weekly = $weekly[$key];
                        $data->monthly = $monthly[$key];
                        // $data->quarterly = $quarterly[$key];
                        if(!$data->save()) throw new Exception("Failed to Save month list!");
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

        $model_item = BudgetSetUpData::findAll(['id_budget_set_up' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        return $this->renderAjax('update', [
            'model' => $model,
            'model_item' => $model_item
        ]);
    }

    /**
     * Deletes an existing BudgetSetUp model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_budget_setup','budget_setup_id', 'id_budget', 'budget_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer); 
        } elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        } else {
            BudgetSetUpData::deleteAll(['id_budget_set_up'=>$model->id]);
            
            Yii::$app->session->setFlash('error', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_year'){
                $id = Yii::$app->request->post('id');

                $data = Yii::$app->db->createCommand("
                    SELECT name
                    FROM year_list 
                    WHERE name not in (select year from budget_set_up where id_employee = :id)
                ")->bindParam(':id', $id)->queryAll();

                return json_encode($data);
            }
        }
    }

    /**
     * Finds the BudgetSetUp model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BudgetSetUp the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BudgetSetUp::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
