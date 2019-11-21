<?php

namespace backend\controllers;

use Yii;
use backend\models\ItemGroup;
use backend\models\ItemGrouptSearch;
use backend\models\ItemGroupTemplateDetail;
use backend\models\ItemGroupTemplateData;
use backend\models\ItemGroupDepartment;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * ItemGroupController implements the CRUD actions for ItemGroup model.
 */
class ItemGroupController extends Controller
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
     * Lists all ItemGroup models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $searchModel = new ItemGrouptSearch();
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
     * Displays a single ItemGroup model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ItemGroup model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ItemGroup();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $feature_title = Yii::$app->request->post('feature_title');
                $feature_description = Yii::$app->request->post('feature_description');

                if((!empty($feature_title)) || ($feature_title != '')){
                    // ItemGroupTemplateDetail::deleteAll(['id_item_group' => $model->id]);
                    foreach ($feature_title as $key => $value) {
                        $data = new ItemGroupTemplateDetail();
                        $data->id_item_group = $model->id;
                        $data->title = $feature_title[$key];
                        $data->description = $feature_description[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Feature!");
                    }
                }

                $department = Yii::$app->request->post('department');

                if((!empty($department)) || ($department != '')){
                    foreach ($department as $key) {
                        $department = new ItemGroupDepartment();
                        $department->id_item_group = $model->id;
                        $department->id_department = $key;
                        if(!$department->save()) throw new Exception("Failed to save Department!");
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
     * Updates an existing ItemGroup model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $item = \backend\models\Item::find()->where(['id_group'=>$model->id, 'status'=>1])->all();

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $group = Yii::$app->request->post('group');
                $feature_title = Yii::$app->request->post('feature_title');
                $feature_description = Yii::$app->request->post('feature_description');

                if((!empty($feature_title)) || ($feature_title != '')){
                    ItemGroupTemplateDetail::deleteAll(['id_item_group' => $model->id]);
                    foreach ($feature_title as $key => $value) {
                        $data = new ItemGroupTemplateDetail();
                        $data->id_item_group = $model->id;
                        $data->id_item_group_type = $group[$key];
                        $data->title = $feature_title[$key];
                        $data->description = $feature_description[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Feature!");
                    }
                }

                $department = Yii::$app->request->post('department');

                if((!empty($department)) || ($department != '')){
                    ItemGroupDepartment::deleteAll(['id_item_group' => $model->id]);
                    foreach ($department as $key) {
                        $department = new ItemGroupDepartment();
                        $department->id_item_group = $model->id;
                        $department->id_department = $key;
                        if(!$department->save()) throw new Exception("Failed to save Department!");
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

        $model_feature = ItemGroupTemplateDetail::findAll(['id_item_group' => $id]);
        $model_feature = empty($model_feature) ? [] : $model_feature;

        return $this->renderAjax('update', [
            'model' => $model,
            'model_feature' => $model_feature,
        ]);
    }

    /**
     * Deletes an existing ItemGroup model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {

        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_group');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr);

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer);
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            ItemGroupTemplateDetail::deleteAll(['id_item_group' => $id]);
            ItemGroupDepartment::deleteAll(['id_item_group' => $id]);
            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }
    }

    /**
     * Finds the ItemGroup model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ItemGroup the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ItemGroup::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
