<?php

namespace backend\controllers;

use Yii;
use backend\models\StandardOperation;
use backend\models\StandardOperationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use backend\models\StandardOperationCheckList;
use backend\models\StandardOperationStep;
use backend\models\StandardOperationMember;
/**
 * StandardOperationController implements the CRUD actions for StandardOperation model.
 */
class StandardOperationController extends Controller
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
     * Lists all StandardOperation models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new StandardOperationSearch();
        $model = new StandardOperation();
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
        
        $user_position = Yii::$app->user->identity->id_position;
        if(Yii::$app->user->identity->user_type_id != 1){
            $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position'=>$user_position])->all();
        }else{
            $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position'=>1])->orderBy(['sort'=>SORT_ASC])->all();
            if ($model->load(Yii::$app->request->get())) { 
                $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position' => $model->id_emp_position])->orderBy(['sort'=>SORT_ASC])->all();
             }
        } 

        return $this->render('index', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model' => $model,
            'standardOperationStep' => $standardOperationStep,
        ]);
    }

    /**
     * Displays a single StandardOperation model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    }


    public function actionCreate()
    {
        $model = new StandardOperation();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
           
           if($model->save()){
                $assign_user = Yii::$app->request->post('assign_to'); 
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new StandardOperationMember();
                        $assign->id_standard_operation = $model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }  
           } 
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing StandardOperation model.
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
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }

    public function actionFormView($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        if ($model->load(Yii::$app->request->post()) ) {
            $description = Yii::$app->request->post('description');  
            $is_done = Yii::$app->request->post('is_done');
            $done_date = Yii::$app->request->post('done_date'); 
            $sop_step_list = Yii::$app->request->post('sop_step_list'); 
            StandardOperationCheckList::deleteAll(['id_standard_operation_step'=>$model->id_standard_operation_step,'id_standard_operation'=>$model->id]);
            StandardOperationMember::deleteAll(['id_standard_operation'=>$model->id]);
            if($model->save()){
                if (!empty($description))
                {
                    foreach ($description as $key => $descriptions)
                    { 
                        $sopCheckList = new StandardOperationCheckList();
                        $sopCheckList->id_standard_operation = $model->id;
                        $sopCheckList->id_standard_operation_step = $model->id_standard_operation_step;
                        $sopCheckList->description = $descriptions;
                        $sopCheckList->id_standard_operation_step_list = $sop_step_list[$key];
                        $sopCheckList->status = 1;
                        $sopCheckList->is_done = (isset($is_done[$key]) === TRUE ? $is_done[$key] : 0);
                        $sopCheckList->done_date = (isset($done_date[$key]) === TRUE ? $done_date[$key] : "");
                        $sopCheckList->created_date = date('Y-m-d H:i:s');
                        $sopCheckList->created_by = Yii::$app->user->getId();
                        $sopCheckList->save();
                    }
                } 

                $assign_user = Yii::$app->request->post('assign_to'); 
                
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new StandardOperationMember();
                        $assign->id_standard_operation = $model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                } 
                $due_date = $model->due_date;
                $deadline = $model->deadline;
                if($due_date !=""){
                    $varDuedate = "start_date = '.$due_date.',";
                }else{
                    $varDuedate = "";
                }
                if($deadline !=""){
                    $varDeadline = "deadline = '.$deadline.',";
                }else{
                    $varDeadline = "";
                }
                $command = Yii::$app->db->createCommand('
                UPDATE task 
                SET  
                    task_name = "'.$model->name.'",
                    id_related_to = "'.$model->id_related_to.'",
                    id_related_to = "'.$model->id_related_to.'",
                    id_related_profile = "'.$model->id_related_profile.'",
                    id_priority = "'.$model->id_priority.'",
                    status = "'.$model->task_status.'",
                    '.$varDeadline.'
                    '.$varDuedate.'
                    start_date = "'.$model->start_date.'"
                WHERE id = "'.$model->id_task.'"
                ');
                // $command->bindParam(":due_date",$due_date);
                // $command->bindParam(":deadline",$deadline);
                $command->execute();

                // $udateTask = Yii::$app->db->createCommand()
                // ->update('task', [
                //     'task_name' => $model->name,
                //     'id_related_to' => $model->id_related_to,
                //     'id_related_to' => $model->id_related_to,
                //     'id_related_profile' => $model->id_related_profile,
                //     'id_priority' => $model->id_priority,
                //     'status' => $model->task_status,
                //     'start_date' => $model->start_date,
                //     'due_date' => $model->due_date,
                //     'deadline' => $model->deadline, 
                // ], "id  = '.$model->id_task.'");
                // $udateTask->execute();
                
            }
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);  
        }

        return $this->renderAjax('_form_view', [
            'model' => $model,
        ]);
    }


    public function actionUpdateStepSop()
    { 
        $request = Yii::$app->request;

        if($request->isAjax){
            if($request->post('action')=='update_step_sop'){
                $id_standard_operation_step = $request->post('id_standard_operation_step');
                $task_id = $request->post('task_id');
                $model_sop = \backend\models\StandardOperation::findOne(['id' => $task_id]);
                $model_sop->id_standard_operation_step = $id_standard_operation_step;
                $model_sop->save();
                return;
            } 
        }
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_sop_step'){
                $id_employee_position = Yii::$app->request->post('id_employee_position');
                $response = [];
                $sop_step = Yii::$app->db->createCommand("
                    SELECT standard_operation_step.id as id, standard_operation_step.name as sop_step_name
                    FROM standard_operation_step 
                    WHERE standard_operation_step.status = 1
                    AND standard_operation_step.id_employee_position = ".$id_employee_position."
                ")->queryAll();

                $employee = Yii::$app->db->createCommand("
                    SELECT CONCAT(employee_profile.id_prefix, ' ', employee_profile.first_name, ' ', employee_profile.last_name) as name, employee_profile.id
                    from employee_profile
                    inner join employee_position on employee_profile.id_position = employee_position.id
                    where employee_profile.id_position = :id_position
                ")->bindParam(':id_position', $id_employee_position)->queryAll();

                $response = ['sop_step' => $sop_step, 'employee'=> $employee];

                return json_encode($response);
            }
 
        }
    }
    

    /**
     * Deletes an existing StandardOperation model.
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
     * Finds the StandardOperation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StandardOperation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StandardOperation::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
