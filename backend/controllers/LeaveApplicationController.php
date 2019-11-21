<?php

namespace backend\controllers;

use Yii;
use backend\models\LeaveApplication;
use backend\models\LeaveApplicationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * LeaveApplicationController implements the CRUD actions for LeaveApplication model.
 */
class LeaveApplicationController extends Controller
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
     * Lists all LeaveApplication models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $id_approver = Yii::$app->user->identity->id_employee;
        
        $is_approval = Yii::$app->db->createCommand('
            SELECT
                hr_approval_permission_data.id as is_appoval,
                hr_approval_permission_data.employee_id as employee_id
            FROM hr_approval_permission_data
            LEFT JOIN hr_approval_permission on hr_approval_permission.id = hr_approval_permission_data.hr_approval_permission_id
            WHERE hr_approval_permission.approver_id = :id_approver 
        ')->bindParam(':id_approver',$id_approver)->queryAll();
        $employee_id = [];
        $is_has_approver = 0;
        foreach ($is_approval as $row)
        {
        $explode = explode(",", $row["employee_id"]);
            foreach ($explode as $id){
            array_push($employee_id,$id);
            }
            $is_has_approver = count($row['is_appoval']);
        }
        $searchModel = new LeaveApplicationSearch(); 
        if($is_has_approver == 0 && Yii::$app->user->getId() !=1){
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->where(['id_employee'=>$id_approver]);  

            $allLeave = LeaveApplication::find()->where(['id_employee'=>$id_approver])->count();
            $allLeavePending = LeaveApplication::find()->where(['id_employee'=>$id_approver])->andWhere(['id_leave_status'=>1])->count();
            $allLeaveApproval = LeaveApplication::find()->where(['id_employee'=>$id_approver])->andWhere(['id_leave_status'=>2])->count();
            $allLeaveRejected = LeaveApplication::find()->where(['id_employee'=>$id_approver])->andWhere(['id_leave_status'=>3])->count();
        }else{
            if(Yii::$app->user->getId() !=1){
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams); 
                $dataProvider->query->where(['in','id_employee',$employee_id]);

                $allLeave = LeaveApplication::find()->where(['in','id_employee',$employee_id])->count();
                $allLeavePending = LeaveApplication::find()->where(['in','id_employee',$employee_id])->andWhere(['id_leave_status'=>1])->count();
                $allLeaveApproval = LeaveApplication::find()->where(['in','id_employee',$employee_id])->andWhere(['id_leave_status'=>2])->count();
                $allLeaveRejected = LeaveApplication::find()->where(['in','id_employee',$employee_id])->andWhere(['id_leave_status'=>3])->count();
            }else{
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams); 

                $allLeave = LeaveApplication::find()->count();
                $allLeavePending = LeaveApplication::find()->where(['id_leave_status'=>1])->count();
                $allLeaveApproval = LeaveApplication::find()->where(['id_leave_status'=>2])->count();
                $allLeaveRejected = LeaveApplication::find()->where(['id_leave_status'=>3])->count();
            }
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
            'allLeave' => $allLeave,
            'allLeavePending' => $allLeavePending,
            'allLeaveApproval' => $allLeaveApproval,
            'allLeaveRejected' => $allLeaveRejected,
        ]);
    }

    public function actionView($id)
    {
        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new LeaveApplication model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new LeaveApplication();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->id_leave_status = 1;
        $id_approver = Yii::$app->user->identity->id_employee; 

        $is_approval = Yii::$app->db->createCommand('
            SELECT
                COUNT(hr_approval_permission_data.id) as is_appoval
            FROM hr_approval_permission_data
            LEFT JOIN hr_approval_permission on hr_approval_permission.id = hr_approval_permission_data.hr_approval_permission_id
            WHERE hr_approval_permission.approver_id = :id_approver 
        ')->bindParam(':id_approver',$id_approver)->queryOne();

        if ($model->load(Yii::$app->request->post())) {


            if($model->save(false)){
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(Yii::$app->request->referrer);
            }else{
                Yii::$app->session->setFlash('warning', "Save failed");
                return $this->redirect(Yii::$app->request->referrer);
            }
            
        }
        return $this->renderAjax('create', [
            'model' => $model,
            'is_approval' => $is_approval
        ]);
    }

    /**
     * Updates an existing LeaveApplication model.
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
        $model->id_approver = Yii::$app->user->identity->id_employee;
        $id_approver = Yii::$app->user->identity->id_employee;
        $employee_id = $model->id_employee;

        $is_approval = Yii::$app->db->createCommand('
            SELECT
                COUNT(hr_approval_permission_data.id) as is_appoval
            FROM hr_approval_permission_data
            LEFT JOIN hr_approval_permission on hr_approval_permission.id = hr_approval_permission_data.hr_approval_permission_id
            WHERE hr_approval_permission.approver_id = :id_approver
            AND hr_approval_permission_data.employee_id = :employee_id
        ')->bindParam(':id_approver',$id_approver)->bindParam(':employee_id',$employee_id)->queryOne();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update', [
            'model' => $model,
            'is_approval' => $is_approval
        ]);
    }

    /**
     * Deletes an existing LeaveApplication model.
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
     * Finds the LeaveApplication model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return LeaveApplication the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = LeaveApplication::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
