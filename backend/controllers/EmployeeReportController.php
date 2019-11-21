<?php

namespace backend\controllers;

use Yii;
use backend\models\EmployeeReport;
use backend\models\Project;
use backend\models\EmployeeReportSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * EmployeeReportController implements the CRUD actions for EmployeeReport model.
 */
class EmployeeReportController extends Controller
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
     * Lists all EmployeeReport models.
     * @return mixed
     */
    // public function actionIndex()
    // {
    //     $current_page = Yii::$app->controller->id."-index";
    //     $this->view->params['current_page'] = $current_page;
    //
    //     $searchModel = new EmployeeReportSearch();
    //     $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
    //
    //     $total_items = $dataProvider->getTotalCount();
    //
    //     $page_size = array_values( Yii::$app->params['page_size'])[0];
    //     $page_size_cookie = $current_page.'_page_size';
    //     if(isset($_REQUEST["page_size"])){
    //         if(intval($_REQUEST["page_size"])>0){
    //             $page_size = intval($_REQUEST["page_size"]);
    //             $set_cookies = Yii::$app->response->cookies;
    //             $set_cookies->add(new Cookie([
    //             'name' => $page_size_cookie,
    //             'value' => $page_size,
    //             'expire' => time() + (86400 * 3),
    //             ]));
    //         }
    //     } else {
    //         $get_cookies = Yii::$app->request->cookies;
    //         if ($get_cookies->has($page_size_cookie)) {
    //             $page_size = $get_cookies->getValue($page_size_cookie);
    //         }
    //     }
    //
    //     $page = 0;
    //     $page_cookie = $current_page.'_page';
    //     if(isset($_REQUEST["page"])){
    //         if(intval($_REQUEST["page"])>0){
    //             $page = intval($_REQUEST["page"])-1;
    //             $set_cookies = Yii::$app->response->cookies;
    //             $set_cookies->add(new Cookie([
    //             'name' => $page_cookie,
    //             'value' => $page,
    //             'expire' => time() + (86400 * 3),
    //             ]));
    //         }
    //     } else {
    //         $get_cookies = Yii::$app->request->cookies;
    //         if ($get_cookies->has($page_cookie)) {
    //             $page = $get_cookies->getValue($page_cookie);
    //         }
    //     }
    //     $max_page = ceil($total_items / $page_size);
    //
    //     $decrease_page = 0;
    //     while($page + 1 > $max_page){
    //         $page=$page-1;
    //         $decrease_page = 1;
    //     }
    //     if($decrease_page==1){
    //         $set_cookies = Yii::$app->response->cookies;
    //         $set_cookies->add(new Cookie([
    //         'name' => $page_cookie,
    //         'value' => $page,
    //         'expire' => time() + (86400 * 3),
    //         ]));
    //     }
    //
    //     $dataProvider->pagination->pageSize = $page_size;
    //     $dataProvider->pagination->page = $page;
    //
    //     return $this->render('index', [
    //         'page_size' => $page_size,
    //         'searchModel' => $searchModel,
    //         'dataProvider' => $dataProvider,
    //     ]);
    // }

    /**
     * Displays a single EmployeeReport model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    // public function actionView($id)
    // {
    //     return $this->renderAjax('view', [
    //         'model' => $this->findModel($id),
    //     ]);
    // }
    public function actionReport()
    {
        $model = new EmployeeReport();
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        $employeeData = [];
        $employeeList = [];
        if ($model->load(Yii::$app->request->post())) {
          $from_date = $model->from_date;
          $to_date = $model->to_date;
          $id_employee = $model->id_employee;
          $status = $model->status;
          if($status !=""){
              $andStatus = "AND a.status = ".$status;
          }else{
              $andStatus = "";
          }
          if ($id_employee == "") {
            $andEmployee = "AND a.id = ".$id_employee;
          }else{
            $andEmployee = "";
          }
          $employeeList = Yii::$app->db->createCommand("
          select * from employee_profile a
          WHERE a.join_date BETWEEN :from_date AND :to_date $andStatus
          ")->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
        }
        // else {
        //   $employeeList = Yii::$app->db->createCommand("
        //   select * from employee_profile ")->queryAll();
        // } 
        
        if($is_print == 2)//export excel
        {
            return $this->renderAjax('_employee_export_excel', [
                'model' => $model,
                'employeeList' => $employeeList,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'employeeList' => $employeeList,
            ]);
        }else{
            return $this->render('_employee_report', [
                'model' => $model,
                'employeeList' => $employeeList,
    
            ]);
        } 

        
    }
    public function actionProject()
    {
        $model = new EmployeeReport();
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        $projectData = [];
        if ($model->load(Yii::$app->request->post())) {
          $from_date = $model->from_date;
          $to_date = $model->to_date;
          $id_customer = $model->id_customer;
          $id_employee = $model->id_employee;
          $status = $model->status;
          if($status !=""){
              $andStatus = "AND project.status = ".$status;
          }else{
              $andStatus = "";
          }
          if($id_customer !=""){
              $andCustomer = "AND project.id_customer = ".$id_customer;
          }else{
              $andCustomer = "";
          }
          if ($id_employee == "") {
          $projectList = Yii::$app->db->createCommand("
          select * from project
          WHERE project.start_date BETWEEN :from_date AND :to_date $andCustomer $andStatus
          ")->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
        }else {
          $projectList = Yii::$app->db->createCommand("
          SELECT * from project LEFT JOIN project_member on project.id = project_member.id_project
          WHERE project_member.id_employee = $id_employee
          AND project.start_date BETWEEN :from_date AND :to_date $andCustomer $andStatus
          ")->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
        }
        }
        else {
          $projectList = [];
        }

        if($is_print == 2)//export excel
        {
            return $this->renderAjax('_project_export_excel', [
                'model' => $model,
                'projectList' => $projectList,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'projectList' => $projectList,
            ]);
        }else{
            return $this->render('_project_report', [
                'model' => $model,
                'projectList' => $projectList,
    
            ]);
        }  
    }
    public function actionTasks()
    {
        $model = new EmployeeReport();
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        $taskData = [];
        if ($model->load(Yii::$app->request->post())) {
          $from_date = $model->from_date;
          $to_date = $model->to_date;
          $id_employee = $model->id_employee;
          $id_related_to = $model->id_related_to;
          $status = $model->status;
          if($status !=""){
              $andStatus = "AND task.status = ".$status;
          }else{
              $andStatus = "";
          }
          if($id_employee !=""){
              $andEmployee = "AND task_member.id_employee = ".$id_employee;
          }else{
              $andEmployee = "";
          }
          if($id_related_to !=""){
              $andRelatedTo = "AND task.id_related_to = ".$id_related_to;
          }else{
              $andRelatedTo = "";
          }
          $taskList = Yii::$app->db->createCommand("
          SELECT task.* from task LEFT JOIN task_member on task.id = task_member.id_task
          WHERE task.start_date BETWEEN :from_date AND :to_date $andEmployee $andRelatedTo $andStatus
          ")->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
        }
        else {
          $taskList = [];
        } 
        if($is_print == 2)//export excel
        {
            return $this->renderAjax('_tasks_export_excel', [
                'model' => $model,
                'taskList' => $taskList,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'taskList' => $taskList,
            ]);
        }else{
            return $this->render('_tasks_report', [
                'model' => $model,
                'taskList' => $taskList,
            ]);
        }  
        
    }
    /**
     * Creates a new EmployeeReport model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    // public function actionCreate()
    // {
    //     $model = new EmployeeReport();
    //
    //     $model->created_date =  date('Y-m-d H:i:s');
    //     $model->created_by = Yii::$app->user->getId();
    //     if ($model->load(Yii::$app->request->post()) && $model->save()) {
    //         Yii::$app->session->setFlash('success', "Saved successful");
    //         return $this->redirect(Yii::$app->request->referrer);
    //     }
    //
    //     return $this->renderAjax('create', [
    //         'model' => $model,
    //     ]);
    // }

    /**
     * Updates an existing EmployeeReport model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    // public function actionUpdate($id)
    // {
    //     $model = $this->findModel($id);
    //
    //     $model->updated_date =  date('Y-m-d H:i:s');
    //     $model->updated_by = Yii::$app->user->getId();
    //     if ($model->load(Yii::$app->request->post()) && $model->save()) {
    //         Yii::$app->session->setFlash('success', "Saved successful");
    //         return $this->redirect(Yii::$app->request->referrer);
    //     }
    //
    //     return $this->renderAjax('update', [
    //         'model' => $model,
    //     ]);
    // }

    /**
     * Deletes an existing EmployeeReport model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    // public function actionDelete($id)
    // {
    //     $this->findModel($id)->delete();
    //
    //     return $this->redirect(['index']);
    // }

    /**
     * Finds the EmployeeReport model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return EmployeeReport the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = EmployeeReport::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
