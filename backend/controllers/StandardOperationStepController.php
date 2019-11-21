<?php

namespace backend\controllers;

use Yii;
use backend\models\StandardOperationStep;
use backend\models\StandardOperationStepSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use backend\models\StandardOperationStepList;
/**
 * StandardOperationStepController implements the CRUD actions for StandardOperationStep model.
 */
class StandardOperationStepController extends Controller
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
    
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new StandardOperationStepSearch();
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
     * Displays a single StandardOperationStep model.
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
     * Creates a new StandardOperationStep model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new StandardOperationStep();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) ) {
            $sop_step_list = Yii::$app->request->post('step_list'); 
            $sort = Yii::$app->request->post('sort'); 
            $is_track = Yii::$app->request->post('is_track');
            $is_tracking = Yii::$app->request->post('is_tracking');
            if($model->save()){
                if (!empty($sop_step_list))
                {
                    foreach ($sop_step_list as $key => $sop_step_lists)
                    { 
                        $sopStepList = new StandardOperationStepList();
                        $sopStepList->id_standard_operation_step = $model->id;
                        $sopStepList->name = $sop_step_lists;
                        $sopStepList->status = 1;
                        $sopStepList->is_track = $is_tracking[$key];
                        $sopStepList->sort = $sort[$key];
                        $sopStepList->created_date = date('Y-m-d H:i:s');
                        $sopStepList->created_by = Yii::$app->user->getId();
                        $sopStepList->save();
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
     * Updates an existing StandardOperationStep model.
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
            StandardOperationStepList::deleteAll(['id_standard_operation_step'=>$model->id]);
            $sop_step_list = Yii::$app->request->post('step_list'); 
            $sort = Yii::$app->request->post('sort'); 
            $is_track = Yii::$app->request->post('is_track');
            $is_tracking = Yii::$app->request->post('is_tracking'); 
            if($model->save()){
                if (!empty($sop_step_list))
                {
                    foreach ($sop_step_list as $key => $sop_step_lists)
                    { 
                        $sopStepList = new StandardOperationStepList();
                        $sopStepList->id_standard_operation_step = $model->id;
                        $sopStepList->name = $sop_step_lists;
                        $sopStepList->status = 1;
                        $sopStepList->is_track = (isset($is_tracking[$key]) === TRUE ? $is_tracking[$key] : 0);
                        $sopStepList->sort = (isset($sort[$key]) === TRUE ? $sort[$key] : 0);
                        $sopStepList->created_date = date('Y-m-d H:i:s');
                        $sopStepList->created_by = Yii::$app->user->getId();
                        $sopStepList->save();
                    }
                }
            }
            
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing StandardOperationStep model.
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
     * Finds the StandardOperationStep model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StandardOperationStep the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StandardOperationStep::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
