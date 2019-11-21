<?php

namespace backend\controllers;

use Yii;
use backend\models\Task;
use backend\models\TaskCheckList;
use backend\models\TaskSearch;
use backend\models\TaskTag;
use backend\models\TaskMember;
use backend\models\EmployeeProfile;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
use backend\models\User;
use backend\models\StandardOperationSearch;
use backend\models\StandardOperation;
use backend\models\StandardOperationStep;
use backend\models\StandardOperationMember;
use backend\models\StandardOperationCheckList;

/**
 * TaskController implements the CRUD actions for Task model.
 */
class TaskController extends Controller
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
                    'actions' =>User::getUserPermission(Yii::$app->controller->id),
                    'roles' => ['@'],
                    ]
                 ]
            ],
        ];
    }

    /**
     * Lists all Task models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        // daratester code 
        $sop_searchModel = new StandardOperationSearch();
        $sop_model = new StandardOperation();
        $user_position = Yii::$app->user->identity->id_position;
        if(Yii::$app->user->identity->user_type_id != 1){
            $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position'=>$user_position])->all();
        }else{
            $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position'=>1])->orderBy(['sort'=>SORT_ASC])->all();
            if ($sop_model->load(Yii::$app->request->get())) { 
                $standardOperationStep = StandardOperationStep::find()->where(['status'=>1])->andWhere(['id_employee_position' => $sop_model->id_emp_position])->orderBy(['sort'=>SORT_ASC])->all();
             }
        }  

        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));
        $request = Yii::$app->request;
        $id_employee_profile = $request->get('id_employee_profile',0);
        $id_customer_profile = $request->get('id_customer_profile',0);
        $id_contract = $request->get('id_contract',0);
        $id_lead_profile = $request->get('id_lead_profile',0);
        if($id_employee_profile != 0){
            $this->layout="employee_layout";
            $user_id = Yii::$app->user->identity->id;
            $id_employee = Yii::$app->user->identity->id_employee;
            $user_type_id = Yii::$app->user->identity->user_type_id;
            
            if($user_type_id != 1 || $user_id != 1){ 
                if($id_employee != $id_employee_profile){  
                    return $this->redirect(['task/index','id_employee_profile'=>$id_employee,'smMenu'=>1]);
                }
            }
            $searchModel = new TaskSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['is_related_kpi'=>0]);
            $idEmployee = Yii::$app->db->createCommand('
                select id_task from task_member where id_employee = "'.$id_employee_profile.'"
            ')->queryAll(); 
            $idProject = []; 
            foreach ($idEmployee as $row)
            { 
            $explode = explode(",", $row["id_task"]);
                foreach ($explode as $id){
                array_push($idProject,$id);
                }
            } 
            
            $dataProvider->query->where(['in','task.id',$idProject]);
            $month_status_1 = Task::find()->where(['task.status'=>1])->andWhere(['in','task.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Task::find()->where(['task.status'=>2])->andWhere(['in','task.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Task::find()->where(['task.status'=>3])->andWhere(['in','task.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Task::find()->where(['task.status'=>4])->andWhere(['in','task.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Task::find()->where(['task.status'=>5])->andWhere(['in','task.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Task::find()->where(['task.status'=>1])->andWhere(['in','task.id',$idProject])->count();
            $status_2 = Task::find()->where(['task.status'=>2])->andWhere(['in','task.id',$idProject])->count();
            $status_3 = Task::find()->where(['task.status'=>3])->andWhere(['in','task.id',$idProject])->count();
            $status_4 = Task::find()->where(['task.status'=>4])->andWhere(['in','task.id',$idProject])->count();
            $status_5 = Task::find()->where(['task.status'=>5])->andWhere(['in','task.id',$idProject])->count();

        } elseif($id_customer_profile != 0){
            $this->layout="customer_layout";
            $searchModel = new TaskSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['id_related_to'=>3]); 
            $dataProvider->query->andWhere(['is_related_kpi'=>0]);
            $dataProvider->query->andWhere(['id_related_profile'=>$id_customer_profile]); 
            
            $month_status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->count();
            $status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->count();
            $status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->count();
            $status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->count();
            $status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 3])->andWhere(['id_related_profile'=>$id_customer_profile])->count();

        }elseif($id_contract != 0){
            $this->layout="contract_layout";
            $searchModel = new TaskSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['id_related_to'=>5]); 
            $dataProvider->query->andWhere(['is_related_kpi'=>0]);
            $dataProvider->query->andWhere(['id_related_profile'=>$id_contract]); 
            
            $month_status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->count();
            $status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->count();
            $status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->count();
            $status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->count();
            $status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 5])->andWhere(['id_related_profile'=>$id_contract])->count();

        }elseif($id_lead_profile != 0){
            $this->layout="lead_layout";
            $searchModel = new TaskSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['id_related_to'=>6]); 
            $dataProvider->query->andWhere(['is_related_kpi'=>0]);
            $dataProvider->query->andWhere(['id_related_profile'=>$id_lead_profile]); 
            
            $month_status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->count();
            $status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->count();
            $status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->count();
            $status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->count();
            $status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=> 6])->andWhere(['id_related_profile'=>$id_lead_profile])->count();

        } else {
            $searchModel = new TaskSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['is_related_kpi'=>0]);

            $month_status_1 = Task::find()->where(['status'=>1])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Task::find()->where(['status'=>2])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Task::find()->where(['status'=>3])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Task::find()->where(['status'=>4])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Task::find()->where(['status'=>5])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Task::find()->where(['status'=>1])->count();
            $status_2 = Task::find()->where(['status'=>2])->count();
            $status_3 = Task::find()->where(['status'=>3])->count();
            $status_4 = Task::find()->where(['status'=>4])->count();
            $status_5 = Task::find()->where(['status'=>5])->count();
            
        }  
        // end daratester codes 
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
            'status_1' => $status_1,
            'status_2' => $status_2,
            'status_3' => $status_3,
            'status_4' => $status_4,
            'status_5' => $status_5,
            'sop_model' => $sop_model,
            'standardOperationStep' => $standardOperationStep,
        ]);
    }

    public function actionMilestone()
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

 
    public function actionView($id, $smMenu)
    {
        $model = $this->findModel($id);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        if (Yii::$app->request->post()) {
            
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {

                if(!$model->save()) throw new Exception("Failed to save!");
                $check_list_status = Yii::$app->request->post('check_list_status');
                $description = Yii::$app->request->post('description');
                $start_time = Yii::$app->request->post('start_time');
                $end_time = Yii::$app->request->post('end_time');

                TaskCheckList::deleteAll(['id_task'=>$model->id]);
                if((!empty($description)) || ($description != '')){
                    foreach ($description as $key => $value) {
                        $data = new TaskCheckList();
                        $data->id_task = $model->id;
                        $data->description = $description[$key];
                        $data->from_time = $start_time[$key];
                        $data->to_time = $end_time[$key];
                        $data->status = $check_list_status[$key];
                        if(!$data->save()) throw new Exception("Failed to save check list!");
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

        $model_item = TaskCheckList::findAll(['id_task' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        $model_tag = TaskTag::findAll(['id_task' => $model->id]);
        $model_tag = empty($model_tag) ? [] : $model_tag;

        $model_member = Yii::$app->db->createCommand("
            SELECT b.id, CONCAT(b.id_prefix, ' ', b.first_name, ' ', b.last_name) as employee_name , COALESCE(c.filename, (select filename from uploaded_file where id =1)) as img_url
            FROM task_member as a
            INNER JOIN employee_profile as b on a.id_employee = b.id
            LEFT JOIN uploaded_file as c on c.id = b.img_url
            WHERE a.id_task  = :id_task
        ")->bindParam(':id_task', $id)->queryAll();

        return $this->render('view', [
            'model' => $model,
            'model_item' => $model_item,
            'model_tag' => $model_tag,
            'model_member' => $model_member,
        ]);
    }
 
    public function actionCreate($source_id, $type)
    {
        $model = new Task();
        $request = Yii::$app->request;
        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        // print_r($model);
        if ($model->load(Yii::$app->request->post())) {
            $is_related_kpi = $request->post('is_related_kpi'); 
            $model->is_related_kpi = $is_related_kpi[0]; 
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {    
                
                if($model->id_assign_type == 0){ //GROUP

                    if(!$model->save()) throw new Exception("Failed to Save!");
                    
                    $tag = Yii::$app->request->post('tag');

                    if((!empty($tag)) || ($tag != '')){
                        foreach ($tag as $key) {
                            $tag = new TaskTag();
                            $tag->id_task = $model->id;
                            $tag->id_tag = $key;
                            if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                        }
                    }  
                    $assign_user = Yii::$app->request->post('assign_to');
                    if((!empty($assign_user)) || ($assign_user != '')){
                        foreach ($assign_user as $au) {
                            $assign = new TaskMember();
                            $assign->id_task = $model->id;
                            $assign->id_employee = $au;
                            if(!$assign->save()) throw new Exception("Failed to Assign User!");
                        }
                    }

                    $check_list_status = Yii::$app->request->post('check_list_status');
                    $description = Yii::$app->request->post('description');
                    $start_time = Yii::$app->request->post('start_time');
                    $end_time = Yii::$app->request->post('end_time');

                    if((!empty($description)) || ($description != '')){
                        foreach ($description as $key => $value) {
                            $data = new TaskCheckList();
                            $data->id_task = $model->id;
                            $data->description = $description[$key];
                            $data->from_time = $start_time[$key];
                            $data->to_time = $end_time[$key];
                            $data->status = $check_list_status[$key];
                            if(!$data->save()) throw new Exception("Failed to save check list!");
                        }
                    }
                    if($is_related_kpi[0] == 1){  
                        $standard_operation = new StandardOperation();
                        $standard_operation->name = $model->task_name;
                        $standard_operation->id_task = $model->id;
                        $standard_operation->task_status = $model->status;
                        $standard_operation->id_priority = $model->id_priority;
                        $standard_operation->id_related_to = $model->id_related_to; 
                        $standard_operation->id_related_profile = $model->id_related_profile; 
                        $standard_operation->description = $model->description; 
                        $standard_operation->id_employee_position = $model->id_employee_position;
                        $standard_operation->id_standard_operation_step = $model->kpi_status;
                        $standard_operation->start_date = $model->start_date;
                        $standard_operation->due_date = $model->due_date;
                        $standard_operation->deadline = $model->deadline;
                        $standard_operation->status = 1;
                        $standard_operation->created_by = $model->created_by;
                        $standard_operation->created_date = $model->created_date;
                        if(!$standard_operation->save()) throw new Exception("Failed to save SOP!"); 
                        $assign_user = Yii::$app->request->post('assign_to');
                        
                        if((!empty($assign_user)) || ($assign_user != '')){
                            foreach ($assign_user as $au) { 
                                $ag = new StandardOperationMember();
                                $ag->id_standard_operation = $standard_operation->id;
                                $ag->id_employee = $au;
                                if(!$ag->save()) throw new Exception("Failed to Assign User!");
                            }
                        }
                    }

                }else{

                    $assign_user = Yii::$app->request->post('assign_to');

                    if(!empty($assign_user)){
                        if(count($assign_user) > 1){
                            foreach ($assign_user as $au) {
                                $clone_model = new Task();
                                $clone_model->task_name = $model->task_name;
                                $clone_model->id_billing_type = $model->id_billing_type;
                                $clone_model->rate = $model->rate;
                                $clone_model->start_date = $model->start_date;
                                $clone_model->due_date = $model->due_date;
                                $clone_model->deadline = $model->deadline;
                                $clone_model->id_priority = $model->id_priority;
                                $clone_model->id_repeater = $model->id_repeater;
                                $clone_model->id_employee_position = $model->id_employee_position;
                                $clone_model->id_related_to = $model->id_related_to;
                                $clone_model->id_related_profile = $model->id_related_profile;
                                $clone_model->description = $model->description;
                                $clone_model->status = $model->status;
                                $clone_model->updated_by = $model->updated_by;
                                $clone_model->updated_date = $model->updated_date;
                                $clone_model->created_by = $model->created_by;
                                $clone_model->created_date = $model->created_date;
                                $clone_model->id_assign_type = $model->id_assign_type;
                                if(!$clone_model->save()) throw new Exception("Failed to clone data!");

                                $check_list_status = Yii::$app->request->post('check_list_status');
                                $description = Yii::$app->request->post('description');
                                $start_time = Yii::$app->request->post('start_time');
                                $end_time = Yii::$app->request->post('end_time');

                                if((!empty($description)) || ($description != '')){
                                    foreach ($description as $key => $value) {
                                        $data = new TaskCheckList();
                                        $data->id_task = !empty($clone_model) ? $clone_model->id : $model->id;
                                        $data->description = $description[$key];
                                        $data->from_time = $start_time[$key];
                                        $data->to_time = $end_time[$key];
                                        $data->status = $check_list_status[$key];
                                        if(!$data->save()) throw new Exception("Failed to save check list!");
                                    }
                                }

                                $assign = new TaskMember();
                                $assign->id_task = !empty($clone_model) ? $clone_model->id : $model->id;
                                $assign->id_employee = $au;
                                if(!$assign->save()) throw new Exception("Failed to Assign User!");

                                $tag = Yii::$app->request->post('tag');
                                if((!empty($tag)) || ($tag != '')){
                                    foreach ($tag as $key) {
                                        $tag = new TaskTag();
                                        $tag->id_task = !empty($clone_model) ? $clone_model->id : $model->id;
                                        $tag->id_tag = $key;
                                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                                    }
                                }
                            }

                        }else{
                            if(!$model->save()) throw new Exception("Failed to Save!");
                            $tag = Yii::$app->request->post('tag');

                            if((!empty($tag)) || ($tag != '')){
                                foreach ($tag as $key) {
                                    $tag = new TaskTag();
                                    $tag->id_task = $model->id;
                                    $tag->id_tag = $key;
                                    if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                                }
                            }

                            $assign_user = Yii::$app->request->post('assign_to');
                            if((!empty($assign_user)) || ($assign_user != '')){
                                foreach ($assign_user as $au) {
                                    $assign = new TaskMember();
                                    $assign->id_task = $model->id;
                                    $assign->id_employee = $au;
                                    if(!$assign->save()) throw new Exception("Failed to Assign User!");
                                }
                            }

                            $check_list_status = Yii::$app->request->post('check_list_status');
                            $description = Yii::$app->request->post('description');
                            $start_time = Yii::$app->request->post('start_time');
                            $end_time = Yii::$app->request->post('end_time');

                            if((!empty($description)) || ($description != '')){
                                foreach ($description as $key => $value) {
                                    $data = new TaskCheckList();
                                    $data->id_task = $model->id;
                                    $data->description = $description[$key];
                                    $data->from_time = $start_time[$key];
                                    $data->to_time = $end_time[$key];
                                    $data->status = $check_list_status[$key];
                                    if(!$data->save()) throw new Exception("Failed to save check list!");
                                }
                            }
                        
                        }
                    }else{
                        if(!$model->save()) throw new Exception("Failed to Save!");
                        $tag = Yii::$app->request->post('tag');

                        if((!empty($tag)) || ($tag != '')){
                            foreach ($tag as $key) {
                                $tag = new TaskTag();
                                $tag->id_task = $model->id;
                                $tag->id_tag = $key;
                                if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                            }
                        }

                        $assign_user = Yii::$app->request->post('assign_to');
                        if((!empty($assign_user)) || ($assign_user != '')){
                            foreach ($assign_user as $au) {
                                $assign = new TaskMember();
                                $assign->id_task = $model->id;
                                $assign->id_employee = $au;
                                if(!$assign->save()) throw new Exception("Failed to Assign User!");
                            }
                        }

                        $check_list_status = Yii::$app->request->post('check_list_status');
                        $description = Yii::$app->request->post('description');
                        $start_time = Yii::$app->request->post('start_time');
                        $end_time = Yii::$app->request->post('end_time');

                        if((!empty($description)) || ($description != '')){
                            foreach ($description as $key => $value) {
                                $data = new TaskCheckList();
                                $data->id_task = $model->id;
                                $data->description = $description[$key];
                                $data->from_time = $start_time[$key];
                                $data->to_time = $end_time[$key];
                                $data->status = $check_list_status[$key];
                                if(!$data->save()) throw new Exception("Failed to save check list!");
                            }
                        }
                    
                    }
                    if(!$model->save()) throw new Exception("Failed to Save!");
                    if($is_related_kpi[0] == 1){  
                        $standard_operation = new StandardOperation();
                        $standard_operation->name = $model->task_name;
                        $standard_operation->id_task = $model->id;
                        $standard_operation->task_status = $model->status;
                        $standard_operation->id_priority = $model->id_priority;
                        $standard_operation->id_related_to = $model->id_related_to; 
                        $standard_operation->id_related_profile = $model->id_related_profile; 
                        $standard_operation->description = $model->description; 
                        $standard_operation->id_employee_position = $model->id_employee_position;
                        $standard_operation->id_standard_operation_step = $model->kpi_status;
                        $standard_operation->start_date = $model->start_date;
                        $standard_operation->due_date = $model->due_date;
                        $standard_operation->deadline = $model->deadline;
                        $standard_operation->status = 1;
                        $standard_operation->created_by = $model->created_by;
                        $standard_operation->created_date = $model->created_date;
                        if(!$standard_operation->save()) throw new Exception("Failed to save SOP!"); 
                        $assign_user = Yii::$app->request->post('assign_to');
                        
                        if((!empty($assign_user)) || ($assign_user != '')){
                            foreach ($assign_user as $au) { 
                                $ag = new StandardOperationMember();
                                $ag->id_standard_operation = $standard_operation->id;
                                $ag->id_employee = $au;
                                if(!$ag->save()) throw new Exception("Failed to Assign User!");
                            }
                        }
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
            'source_id'=>$source_id,
            'type'=>$type
        ]);
    }
 
    public function actionUpdate($id)
    {
    $model = $this->findModel($id);
        $request = Yii::$app->request;
        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        $model_item = TaskCheckList::findAll(['id_task' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;
         
        if ($model->load(Yii::$app->request->post())) {
            // $is_related_kpi = $request->post('is_related_kpi',0);
            // $model->is_related_kpi = $is_related_kpi;
            
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                TaskTag::deleteAll(['id_task'=>$model->id]);
                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new TaskTag();
                        $tag->id_task = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                
                TaskMember::deleteAll(['id_task'=>$model->id]);
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new TaskMember();
                        $assign->id_task = $model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }

                $check_list_status = Yii::$app->request->post('check_list_status');
                $description = Yii::$app->request->post('description');
                $start_time = Yii::$app->request->post('start_time');
                $end_time = Yii::$app->request->post('end_time');

                TaskCheckList::deleteAll(['id_task'=>$model->id]);
                if((!empty($description)) || ($description != '')){
                    foreach ($description as $key => $value) {
                        $data = new TaskCheckList();
                        $data->id_task = $model->id;
                        $data->description = $description[$key];
                        $data->from_time = $start_time[$key];
                        $data->to_time = $end_time[$key];
                        $data->status = $check_list_status[$key];
                        if(!$data->save()) throw new Exception("Failed to save check list!");
                    }
                }

                $description = Yii::$app->request->post('description');  
                $is_done = Yii::$app->request->post('is_done');
                $done_date = Yii::$app->request->post('done_date'); 
                $sop_step_list = Yii::$app->request->post('sop_step_list'); 
                StandardOperationCheckList::deleteAll(['id_standard_operation_step'=>$model->kpi_status,'id_standard_operation'=>$model->id]);
                StandardOperationMember::deleteAll(['id_standard_operation'=>$model->id]);
                
                
                if (!empty($description))
                {
                    foreach ($description as $key => $descriptions)
                    { 
                        $sopCheckList = new StandardOperationCheckList();
                        $sopCheckList->id_standard_operation = $model->id;
                        $sopCheckList->id_standard_operation_step = $model->kpi_status;
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
            ]); 
    }

    public function actionCopy($id)
    {
        $model = $this->findModel($id);

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 

        $model_item = TaskCheckList::findAll(['id_task' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        if ($model->load(Yii::$app->request->post())) {
            $is_related_kpi = $request->post('is_related_kpi',0);
            $model->is_related_kpi = $is_related_kpi;
            $transaction_exception = Yii::$app->db->beginTransaction();
            if($is_related_kpi[0] == 1){
                 
                $standard_operation = new StandardOperation();
                $standard_operation->name = $model->task_name;
                $standard_operation->id_priority = $model->id_priority;
                $standard_operation->id_related_to = $model->id_related_to; 
                $standard_operation->id_related_profile = $model->id_related_profile; 
                $standard_operation->description = $model->description; 
                $standard_operation->id_employee_position = $model->id_employee_position;
                $standard_operation->id_standard_operation_step = $model->kpi_status;
                $standard_operation->start_date = $model->start_date;
                $standard_operation->due_date = $model->due_date;
                $standard_operation->deadline = $model->deadline;
                $standard_operation->status = 1;
                $standard_operation->created_by = $model->created_by;
                $standard_operation->created_date = $model->created_date;
                if(!$standard_operation->save()) throw new Exception("Failed to save SOP!");

                $assign_user = Yii::$app->request->post('assign_to');
                
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                         
                        $ag = new StandardOperationMember();
                        $ag->id_standard_operation = $standard_operation->id;
                        $ag->id_employee = $au;
                        if(!$ag->save()) throw new Exception("Failed to Assign User!");
                    }
                }
            }
            try 
            {   
                $clone_model = new Task();
                $clone_model->task_name = $model->task_name;
                $clone_model->id_billing_type = $model->id_billing_type;
                $clone_model->rate = $model->rate;
                $clone_model->start_date = $model->start_date;
                $clone_model->due_date = $model->due_date;
                $clone_model->deadline = $model->deadline;
                $clone_model->id_priority = $model->id_priority;
                $clone_model->id_repeater = $model->id_repeater;
                $clone_model->id_related_to = $model->id_related_to;
                $clone_model->id_related_profile = $model->id_related_profile;
                $clone_model->description = $model->description;
                $clone_model->status = $model->status;
                $clone_model->updated_by = $model->updated_by;
                $clone_model->updated_date = $model->updated_date;
                $clone_model->created_by = $model->created_by;
                $clone_model->created_date = $model->created_date;
                $clone_model->id_assign_type = $model->id_assign_type;
                if(!$clone_model->save()) throw new Exception("Failed to clone data!");

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new TaskTag();
                        $tag->id_task = $clone_model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new TaskMember();
                        $assign->id_task = $clone_model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }

                $check_list_status = Yii::$app->request->post('check_list_status');
                $description = Yii::$app->request->post('description');
                $start_time = Yii::$app->request->post('start_time');
                $end_time = Yii::$app->request->post('end_time');

                if((!empty($description)) || ($description != '')){
                    foreach ($description as $key => $value) {
                        $data = new TaskCheckList();
                        $data->id_task = $clone_model->id;
                        $data->description = $description[$key];
                        $data->from_time = $start_time[$key];
                        $data->to_time = $end_time[$key];
                        $data->status = $check_list_status[$key];
                        if(!$data->save()) throw new Exception("Failed to save check list!");
                    }
                }
                
                $transaction_exception->commit();
                Yii::$app->session->setFlash('success', "Copy successful");
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
        ]);
    }

    public function actionValidation($id = null){

        $model = $id === null ? new Task : Task::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_profile'){
                $id = Yii::$app->request->post('id');
                $response = [];
                if($id == 1){ //Project
                    $response = Yii::$app->db->createCommand("
                        SELECT id, project_name as profile_name
                        FROM project
                        -- WHERE is_under_kpi = 1
                    ")->queryAll();
                } else if($id == 2){ //Invoice
                    $response = Yii::$app->db->createCommand("
                        SELECT a.id, CONCAT(b.customer_name, ' (', b.company_name,')') as profile_name
                        FROM customer_invoice as a
                        INNER JOIN customer_profile as b on a.id_customer = b.id
                    ")->queryAll();
                } else if($id == 3){ //Customer
                    $response = Yii::$app->db->createCommand("
                        SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
                        FROM customer_profile
                    ")->queryAll();
                } else if($id == 4){ //Expense
                    $response = Yii::$app->db->createCommand("
                        SELECT id, 
                            (CASE
                                WHEN id_related_to = 1 THEN (SELECT CONCAT(supplier_name, ' (', company_name,')') FROM supplier_profile WHERE id = id_related_profile)
                                WHEN id_related_to = 2 THEN (SELECT CONCAT(customer_name, ' (', company_name,')') FROM customer_profile WHERE id = id_related_profile)
                                WHEN id_related_to = 3 THEN (SELECT project_name FROM project WHERE id = id_related_profile)
                            END) as profile_name
                        FROM expense
                    ")->queryAll();
                } else if($id == 5){ //Contract
                    $response = Yii::$app->db->createCommand("
                        SELECT id, subject as profile_name
                        FROM contract
                    ")->queryAll();
                } else if($id == 6){ //Lead
                    $response = Yii::$app->db->createCommand("
                        SELECT id, CONCAT(lead_name, ' (', company_name,')') as profile_name
                        FROM lead_profile
                        WHERE customer_status <> 6 
                    ")->queryAll();
                } else if($id == 7){ //Proposal
                    $response = Yii::$app->db->createCommand("
                        SELECT id, name as profile_name
                        FROM proposal
                    ")->queryAll();
                } else if($id == 8){ //Other Activity
                    $response = Yii::$app->db->createCommand("
                        SELECT '8' as id, 'Other activity' as profile_name
                        FROM proposal
                    ")->queryAll();
                } 
                return json_encode($response);
            }

            if(Yii::$app->request->post('action') =='get_profile_detail'){
                $id = Yii::$app->request->post('id');
                $id_related = Yii::$app->request->post('id_related');
                $response = [];
                if($id_related == 1){ //Project
                    $response = Yii::$app->db->createCommand("
                        SELECT *
                        FROM project
                        WHERE id = :id
                    ")->bindParam(':id', $id)->queryOne();
                } else if($id_related == 2){ //Invoice

                } else if($id_related == 3){ //Customer
                    $response = Yii::$app->db->createCommand("
                        SELECT *
                        FROM customer_profile
                        WHERE id = :id
                    ")->bindParam(':id', $id)->queryOne();
                } else if($id_related == 4){ //Expense
                    
                } else if($id_related == 5){ //Contract
                    
                } else if($id_related == 6){ //Lead
                    
                } else if($id_related == 7){ //Proposal
                    
                }
                return json_encode($response);
            }

            if(Yii::$app->request->post('action') =='get_position'){
                $id = Yii::$app->request->post('id');

                $response = \backend\models\EmployeePosition::find()
                ->where(['id_department' => $id])
                ->asArray()
                ->all();
                return json_encode($response);
            }
        }
    }

    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_task','task_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer); 
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            TaskTag::deleteAll(['id_task'=>$model->id]);
            TaskMember::deleteAll(['id_task'=>$model->id]);
            
            Yii::$app->session->setFlash('error', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    protected function findModel($id)
    {
        if (($model = Task::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    protected function findModelSOP($id)
    {
        if (($model = StandardOperation::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}
