<?php

namespace backend\controllers;

use Yii;
use backend\models\SopGoalSetup;
use backend\models\SopGoalSetupSearch;
use backend\models\SopGoalSetupData;
use backend\models\StandardOperationStep;
use backend\models\StandardOperationStepList;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use backend\models\BudgetSetUpData;
use yii\base\Exception;
/**
 * SopGoalSetupController implements the CRUD actions for SopGoalSetup model.
 */
class SopGoalSetupController extends Controller
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
     * Lists all SopGoalSetup models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new SopGoalSetupSearch();
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

    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new SopGoalSetup model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SopGoalSetup();

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
                $model->yearly = Yii::$app->request->post('yearly');

                if(!$model->save()) throw new Exception("Failed to Save!");

                $month_list = Yii::$app->request->post('month_list');
                $daily = Yii::$app->request->post('daily');
                $weekly = Yii::$app->request->post('weekly');
                $monthly = Yii::$app->request->post('monthly');

                if((!empty($month_list)) || ($month_list != '')){
                    foreach ($month_list as $key => $value) {
                        $data = new SopGoalSetupData();
                        $data->id_sop_set_up = $model->id;
                        $data->id_month = $month_list[$key];
                        $data->daily = $daily[$key];
                        $data->weekly = $weekly[$key];
                        $data->monthly = $monthly[$key];
                        if(!$data->save()) throw new Exception("Failed to save SOP goal data!");
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
     * Updates an existing SopGoalSetup model.
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
        if ($model->load(Yii::$app->request->post())) {

            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $model->quarter_1 = Yii::$app->request->post('quarterly_3');
                $model->quarter_2 = Yii::$app->request->post('quarterly_6');
                $model->quarter_3 = Yii::$app->request->post('quarterly_9');
                $model->quarter_4 = Yii::$app->request->post('quarterly_12');
                $model->yearly = Yii::$app->request->post('yearly');

                if(!$model->save()) throw new Exception("Failed to Save!");

                $month_list = Yii::$app->request->post('month_list');
                $daily = Yii::$app->request->post('daily');
                $weekly = Yii::$app->request->post('weekly');
                $monthly = Yii::$app->request->post('monthly');

                if((!empty($month_list)) || ($month_list != '')){
                    SopGoalSetupData::deleteAll(['id_sop_set_up'=>$model->id]);
                    foreach ($month_list as $key => $value) {
                        $data = new SopGoalSetupData();
                        $data->id_sop_set_up = $model->id;
                        $data->id_month = $month_list[$key];
                        $data->daily = $daily[$key];
                        $data->weekly = $weekly[$key];
                        $data->monthly = $monthly[$key];
                        if(!$data->save()) throw new Exception("Failed to save SOP goal data!");
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

        $model_item = SopGoalSetupData::findAll(['id_sop_set_up' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        return $this->renderAjax('update', [
            'model' => $model,
            'model_item' => $model_item
        ]);
    }

    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_sop_goal_setup','sop_goal_setup_id', 'id_goal_setup', 'goal_setup_id');
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

    public function actionValidation($id = null){

        $model = $id === null ? new SopGoalSetup : SopGoalSetup::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') == 'get_employee'){
                $id = Yii::$app->request->post('id');

                $employee = Yii::$app->db->createCommand("
                    SELECT id , CONCAT( id_prefix , ' ' , first_name , ' ' , last_name) AS name 
                    FROM employee_profile 
                    WHERE id_position = :id_position
                ")->bindParam(':id_position', $id)->queryAll();

                $sop_step = StandardOperationStep::find()->where(['id_employee_possition' => $id, 'status' => 1])->asArray()->all();

                $response = ['employee' => $employee, 'sop_step' => $sop_step];

                return json_encode($response);
            }

            if(Yii::$app->request->post('action') == 'get_year'){
                $id = Yii::$app->request->post('id');

                $data = Yii::$app->db->createCommand("
                    SELECT name
                    FROM year_list 
                    -- WHERE name not in (select id_year from sop_goal_setup where id_employee = :id)
                ")->bindParam(':id', $id)->queryAll();

                return json_encode($data);
            }

            if(Yii::$app->request->post('action') == 'get_sop_step_list'){
                $id = Yii::$app->request->post('id');
                $id_year = Yii::$app->request->post('id_year');
                $id_employee = Yii::$app->request->post('id_employee');

                // $data = StandardOperationStepList::find()->where(['id_standard_operation_step' => $id, 'is_track' => 1])->asArray()->all();

                $data = Yii::$app->db->createCommand("
                    SELECT * 
                    FROM standard_operation_step_list 
                    WHERE is_track = 1 
                    AND id_standard_operation_step = :id
                    AND id NOT IN(
                            SELECT id_sop_step_list 
                            FROM sop_goal_setup 
                            WHERE id_year = :id_year 
                            and id_employee = :id_employee 
                            and id_sop_step = :id
                        )
                    ")
                ->bindParam(':id', $id)
                ->bindParam(':id_year', $id_year)
                ->bindParam(':id_employee', $id_employee)
                ->queryAll();

                return json_encode($data);
            }
        }
    }

    protected function findModel($id)
    {
        if (($model = SopGoalSetup::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
