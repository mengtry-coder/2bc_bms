<?php

namespace backend\controllers;

use Yii;
use backend\models\Project;
use backend\models\ProjectSearch;
use backend\models\ProjectMember;
use backend\models\ProjectTag;
use backend\models\ProjectNote;
use backend\models\EmployeeProfile;
use backend\models\Task;
use backend\models\TaskSearch;
use backend\models\ProjectTimesheet;
use backend\models\ProjectTimesheetSearch;
use backend\models\CustomerInvoice;
use backend\models\CustomerInvoiceSearch;
use backend\models\CustomerPayment;
use backend\models\CustomerPaymentSearch;
use backend\models\Quotation;
use backend\models\QuotationSearch;
use backend\models\Expense;
use backend\models\ExpenseSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
use yii\helpers\Url;
use yii\helpers\FileHelper;
use backend\models\Document;
use backend\models\Folder;
use yii\imagine\Image;
/**
 * ProjectController implements the CRUD actions for Project model.
 */
class ProjectController extends Controller
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
     * Lists all Project models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        // daratester code
        $request = Yii::$app->request;
        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));
        $id_employee_profile = $request->get('id_employee_profile',0);
        $id_customer_profile = $request->get('id_customer_profile',0);
        if($id_employee_profile != 0){
            $this->layout="employee_layout";
            $user_id = Yii::$app->user->identity->id;
            $id_employee = Yii::$app->user->identity->id_employee;
            $user_type_id = Yii::$app->user->identity->user_type_id;
            
            if($user_type_id != 1 || $user_id != 1){ 
                if($id_employee != $id_employee_profile){  
                    return $this->redirect(['project/index','id_employee_profile'=>$id_employee,'smMenu'=>1]);
                }
            }

            $searchModel = new ProjectSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $idEmployee = Yii::$app->db->createCommand('
                select id_project from project_member where id_employee = "'.$id_employee_profile.'"
            ')->queryAll();
            $idProject = [];
            foreach ($idEmployee as $row)
            {
            $explode = explode(",", $row["id_project"]);
                foreach ($explode as $id){
                array_push($idProject,$id);
                }
            }

            $dataProvider->query->where(['in','project.id',$idProject]);

            $month_status_1 = Project::find()->where(['project.status'=>1])->andWhere(['in','project.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Project::find()->where(['project.status'=>2])->andWhere(['in','project.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Project::find()->where(['project.status'=>3])->andWhere(['in','project.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Project::find()->where(['project.status'=>4])->andWhere(['in','project.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Project::find()->where(['project.status'=>5])->andWhere(['in','project.id',$idProject])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Project::find()->where(['project.status'=>1])->andWhere(['in','project.id',$idProject])->count();
            $status_2 = Project::find()->where(['project.status'=>2])->andWhere(['in','project.id',$idProject])->count();
            $status_3 = Project::find()->where(['project.status'=>3])->andWhere(['in','project.id',$idProject])->count();
            $status_4 = Project::find()->where(['project.status'=>4])->andWhere(['in','project.id',$idProject])->count();
            $status_5 = Project::find()->where(['project.status'=>5])->andWhere(['in','project.id',$idProject])->count();

        } elseif($id_customer_profile != 0){
            $this->layout="customer_layout";
            $searchModel = new ProjectSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->andWhere(['id_customer'=>$id_customer_profile]);

            $month_status_1 = Project::find()->where(['status'=>1])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Project::find()->where(['status'=>2])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Project::find()->where(['status'=>3])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Project::find()->where(['status'=>4])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Project::find()->where(['status'=>5])->andWhere(['id_customer'=>$id_customer_profile])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Project::find()->where(['status'=>1])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_2 = Project::find()->where(['status'=>2])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_3 = Project::find()->where(['status'=>3])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_4 = Project::find()->where(['status'=>4])->andWhere(['id_customer'=>$id_customer_profile])->count();
            $status_5 = Project::find()->where(['status'=>5])->andWhere(['id_customer'=>$id_customer_profile])->count();

        } else {
            $searchModel = new ProjectSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $month_status_1 = Project::find()->where(['status'=>1])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_2 = Project::find()->where(['status'=>2])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_3 = Project::find()->where(['status'=>3])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_4 = Project::find()->where(['status'=>4])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
            $month_status_5 = Project::find()->where(['status'=>5])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

            $status_1 = Project::find()->where(['status'=>1])->count();
            $status_2 = Project::find()->where(['status'=>2])->count();
            $status_3 = Project::find()->where(['status'=>3])->count();
            $status_4 = Project::find()->where(['status'=>4])->count();
            $status_5 = Project::find()->where(['status'=>5])->count();
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
        ]);
    }

    /**
     * Displays a single Project model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionNote($id_project)
    {
        $id_user = Yii::$app->user->identity->id;
        $model_note = ProjectNote::findOne(['id_project'=>$id_project, 'id_user'=>$id_user]);
        if(empty($model_note)){
            $model_note = new ProjectNote();
        }

        $model = $this->findModel($id_project);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        if ($model_note->load(Yii::$app->request->post())) {

            $model_note->id_project = $id_project;
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

    public function actionMileStone($id_project)
    {
        $id_user = Yii::$app->user->identity->id;
        $model_note = ProjectNote::findOne(['id_project'=>$id_project, 'id_user'=>$id_user]);
        if(empty($model_note)){
            $model_note = new ProjectNote();
        }

        $model = $this->findModel($id_project);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        if ($model_note->load(Yii::$app->request->post())) {

            $model_note->id_project = $id_project;
            $model_note->id_user = $id_user;

            if($model_note->save()){
                Yii::$app->session->setFlash('success', "Record updated successfully");
                return $this->redirect(Yii::$app->request->referrer);
            }else{
                Yii::$app->session->setFlash('warning', "Failed to update record");
                return $this->redirect(Yii::$app->request->referrer);
            }
        }
        return $this->render('milestone', [
            'model' => $model,
            'model_note' => $model_note,
        ]);
    }

    /**
     * Creates a new Project model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Project();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                if($model->is_calculate ==0){
                    $model->project_progress = Yii::$app->request->post('project_range');
                }

                $model->is_pin = $model->id_priority == 4 ? 1 : 0;

                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new ProjectTag();
                        $tag->id_project = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new ProjectMember();
                        $assign->id_project = $model->id;
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

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $request = Yii::$app->request;

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();
        
        if ($model->load(Yii::$app->request->post())) {
            $model->is_under_kpi = $request->post('is_under_kpi');
            
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                if($model->is_calculate ==0){
                    $model->project_progress = Yii::$app->request->post('project_range');
                }

                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                ProjectTag::deleteAll(['id_project'=>$model->id]);
                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new ProjectTag();
                        $tag->id_project = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                ProjectMember::deleteAll(['id_project'=>$model->id]);
                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new ProjectMember();
                        $assign->id_project = $model->id;
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
        ]);
    }

    public function actionOverview($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        // daratester code
        $request = Yii::$app->request;
        $id_employee_profile = $request->get('id_employee_profile',0);
        $id_customer_profile = $request->get('id_customer_profile',0);
        if($id_employee_profile != 0){
            $this->layout="employee_layout";
        }
        if($id_customer_profile != 0){
            $this->layout="customer_layout";
        }
        // end daratester code
        $model = $this->findModel($id);

        $model_tag = ProjectTag::find()
            ->select('id_tag')
            ->where(['id_project'=>$model->id])
            ->all();

        $model_member = Yii::$app->db->createCommand("
            SELECT b.id, CONCAT(b.id_prefix, ' ', b.first_name, ' ', b.last_name) as employee_name , COALESCE(c.filename, (select filename from uploaded_file where id =1)) as img_url
            FROM project_member as a
            INNER JOIN employee_profile as b on a.id_employee = b.id
            LEFT JOIN uploaded_file as c on c.id = b.img_url
            WHERE a.id_project  = :id_project
        ")->bindParam(':id_project', $id)->queryAll();

        $all_task = Task::find()->where(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id])->count();
        $complete_task = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id])->count();

        return $this->render('view', [
            'model' => $model,
            'model_tag' => $model_tag,
            'model_member' => $model_member,
            'all_task' => $all_task,
            'complete_task' => $complete_task
        ]);
    }

    public function actionSaleInvoice($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new CustomerInvoiceSearch();
        $searchModel->id_project = $id_project;
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

        return $this->render('sale_invoice', [
            'model' => $model,
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSalePayment($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new CustomerPaymentSearch();
        $searchModel->id_project = $id_project;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->where(['customer_payment.id_project'=>$id_project]);

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

        return $this->render('sale_payment', [
            'model' => $model,
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSaleExpense($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new ExpenseSearch();
        $searchModel->id_related_to = 3;
        $searchModel->id_related_profile = $id_project;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        // $dataProvider->query->where(['id_related_to'=>3, 'id_related_profile'=>$id_project]);

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

        return $this->render('sale_expense', [
            'model' => $model,
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSaleQuotation($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new QuotationSearch();
        $searchModel->id_project = $id_project;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->where(['id_project'=>$id_project]);

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

        return $this->render('sale_quotation', [
            'model' => $model,
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionTask($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new TaskSearch();
        $searchModel->id_related_to = 1;
        $searchModel->id_related_profile = $id_project;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->where(['id_related_profile'=>$id_project])->andWhere(['id_related_to'=>1]);

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

        $day = date('Y-m-d');
        $month_start = date('Y-m-01');
        $month_end = date("Y-m-t", strtotime($day));

        $month_status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
        $month_status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
        $month_status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
        $month_status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->andWhere(['between', 'start_date', $month_start, $month_end])->count();
        $month_status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->andWhere(['between', 'start_date', $month_start, $month_end])->count();

        $status_1 = Task::find()->where(['status'=>1])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->count();
        $status_2 = Task::find()->where(['status'=>2])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->count();
        $status_3 = Task::find()->where(['status'=>3])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->count();
        $status_4 = Task::find()->where(['status'=>4])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->count();
        $status_5 = Task::find()->where(['status'=>5])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$id_project])->count();

        return $this->render('task_index', [
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
            'id_project' =>$id_project,
            'model' => $model
        ]);
    }

    public function actionTimesheet($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id_project);

        $searchModel = new ProjectTimesheetSearch();
        $searchModel->id_project = $id_project;
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

        return $this->render('timesheet_index', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'id_project' =>$id_project,
            'model' => $model
        ]);
    }

    public function actionValidation($id = null){

        $model = $id === null ? new Project : Project::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_project','project_id');
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

    public function actionPin($id)
    {
        $model = $this->findModel($id);
        if($model->is_pin == 0){
            $model->is_pin = 1;
        }else{
            $model->is_pin = 0;
        }

        if (!$model->save()) {
            Yii::$app->session->setFlash('warning', "Failed to update record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            Yii::$app->session->setFlash('success', "Record updated successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    public function actionCopy($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            { 
                $model_project = new Project();
                $model_project->project_name = $model->project_name;
                $model_project->id_customer = $model->id_customer;
                $model_project->project_progress = $model->is_calculate == 0 ? Yii::$app->request->post('project_range') : 0;
                $model_project->is_pin = $model->id_priority == 4 ? 1 : 0;
                $model_project->id_billing_type = $model->id_billing_type;
                $model_project->rate = $model->rate;
                $model_project->estimated_hour = $model->estimated_hour;
                $model_project->start_date = $model->start_date;
                $model_project->due_date = $model->due_date;
                $model_project->deadline = $model->deadline;
                $model_project->id_priority = $model->id_priority;
                $model_project->description = $model->description;
                $model_project->cut_off_day = $model->cut_off_day;
                $model_project->note = $model->note;
                $model_project->status = $model->status;
                $model_project->created_date =  date('Y-m-d H:i:s');
                $model_project->created_by = Yii::$app->user->getId();
                $model_project->updated_date =  date('Y-m-d H:i:s');
                $model_project->updated_by = Yii::$app->user->getId();
                if(!$model_project->save()) throw new Exception("Failed to copy project!");

                $checkbox_task = Yii::$app->request->post('checkbox_task');
                if($checkbox_task == 1){
                    $task_data = Task::findAll(['id_related_to' => 1,'id_related_profile'=>$id]);
                    if(!empty($task_data)){
                        foreach ($task_data as $key => $value) {
                            $data = new Task();
                            $data->task_name = $value->task_name;
                            $data->id_billing_type = $value->id_billing_type;
                            $data->rate = $value->rate;
                            $data->start_date = $value->start_date;
                            $data->due_date = $value->due_date;
                            $data->deadline = $value->deadline;
                            $data->id_priority = $value->id_priority;
                            $data->id_repeater = $value->id_repeater;
                            $data->id_related_to = 1;
                            $data->id_related_profile = $model_project->id;
                            $data->description = $value->description;
                            $data->status = 1;
                            $data->created_date =  date('Y-m-d H:i:s');
                            $data->created_by = Yii::$app->user->getId();
                            $data->updated_date =  date('Y-m-d H:i:s');
                            $data->updated_by = Yii::$app->user->getId();
                            if(!$data->save()) throw new Exception("Failed to save task!");

                            $task_tag = \backend\models\TaskTag::findAll(['id_task'=>$value->id]);
                            if(!empty($task_tag)){
                                foreach ($task_tag as $value_tag) {
                                    $tag = new \backend\models\TaskTag();
                                    $tag->id_task = $data->id;
                                    $tag->id_tag = $value_tag->id_tag;
                                    if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                                }
                            }

                            $task_member = \backend\models\TaskMember::findAll(['id_task'=>$value->id]);
                            if(!empty($task_member)){
                                foreach ($task_member as $value_member) {
                                    $member = new \backend\models\TaskMember();
                                    $member->id_task = $data->id;
                                    $member->id_employee = $value_member->id_employee;
                                    if(!$member->save()) throw new Exception("Failed to Assign Member!");
                                }
                            }
                        }
                    }
                }

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new ProjectTag();
                        $tag->id_project = $model_project->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new ProjectMember();
                        $assign->id_project = $model_project->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }

                $transaction_exception->commit();
                Yii::$app->session->setFlash('success', "Project copied successful");
                $this->redirect(['project/overview', 'id'=>$model_project->id]);
            }
            catch (Exception $ex)
            {
                Yii::$app->session->setFlash('warning', $ex->getMessage());
                $transaction_exception->rollBack();
                return $this->redirect(Yii::$app->request->referrer);
            }
        }

        return $this->renderAjax('copy', [
            'model' => $model,
        ]);

    }

    // Start Document Block
    public function actionDocument($id_project)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        // $request = Yii::$app->request;
        // $id_project = $request->get('id_project',0);
        // if($id_project != 0){
        //     $this->layout="customer_layout";
        // }
        return $this->render('document', [
            ]);
    }

    public function actionUpload($folder,$id_project)
    {

        $per_folder = Folder::find()->where(['status'=>1,'id'=>$folder])->all();

        //$per_folder = $folder == 0 ? 1 : $per_folder;
        if(!empty($per_folder)){
                //in this section folder with parent id will has real path as task's child
            $this->view->params['current_page'] = Yii::$app->controller->id."-index";
            $controller = Yii::$app->controller->id;
            $fileName = 'file';
            if (isset($_FILES[$fileName]))
            {
                $file = \yii\web\UploadedFile::getInstanceByName($fileName);

                $original_fileName = strtolower($file->name);
                $file_size = $file->size; // file size in bytes
                $server_path = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend';
                $directory = $server_path. "/uploads/$controller/$folder/";
                $filePath = Yii::getAlias("@web/backend/uploads/$controller/$folder/");
                $thumbDir = $server_path. "/uploads/thumb/$controller/$folder/";
                $thumbPath = Yii::getAlias("@web/backend/uploads/thumb/$controller/$folder/");
                $db_path = "uploads/$controller/$folder/";


                if (!is_dir($directory)) {
                FileHelper::createDirectory($directory);
                    //mkdir($directory);

                }
                if (!is_dir($thumbDir)) {
                    FileHelper::createDirectory($thumbDir);
                    //mkdir($thumbDir);
                }

                if (isset($file)) {
                    $file_extension = $file->extension;

                    $uid = uniqid(time(), true);

                    $fName = str_replace("." . $file_extension,"",$original_fileName);
                    $nUid = str_replace(".","",$uid);
                    $fileName = $fName . '-' . $nUid . '.' . $file_extension;
                    $filePath = $directory . $fileName;
                    if ($file->saveAs($filePath)) {

                        $path = $filePath . $fileName;

                        $file_path = $directory .  $fileName;

                        $file_thumb = $thumbDir .  $fileName;

                        $db_thumbnail_path = "";
                        if($file_extension == "gif" || $file_extension == "jpg"  || $file_extension=="png"){
                            Image::thumbnail($file_path, 64, 64)->save($file_thumb, ['quality' => 100]);
                            $file_thumb = $thumbPath .  $fileName;

                                $db_thumbnail_path  = "uploads/thumb/". $controller ."/".$folder."/". $fileName;
                                $file_extention = 0;
                        }elseif(
                        //file extenstion words
                        $file_extension == "doc" ||
                        $file_extension == "dot" ||
                        $file_extension == "wbk" ||
                        $file_extension == "docx" ||
                        $file_extension == "docm" ||
                        $file_extension == "dotx" ||
                        $file_extension == "dotm" ||
                        $file_extension == "docb"

                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-word.png';
                    }
                    elseif(
                        //file extenstion excel
                        $file_extension == "xls" ||
                        $file_extension == "xlt" ||
                        $file_extension == "xlm" ||
                        $file_extension == "xlsx" ||
                        $file_extension == "xlsm" ||
                        $file_extension == "xltx" ||
                        $file_extension == "xltm" ||
                        $file_extension == "xlsb" ||
                        $file_extension == "xla" ||
                        $file_extension == "xlam" ||
                        $file_extension == "xll" ||
                        $file_extension == "xlw"
                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-excel.png';
                    }
                    elseif(
                        //file extenstion power point
                        $file_extension == "ppt" ||
                        $file_extension == "pot" ||
                        $file_extension == "pps" ||
                        $file_extension == "pptx" ||
                        $file_extension == "pptm" ||
                        $file_extension == "potx" ||
                        $file_extension == "potm" ||
                        $file_extension == "ppam" ||
                        $file_extension == "ppsx" ||
                        $file_extension == "ppsm" ||
                        $file_extension == "sldx" ||
                        $file_extension == "sldm"

                        ){
                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-powerpoint.png';

                    }
                    elseif(
                        //file extenstion access
                        $file_extension == "accdb" ||
                        $file_extension == "accde" ||
                        $file_extension == "accdt" ||
                        $file_extension == "accdr"
                        ){
                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-access.png';

                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pub" ||
                        $file_extension == "xps"

                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-publisher.png';
                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pdf" ||
                        $file_extension == "html"

                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-pdf.png';
                    }else {

                        $file_extention = 1;    
                        $db_thumbnail_path = "thumbs/icon-default.jpg";
                        }
                        // Save file to database
                        $model_file = new Document();
                        $model_file->file_path =$db_path . $fileName;
                        $model_file->id_folder = $folder;
                        $model_file->thumbnail = $db_thumbnail_path;
                        $model_file->file_extention = $file_extention;
                        $model_file->file_size = $file_size;
                        $model_file->file_name = $original_fileName;
                        $model_file->created_by = Yii::$app->user->id;
                        $model_file->created_date = date('Y-m-d H:i:s');
                        $model_file->id_project = $id_project;
                        $model_file->status = 1;

                        //create permission
                        if($model_file->save()){

                                $id = $model_file->id;
                                $path = $db_path . $fileName;
                                $items = array(['name'=>$fileName,'id'=>$id,'thumbnail'=>$db_thumbnail_path,'path'=>$path]);
                                \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

                                return json_encode($items);
                                Yii::$app->session->setFlash('success', "Saved successful");
                        }else{
                            return 0;
                        }
                    }
                }

            }
        }else{
            return false;
        }
    }

    public function actionUploadDocument($folder){
        // $check = Folder::find()->where(['id'=>$folder])->all();
        // if(empty($check)){

        //     Yii::$app->request->referrer();
        // }
        return $this->renderAjax('upload',[
            'folder'=>$folder]);
    }
    //from dropzone
    public function actionRemoveFile()
    {

    $session = Yii::$app->getSession();
      $request= Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='remove_file'){
                $id= $request->post('id');
                $mm = Document::find()->where(['id'=>$id])->one();


                if(!empty($mm)){
                    $file_thumb = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->thumbnail;

                     $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->file_path;
                     if($mm->delete()){

                        if(file_exists($file_thumb) && file_exists($file)){

                            if(unlink($file_thumb)&&unlink($file)){

                                return 'Success';
                            }
                        }else{

                            throw new HttpException(500, "Error message");
                        }
                    }else{
                        throw new HttpException(500, "Error message");
                    }
                }else{
                   throw new HttpException(500, "Error message");
                }
            }

        }

    }

    //==== Start Folder block ====//
    public function actionCreateFolder()
    {
        $model = new Folder();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();

        // print_r($model->getAttributes());
        // exit();
        if ($model->load(Yii::$app->request->post())) {
            $check_folder_name = Yii::$app->db->createCommand('
            SELECT folder.folder_name as folder_name
            FROM folder
            WHERE folder.id_project = "'.$model->id_project.'"
            AND folder.folder_name = "'.$model->folder_name.'"
            ')->queryAll();
            if(count($check_folder_name)  >= 1 || $model->folder_name == "Home"){
                Yii::$app->session->setFlash('warning', "Folder is already existed.");
            }else{
                $model->save();
                Yii::$app->session->setFlash('success', "Saved successful");
            }
            return $this->redirect(Yii::$app->request->referrer);
        }


        return $this->renderAjax('create_folder', [
            'model' => $model,
        ]);
    }

    public function actionRenameFolder($id)
    {
        $model = $this->findModelFolder($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();

        if ($model->load(Yii::$app->request->post()))
        {
            $check_folder = Folder::find()->where(['status'=>1,'id'=>$id])->one();
            if($check_folder['folder_name'] != $model->folder_name)
            {

                $check_folder_name = Yii::$app->db->createCommand('
                SELECT folder.folder_name as folder_name
                    FROM folder
                WHERE folder.id_project = "'.$model->id_project.'"
                AND folder.folder_name = "'.$model->folder_name.'"
                ')->queryAll();
                if(count($check_folder_name) >= 1 || $model->folder_name == "Home"){
                    Yii::$app->session->setFlash('warning', "Folder is already existed.");
                }else{
                    $model->save();
                    Yii::$app->session->setFlash('success', "Saved successful");
                }

            }else{
                Yii::$app->session->setFlash('info', "Nothing changed.");
            }
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('rename_folder', [
            'model' => $model,
        ]);
    }

    public function actionGetInfo($id)
    {
        return $this->renderAjax('_get_info', [
            'model' => $this->findModelFolder($id),
        ]);
    }

    //from link
    public function actionRemove($id)
    {
        $session = Yii::$app->getSession();
        $mm = Document::find()->where(['id'=>$id])->one();
               
                 //$file_thumb = ''.$mm->image_thumbnail;
                // $file ="/../images/".$mm->file_url;
                if(!empty($mm)){
                    $file_thumb = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->thumbnail;

                    $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->file_path;
                    $file_extension = $mm->file_extention; 
                    
                    if($mm->delete()){
                        if($file_extension == 1){
                            if(file_exists($file)){
                                                
                                if(unlink($file)){
                                    
                                    Yii::$app->session->setFlash('success', "Deleted successful");
                                    return $this->redirect(Yii::$app->request->referrer);
                                
                                }
                            }else{

                            Yii::$app->session->setFlash('warning', "Error");
                                return $this->redirect(Yii::$app->request->referrer);
                            
                            }
                        }else{
                            if(file_exists($file_thumb) && file_exists($file)){
                                                
                                if(unlink($file_thumb)&&unlink($file)){
                                    
                                    Yii::$app->session->setFlash('success', "Deleted successful");
                                    return $this->redirect(Yii::$app->request->referrer);
                                
                                }
                            }else{

                            Yii::$app->session->setFlash('warning', "Error");
                                return $this->redirect(Yii::$app->request->referrer);
                            
                            }
                        }     
                    }else{
                         return $this->redirect(Yii::$app->request->referrer);
                           
                    }
                }else{
                     return $this->redirect(Yii::$app->request->referrer);
                            
                   //throw new HttpException(500, "Error message");
                }
    }

    public function actionDownload($id) {

        ini_set('max_execution_time', 5*60); // 5 minutes

        $mm = Document::find()->where(['id'=>$id])->one();

        $path = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/';


       $file = $path .$mm->file_path;

       if (file_exists($file)) {

       Yii::$app->response->sendFile($file);

      }else{
         return $this->redirect(Yii::$app->request->referrer);
    }

    }

    public function actionDeleteFolder($id)
    {
        $check_folder_in_use = Yii::$app->db->createCommand('
            SELECT id FROM document WHERE id_folder = :id
        ')->bindParam(':id',$id)->queryAll();
        if(count($check_folder_in_use) <= 0){
            $this->findModelFolder($id)->delete();
            Yii::$app->session->setFlash('success', "Deleted successful");
        }else{
            Yii::$app->session->setFlash('warning', "Delete failed, Folder in use!");
        }
        return $this->redirect(Yii::$app->request->referrer);
    }
    //==== End Folder block ====//
    public function actionDependentFolder(){
        $request = Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='get_data_folder'){
                $id_folder = $request->post('id_folder');
                $id_project = $request->post('id_project');
                $response = Yii::$app->db->createCommand('
                SELECT
                document.*,
                folder.folder_name as folder_name,
                user.username as name_creater
                FROM document
                LEFT JOIN folder on folder.id = document.id_folder
                LEFT JOIN user on user.id = document.created_by
                WHERE document.id_folder = :id_folder
                and document.id_project = :id_project
                ')->bindParam(':id_project',$id_project)->bindParam(':id_folder',$id_folder)->queryAll();
                return json_encode($response);
            }

            if($request->post('action')=='get_data_crum_folder_name'){
                $id_folder = $request->post('id_folder');
                $response = Yii::$app->db->createCommand('
                SELECT
                folder.*
                FROM folder
                WHERE folder.id = :id_folder
                ')->bindParam(':id_folder',$id_folder)->queryAll();
                return json_encode($response);
            }

        }
    }
    // End Document

    protected function findModel($id)
    {
        if (($model = Project::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    protected function findModelFolder($id)
    {
        if (($model = Folder::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }


    // public function actionMyProject($user)
    // {
    //     $model_user = \common\models\User::findOne($user);
    //     $id_employee = $model_user->id_employee;

    //     $this->layout = 'blank_layout';

    //     $today = date('Y-m-d');

    //     $model_project = Yii::$app->db->createCommand("
    //         SELECT b.id, b.project_name, (select count(id) from task where id_related_to = 1 and id_related_profile = b.id) as total_task
    //         from project_member as a
    //         inner join project as b on a.id_project = b.id
    //         where a.id_employee = :id_employee
    //         and :today between b.start_date and b.deadline
    //     ")->bindParam(':id_employee', $id_employee)
    //     ->bindParam(':today', $today)
    //     ->queryAll();

    //     $model_project = empty($model_project) ? [] : $model_project;

    //     return $this->render('user_index', [
    //         'model_user' => $model_user,
    //         'model_project' => $model_project
    //     ]);
    // }

    public function actionMyTask($user)
    {
        $id_user = $user;
        $model_user = \common\models\User::findOne($id_user);
        $id_employee = $model_user->id_employee;

        $this->layout = 'blank_layout';

        $today = date('Y-m-d');

        // (CASE
        //      WHEN id_related_to = 1 THEN (SELECT CONCAT('Porject: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 2 THEN (SELECT CONCAT('Invoice: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 3 THEN (SELECT CONCAT('Customer: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 4 THEN (SELECT CONCAT('Expense: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 5 THEN (SELECT CONCAT('Contract: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 6 THEN (SELECT CONCAT('Lead: ' ,project_name) FROM project WHERE id = id_related_profile)
        //      WHEN id_related_to = 7 THEN (SELECT CONCAT('Proposal: ' ,project_name) FROM project WHERE id = id_related_profile)
        // END) as related_to

        $model_task = Yii::$app->db->createCommand("
            SELECT 
                b.id, 
                b.task_name, 
                (select count(id) from task_check_list where id_task = b.id) as total_activity,
                CONCAT('Project: ' ,c.project_name) as related_to
            from task_member as a
            inner join task as b on a.id_task = b.id
            inner join project as c on c.id = b.id_related_profile
            where a.id_employee = :id_employee
            and b.id_related_to = 1
            and :today between b.start_date and b.deadline
        ")->bindParam(':id_employee', $id_employee)->bindParam(':today', $today)->queryAll();

        $model_task = empty($model_task) ? [] : $model_task;

        return $this->render('user_task', [
            'model_user' => $model_user,
            'model_task' => $model_task
        ]);
    }

    public function actionMyTaskChecklist($id)
    {
        $id_user = Yii::$app->user->getId();
        $model_user = \common\models\User::findOne($id_user);
        $id_employee = $model_user->id_employee;

        $this->layout = 'blank_layout';

        $today = date('Y-m-d');

        $model_task = \backend\models\Task::findOne($id);

        $model_item = \backend\models\TaskCheckList::findAll(['id_task' => $id]);
        $model_item = empty($model_item) ? [] : $model_item;

        $request = Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='add_activity'){

                $id_activity = $request->post('id_activity');
                $model_check_list = \backend\models\TaskCheckList::findOne(['id_task' => $id, 'id'=>$id_activity]);
                $model_check_list->status = 1;
                $model_check_list->save();
                return;
            }
            if($request->post('action')=='remove_activity'){

                $id_activity = $request->post('id_activity');
                $model_check_list = \backend\models\TaskCheckList::findOne(['id_task' => $id, 'id'=>$id_activity]);
                $model_check_list->status = 0;
                $model_check_list->save();
                return;
            }
        }

        return $this->render('user_task_checklist', [
            'model_user' => $model_user,
            'model_item' => $model_item,
            'task_id' => $id,
            'model_task' => $model_task
        ]);
    }


}
