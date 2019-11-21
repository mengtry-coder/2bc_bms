<?php

namespace backend\controllers;

use Yii;
use backend\models\LeaveInTheYearData;
use backend\models\LeaveInTheYear;
use backend\models\LeaveInTheYearSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * LeaveInTheYearController implements the CRUD actions for LeaveInTheYear model.
 */
class LeaveInTheYearController extends Controller
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
     * Lists all LeaveInTheYear models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $searchModel = new LeaveInTheYearSearch();
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
     * Displays a single LeaveInTheYear model.
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
     * Creates a new LeaveInTheYear model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new LeaveInTheYear();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

          if ($model->load(Yii::$app->request->post()) && $model->save()) {
              // ==========save leave in the year data=========
              $transaction_exception = Yii::$app->db->beginTransaction();
              try
              {

                  $leave_type = Yii::$app->request->post('leave_type');
                  $leave_type_value = Yii::$app->request->post('leave_type_value');
                  // $quarterly = Yii::$app->request->post('quarterly');
                  LeaveInTheYearData::deleteAll(['id_leave_in_the_year'=>$model->id]);
                  if((!empty($leave_type)) || ($leave_type != '')){
                      foreach ($leave_type as $key => $value) {
                          $data = new LeaveInTheYearData();
                          $data->id_leave_in_the_year = $model->id;
                          $data->id_leave_type = $leave_type[$key];
                          $data->leave_type_value = $leave_type_value[$key];

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
              // ==========save leave in the year data=========


              Yii::$app->session->setFlash('success', "Saved successful");
              return $this->redirect(Yii::$app->request->referrer);
          }

            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
        $model_item = LeaveInTheYearData::findAll(['id_leave_in_the_year' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        return $this->renderAjax('create', [
            'model' => $model,
            'model_item' => $model_item
        ]);
    }

    /**
     * Updates an existing LeaveInTheYear model.
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
            // ==========save leave in the year data=========
            $transaction_exception = Yii::$app->db->beginTransaction();
            try
            {

                $leave_type = Yii::$app->request->post('leave_type');
                $leave_type_value = Yii::$app->request->post('leave_type_value');
                // $quarterly = Yii::$app->request->post('quarterly');
                LeaveInTheYearData::deleteAll(['id_leave_in_the_year'=>$model->id]);
                if((!empty($leave_type)) || ($leave_type != '')){
                    foreach ($leave_type as $key => $value) {
                        $data = new LeaveInTheYearData();
                        $data->id_leave_in_the_year = $model->id;
                        $data->id_leave_type = $leave_type[$key];
                        $data->leave_type_value = $leave_type_value[$key];

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
            // ==========save leave in the year data=========


            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        $model_item = LeaveInTheYearData::findAll(['id_leave_in_the_year' => $model->id]);
        $model_item = empty($model_item) ? [] : $model_item;

        return $this->renderAjax('update', [
            'model' => $model,
            'model_item' => $model_item

        ]);
    }

    /**
     * Deletes an existing LeaveInTheYear model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        LeaveInTheYearData::deleteAll(['id_leave_in_the_year'=>$id]);
        Yii::$app->session->setFlash('success', "Deleted successful");
        return $this->redirect(['index']);
    }

    /**
     * Finds the LeaveInTheYear model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return LeaveInTheYear the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = LeaveInTheYear::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
