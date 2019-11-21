<?php

namespace backend\controllers;

use Yii;
use backend\models\SupplierProfile;
use backend\models\SupplierProfileTag;
use backend\models\SupplierProfileSearch;
use backend\models\SupplierProfileContact;
use backend\models\SupplierProfileContactSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
/**
 * SupplierProfileController implements the CRUD actions for SupplierProfile model.
 */
class SupplierProfileController extends Controller
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
     * Lists all SupplierProfile models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new SupplierProfileSearch();
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
     * Displays a single SupplierProfile model.
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
     * Creates a new SupplierProfile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SupplierProfile();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 

        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {

                if(!$model->save()) throw new Exception("Failed to Save!");

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    foreach ($tag as $key) {
                        $tag = new SupplierProfileTag();
                        $tag->id_supplier = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
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
     * Updates an existing SupplierProfile model.
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

                $tag = Yii::$app->request->post('tag');

                if((!empty($tag)) || ($tag != '')){
                    SupplierProfileTag::deleteAll(['id_supplier'=>$model->id]);
                    foreach ($tag as $key) {
                        $tag = new SupplierProfileTag();
                        $tag->id_supplier = $model->id;
                        $tag->id_tag = $key;
                        if(!$tag->save()) throw new Exception("Failed to Assign Tag!");
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
     * Deletes an existing SupplierProfile model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_supplier','supplier_id', 'id_supplier_profile', 'supplier_profile_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer); 
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }

    /**
     * Finds the SupplierProfile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SupplierProfile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SupplierProfile::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionContact($id, $smMenu=1)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);

        $searchModel = new SupplierProfileContactSearch();
        $searchModel->supplier_id = $model->id;
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

        return $this->render('//supplier-profile/contact/index', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model' => $model
        ]);
    }

    public function actionCreateContact($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new SupplierProfileContact();
        $model_profile = $this->findModel($id);

        if ( $model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                $model->supplier_id = $model_profile->id;
                if(!$model->save()) throw new Exception("Failed to Save!");

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

        return $this->renderAjax('//supplier-profile/contact/create', [
            'model' => $model
        ]);
    }

    public function actionUpdateContact($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = SupplierProfileContact::findOne(['id'=>$id]);

        if ( $model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try
            {

                if(!$model->save()) throw new Exception("Failed to Save!");

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

        return $this->renderAjax('//supplier-profile/contact/create', [
            'model' => $model
        ]);
    }

    public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_department'){

                $id_position = Yii::$app->request->post('id');

                $response = Yii::$app->db->createCommand("
                    SELECT b.id, b.name
                    from supplier_position as a
                    inner join supplier_department as b on a.department_id = b.id
                    where a.id = :id_position
                ")->bindParam(':id_position', $id_position)->queryAll();

                return json_encode($response);
            }
 
        }
    }

    public function actionDeleteContact($id)
    {
        $model = SupplierProfileContact::findOne($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_contact_supplier','contact_supplier_id', 'id_contact_supplier_profile', 'contact_supplier_profile_id');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer); 
        }elseif (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else {
            Yii::$app->session->setFlash('success', "Record deleted successfully");
            return $this->redirect(Yii::$app->request->referrer);
        }

    }
}
