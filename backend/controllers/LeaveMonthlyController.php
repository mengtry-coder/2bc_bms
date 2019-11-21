<?php

namespace backend\controllers;

use Yii;
use backend\models\LeaveMonthly;
use backend\models\LeaveMonthlyData;
use backend\models\LeaveMonthlySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
/**
 * LeaveMonthlyController implements the CRUD actions for LeaveMonthly model.
 */
class LeaveMonthlyController extends Controller
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
     * Lists all LeaveMonthly models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new LeaveMonthlySearch();
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
     * Displays a single LeaveMonthly model.
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

    /**
     * Creates a new LeaveMonthly model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new LeaveMonthly();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                if(!$model->save()) throw new Exception("Failed to save!");

                $leave_type = Yii::$app->request->post('leave_type');
                $amount = Yii::$app->request->post('amount');
                $date = Yii::$app->request->post('date');

                if(!empty($leave_type)){
                    foreach ($leave_type as $key => $value) {
                        $data = new LeaveMonthlyData();
                        $data->id_leave_monthly = $model->id;
                        $data->id_leave_type = $leave_type[$key];
                        $data->amount = $amount[$key];
                        $data->date = $date[$key];
                        if(!$data->save()) throw new Exception("Failed to data!");
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
     * Updates an existing LeaveMonthly model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model_data = LeaveMonthlyData::find()->where(['id_leave_monthly'=>$model->id])->all();
        $model_data = empty($model_data) ? [] : $model_data;

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                if(!$model->save()) throw new Exception("Failed to save!");

                $leave_type = Yii::$app->request->post('leave_type');
                $amount = Yii::$app->request->post('amount');
                $date = Yii::$app->request->post('date');

                LeaveMonthlyData::deleteAll(['id_leave_monthly' => $model->id]);
                if(!empty($leave_type)){
                    foreach ($leave_type as $key => $value) {
                        $data = new LeaveMonthlyData();
                        $data->id_leave_monthly = $model->id;
                        $data->id_leave_type = $leave_type[$key];
                        $data->amount = $amount[$key];
                        $data->date = $date[$key];
                        if(!$data->save()) throw new Exception("Failed to data!");
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
            'model_data' => $model_data
        ]);
    }

    /**
     * Deletes an existing LeaveMonthly model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {

        $model = $this->findModel($id);
        if($model->delete()){
            LeaveMonthlyData::deleteAll(['id_leave_monthly' => $model->id]);
            Yii::$app->session->setFlash('success', "Deleted successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    /**
     * Finds the LeaveMonthly model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return LeaveMonthly the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = LeaveMonthly::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_month'){
                $id = Yii::$app->request->post('id');
                $id_employee = Yii::$app->request->post('id_employee');

                $month_list = Yii::$app->db->createCommand("
                        SELECT *
                        FROM month_list
                        WHERE id not in (SELECT id_month FROM leave_setup WHERE id_year = :id AND id_employee = :id_employee)
                ")->bindParam(':id', $id)->bindParam(':id_employee', $id_employee)->queryAll();

                return json_encode($month_list);

            } 
        }
    }
}
