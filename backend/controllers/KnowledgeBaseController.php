<?php

namespace backend\controllers;

use Yii;
use backend\models\KnowledgeBase;
use backend\models\EmployeeProfile;
use backend\models\KnowledgeBaseSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * KnowledgeBaseController implements the CRUD actions for KnowledgeBase model.
 */
class KnowledgeBaseController extends Controller
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
     * Lists all KnowledgeBase models.
     * @return mixed
     */
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $id_employee_profile = $request->get('id_employee_profile',0);
        if($id_employee_profile != 0){
            $this->layout="employee_layout";
            $user_id = Yii::$app->user->identity->id;
            $id_employee = Yii::$app->user->identity->id_employee;
            $user_type_id = Yii::$app->user->identity->user_type_id;
            
            if($user_type_id != 1 || $user_id != 1){ 
                if($id_employee != $id_employee_profile){  
                    return $this->redirect(['knowledge-base/index','id_employee_profile'=>$id_employee,'smMenu'=>1]);
                }
            }
            $id_position = EmployeeProfile::find()->where(['id'=>$id_employee_profile])->one()->id_position;
            $id_knowledge_position = Yii::$app->db->createCommand
                                      ("SELECT a.id from knowledge_base a
                                        inner join knowledge_base_position b
                                        on a.id = b.id_knowledge_base
                                        where b.id_position = $id_position")->queryAll();

            // $id_knowledge_position = [];
            foreach ($id_knowledge_position as $row)
            {
            $explode = explode(",", $row["id"]);
                foreach ($explode as $id){
                array_push($id_knowledge_position,$id);
                }
            } 

            $searchModel = new KnowledgeBaseSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider->query->where(['in','knowledge_base.id',$id_knowledge_position]);
        }else {
          $searchModel = new KnowledgeBaseSearch();
          $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
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
        ]);
    }

    /**
     * Displays a single KnowledgeBase model.
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
    public function actionArticle($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        return $this->render('_article_detail', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new KnowledgeBase model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new KnowledgeBase();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $knowledge_base_position = Yii::$app->request->post('id_knowledge_base');
                if((!empty($knowledge_base_position)) || ($knowledge_base_position != '')){
                    foreach ($knowledge_base_position as $au) {
                        $assign = new \backend\models\KnowledgeBasePosition();
                        $assign->id_knowledge_base = $model->id;
                        $assign->id_position = $au;
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

    /**
     * Updates an existing KnowledgeBase model.
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

                $knowledge_base_position = Yii::$app->request->post('id_knowledge_base');
                if((!empty($knowledge_base_position)) || ($knowledge_base_position != '')){
                  \backend\models\KnowledgeBasePosition::deleteAll(['id_knowledge_base'=>$model->id]);
                    foreach ($knowledge_base_position as $au) {
                        $assign = new \backend\models\KnowledgeBasePosition();
                        $assign->id_knowledge_base = $model->id;
                        $assign->id_position = $au;
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

    /**
     * Deletes an existing KnowledgeBase model.
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
     * Finds the KnowledgeBase model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return KnowledgeBase the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = KnowledgeBase::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
