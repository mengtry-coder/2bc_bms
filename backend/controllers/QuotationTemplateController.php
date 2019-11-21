<?php

namespace backend\controllers;

use Yii;
use backend\models\QuotationTemplate;
use backend\models\QuotationTemplateSearch;
use backend\models\QuotationTemplateDetail;
use backend\models\QuotationTemplateDetailSearch;
use backend\models\QuotationTemplatePlan;
use backend\models\QuotationTemplatePlanSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * QuotationTemplateController implements the CRUD actions for QuotationTemplate model.
 */
class QuotationTemplateController extends Controller
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
     * Lists all QuotationTemplate models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new QuotationTemplateSearch();
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
     * Displays a single QuotationTemplate model.
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
     * Creates a new QuotationTemplate model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new QuotationTemplate();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $title = Yii::$app->request->post('title');
                $description = Yii::$app->request->post('description');
                $setup_fee = Yii::$app->request->post('setup_fee');
                $fee = Yii::$app->request->post('fee');
                $status = Yii::$app->request->post('status');

                $model->status = 1;

                if(!$model->save()) throw new Exception("Failed to Save!");

                if((!empty($title)) || ($title != '')){
                    foreach ($title as $key => $value) {
                        $data = new QuotationTemplatePlan();
                        $data->id_quotation_template = $model->id;
                        $data->plan_title = $title[$key];
                        $data->plan_description = $description[$key];
                        $data->setup_fee = $setup_fee[$key];
                        $data->plan_fee = $fee[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Plan!");
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
     * Updates an existing QuotationTemplate model.
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

                $model->status = 1;

                if(!$model->save()) throw new Exception("Failed to Save!");

                $title = Yii::$app->request->post('title');
                $description = Yii::$app->request->post('description');
                $setup_fee = Yii::$app->request->post('setup_fee');
                $fee = Yii::$app->request->post('fee');
                $status = Yii::$app->request->post('status');

                if((!empty($title)) || ($title != '')){
                    QuotationTemplatePlan::deleteAll(['id_quotation_template' => $model->id]);
                    foreach ($title as $key => $value) {
                        $data = new QuotationTemplatePlan();
                        $data->id_quotation_template = $model->id;
                        $data->plan_title = $title[$key];
                        $data->plan_description = $description[$key];
                        $data->setup_fee = $setup_fee[$key];
                        $data->plan_fee = $fee[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Plan!");
                    }
                }


                $feature_title = Yii::$app->request->post('feature_title');
                $feature_description = Yii::$app->request->post('feature_description');

                if((!empty($feature_title)) || ($feature_title != '')){
                    QuotationTemplateDetail::deleteAll(['id_quotation_template' => $model->id]);
                    foreach ($feature_title as $key => $value) {
                        $data = new QuotationTemplateDetail();
                        $data->id_quotation_template = $model->id;
                        $data->title = $feature_title[$key];
                        $data->description = $feature_description[$key];
                        if(!$data->save()) throw new Exception("Failed to Save Feature!");
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

        $model_item = QuotationTemplatePlan::findAll(['id_quotation_template' => $id]);
        $model_item = empty($model_item) ? [] : $model_item;

        $model_feature = QuotationTemplateDetail::findAll(['id_quotation_template' => $id]);
        $model_feature = empty($model_feature) ? [] : $model_feature;

        return $this->renderAjax('update', [
            'model' => $model,
            'model_item' => $model_item,
            'model_feature' => $model_feature
        ]);
    }

    /**
     * Deletes an existing QuotationTemplate model.
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
     * Finds the QuotationTemplate model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return QuotationTemplate the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = QuotationTemplate::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
