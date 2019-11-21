<?php

namespace backend\controllers;

use Yii;
use backend\models\HrApprovalPermission;
use backend\models\HrApprovalPermissionSearch;
use backend\models\HrApprovalPermissionDepartment;
use backend\models\HrApprovalPermissionData;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie; 
/**
 * HrApprovalPermissionController implements the CRUD actions for HrApprovalPermission model.
 */
class HrApprovalPermissionController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all HrApprovalPermission models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new HrApprovalPermissionSearch();
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

    /**
     * Displays a single HrApprovalPermission model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    // public function actionView($id)
    // {
    //     return $this->render('view', [
    //         'model' => $this->findModel($id),
    //     ]);
    // }

    public function actionView($id)
    {

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id);

        if (Yii::$app->request->post()) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $employee_id = Yii::$app->request->post('employee_id');

                if((!empty($employee_id)) || ($employee_id != '')){
                    HrApprovalPermissionData::deleteAll(['hr_approval_permission_id'=>$id]);
                    for ($i = 0; $i < count($employee_id); ++$i) {
                        $data = new HrApprovalPermissionData();
                        $data->hr_approval_permission_id = $model->id;
                        $data->employee_id = $employee_id[$i];
                        if(!$data->save()) throw new Exception("Failed to assign employee!");
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

        $model_employee = \backend\models\EmployeeProfile::find()->where(['id'=>$model->id])->all();

        return $this->render('view', [
            'model' => $model,
            'model_employee' => $model_employee
        ]);
    }

    public function actionCreate()
    {
        $model = new HrApprovalPermission();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $department = Yii::$app->request->post('department');

                if((!empty($department)) || ($department != '')){
                    foreach ($department as $key) {
                        $data = new HrApprovalPermissionDepartment();
                        $data->hr_approval_permission_id = $model->id;
                        $data->department_id = $key;
                        if(!$data->save()) throw new Exception("Failed to save department!");
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
     * Updates an existing HrApprovalPermission model.
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
                if(!$model->save()) throw new Exception("Failed to Save!");

                $department = Yii::$app->request->post('department');
                HrApprovalPermissionDepartment::deleteAll(['hr_approval_permission_id' => $model->id]);
                if((!empty($department)) || ($department != '')){
                    foreach ($department as $key) {
                        $data = new HrApprovalPermissionDepartment();
                        $data->hr_approval_permission_id = $model->id;
                        $data->department_id = $key;
                        if(!$data->save()) throw new Exception("Failed to save department!");
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
    /**
     * Deletes an existing HrApprovalPermission model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        HrApprovalPermissionDepartment::deleteAll(['hr_approval_permission_id' => $id]);
        HrApprovalPermissionData::deleteAll(['hr_approval_permission_id' => $id]);
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the HrApprovalPermission model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return HrApprovalPermission the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = HrApprovalPermission::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
