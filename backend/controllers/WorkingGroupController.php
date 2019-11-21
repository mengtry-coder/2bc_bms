<?php

namespace backend\controllers;

use Yii;
use backend\models\WorkingGroup;
use backend\models\WorkingGroupData;
use backend\models\WorkingGroupDepartment;
use backend\models\WorkingGroupSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
/**
 * WorkingGroupController implements the CRUD actions for WorkingGroup model.
 */
class WorkingGroupController extends Controller
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
     * Lists all WorkingGroup models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new WorkingGroupSearch();
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

        $model = $this->findModel($id);

        if (Yii::$app->request->post()) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $user_id = Yii::$app->request->post('user_id');
                WorkingGroupData::deleteAll(['id_working_group'=>$id]);
                if((!empty($user_id)) || ($user_id != '')){
                    for ($i = 0; $i < count($user_id); ++$i) {
                        $data = new WorkingGroupData();
                        $data->id_working_group = $model->id;
                        $data->id_user = $user_id[$i];
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

        $model_employee = \backend\models\EmployeeProfile::find()->where(['id_working_group'=>$model->id])->all();

        return $this->render('view', [
            'model' => $model,
            'model_employee' => $model_employee
        ]);
    }

    public function actionAddMember($working_group_id)
    {
        if (Yii::$app->request->post()) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $employee = Yii::$app->request->post('employee');
                if(!empty($employee)){
                    foreach ($employee as $key => $value) {
                        $model = \backend\models\EmployeeProfile::findOne($value);
                        $model->id_working_group = $working_group_id;
                        if(!$model->save(false)) throw new Exception("Failed to Save!");
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

        return $this->renderAjax('_add_member',['working_group_id'=>$working_group_id]);
    }

    public function actionCreate()
    {
        $model = new WorkingGroup();

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
                        $data = new WorkingGroupDepartment();
                        $data->id_working_group = $model->id;
                        $data->id_department = $key;
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
     * Updates an existing WorkingGroup model.
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
                WorkingGroupDepartment::deleteAll(['id_working_group' => $model->id]);
                if((!empty($department)) || ($department != '')){
                    foreach ($department as $key) {
                        $data = new WorkingGroupDepartment();
                        $data->id_working_group = $model->id;
                        $data->id_department = $key;
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

    public function actionDelete($id)
    {

        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_working_group','working_group_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr);

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer);
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            ItemGroupTemplateDetail::deleteAll(['id_working_group' => $id]);
            ItemGroupDepartment::deleteAll(['id_working_group' => $id]);
            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }
    }


    public function actionRemoveEmployee($id)
    {
        
        $transaction_exception = Yii::$app->db->beginTransaction();

        try
        {

            $model = \backend\models\EmployeeProfile::findOne($id);
            $model->id_working_group = '';
            if(!$model->save(false)) throw new Exception("Failed to Save!");

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Remove successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage());
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }
    }

    /**
     * Finds the WorkingGroup model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return WorkingGroup the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = WorkingGroup::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
