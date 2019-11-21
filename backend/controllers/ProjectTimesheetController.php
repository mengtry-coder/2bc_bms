<?php

namespace backend\controllers;

use Yii;
use backend\models\ProjectTimesheet;
use backend\models\ProjectTimesheetTag;
use backend\models\ProjectTimesheetMember;
use backend\models\ProjectTimesheetDescription;
use backend\models\ProjectTimesheetSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
use yii\helpers\Url;
/**
 * ProjectTimesheetController implements the CRUD actions for ProjectTimesheet model.
 */
class ProjectTimesheetController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        // return [
        //     'access' => [
        //         'class' => \yii\filters\AccessControl::className(),
        //          'rules' => [
        //             [
        //             'allow' => true,
        //             'actions' => ['view','delete','index','update','create'],
        //             'roles' => ['@'],
        //             ]
        //          ]
        //     ],
        // ];
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
     * Lists all ProjectTimesheet models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new ProjectTimesheetSearch();
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
     * Displays a single ProjectTimesheet model.
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
     * Creates a new ProjectTimesheet model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($source_id, $type)
    {
        $model = new ProjectTimesheet();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                $model->id_project = $source_id;
                $model->status = 1;
                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');
                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new ProjectTimesheetTag();
                        $tag->id_project_timesheet = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    foreach ($assign_user as $au) {
                        $assign = new ProjectTimesheetMember();
                        $assign->id_project_timesheet = $model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }

                $description = Yii::$app->request->post('description');
                if((!empty($description)) || ($description != '')){
                    foreach ($description as $key) {
                        $description = new ProjectTimesheetDescription();
                        $description->id_project_timesheet = $model->id;
                        $description->description = $key;
                        if(!$description->save()) throw new Exception("Failed to Save description!");
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

    /**
     * Updates an existing ProjectTimesheet model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id, $source_id, $type)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 

        $model_item = ProjectTimesheetDescription::findAll(['id_project_timesheet' => $id]);
        $model_item = empty($model_item) ? [] : $model_item;

        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
                $model->id_project = $source_id;
                $model->status = 1;
                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    ProjectTimesheetTag::deleteAll(['id_project_timesheet'=>$model->id]);
                    foreach ($tag as $key) {
                        $tag = new ProjectTimesheetTag();
                        $tag->id_project_timesheet = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
                    }
                }

                $assign_user = Yii::$app->request->post('assign_to');
                if((!empty($assign_user)) || ($assign_user != '')){
                    ProjectTimesheetMember::deleteAll(['id_project_timesheet'=>$model->id]);
                    foreach ($assign_user as $au) {
                        $assign = new ProjectTimesheetMember();
                        $assign->id_project_timesheet = $model->id;
                        $assign->id_employee = $au;
                        if(!$assign->save()) throw new Exception("Failed to Assign User!");
                    }
                }

                $description = Yii::$app->request->post('description');
                ProjectTimesheetDescription::deleteAll(['id_project_timesheet'=>$model->id]);
                if((!empty($description)) || ($description != '')){
                    foreach ($description as $key) {
                        $description = new ProjectTimesheetDescription();
                        $description->id_project_timesheet = $model->id;
                        $description->description = $key;
                        if(!$description->save()) throw new Exception("Failed to Save description!");
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
            'source_id'=>$source_id,
            'type'=>$type,
            'model_item' => $model_item
        ]);
    }

    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_project_timesheet','project_timesheet_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer); 
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {

            ProjectTimesheetTag::deleteAll(['id_project_timesheet'=>$model->id]);
            ProjectTimesheetMember::deleteAll(['id_project_timesheet'=>$model->id]);
            ProjectTimesheetDescription::deleteAll(['id_project_timesheet'=>$model->id]);

            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    public function actionValidation($id = null){

        $model = $id === null ? new ProjectTimesheet : ProjectTimesheet::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    /**
     * Finds the ProjectTimesheet model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProjectTimesheet the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ProjectTimesheet::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
