<?php

namespace backend\controllers;

use Yii;
use backend\models\MembershipProfile;
use backend\models\MembershipProfileSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\web\UploadedFile;
use yii\base\Exception;
/**
 * MembershipProfileController implements the CRUD actions for MembershipProfile model.
 */
class MembershipProfileController extends Controller
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

    // public function behaviors()
    // {
    //     return [
    //         'access' => [
    //             'class' => \yii\filters\AccessControl::className(),
    //             'rules' => [
    //                 [
    //                 'allow' => true,
    //                 'actions' => \backend\models\User::getUserPermission(Yii::$app->controller->id),
    //                 'roles' => ['@'],
    //                 ]
    //             ]
    //         ],
    //     ];
    // }

    /**
     * Lists all MembershipProfile models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new MembershipProfileSearch(); 
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['membership_type'=>1]);
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

    public function actionSubscriber()
    {
        $current_page = Yii::$app->controller->id."-subscriber";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new MembershipProfileSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['membership_type'=>2]);
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

        return $this->render('subscriber', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single MembershipProfile model.
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
     * Creates a new MembershipProfile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new MembershipProfile();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->membership_type = 1; //id 1 membership,2 Subscriber
        if ($model->load(Yii::$app->request->post())) {

            $transaction_exception = Yii::$app->db->beginTransaction();
            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $username = $model->username;
                $password = $model->password;
                if( (!empty($username)) AND (!empty($password)) ){
                    
                    $user = new \backend\models\User();
                    $user->username = $username;
                    $user->first_name = $model->first_name;
                    $user->last_name = $model->last_name;
                    $user->gender = $model->id_prefix;
                    $user->telephone = $model->phone_number;
                    $user->img_url = $model->img_url;
                    $user->email = $model->email;
                    $user->membership_id = $model->id;
                    $user->user_type_id = 3;
                    $user->status = 1;
                    $user->created_by = Yii::$app->user->getId(); 
                    $user->created_date = date('Y-m-d H:i:s');
                    if(!empty($password)){
                        $user->setPassword($password);
                        $user->generateAuthKey();
                    }
                    
                    $user->save() ? $user : null;

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
     * Updates an existing MembershipProfile model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDetail($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);
        // $model->membership_type = 1; //id 1 membership,2 Subscriber
        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) { 

            $transaction_exception = Yii::$app->db->beginTransaction();
            try 
            {
                if(!$model->save()) throw new Exception("Failed to Save!");

                $username = $model->username;
                $password = $model->password;

                if( !empty($username) ){
                    // echo $model->first_name;
                    // exit();
                    $user = \backend\models\User::find()
                        ->where(['membership_id'=>$model->id])
                        ->one();
                        // print_r($user->img_url);
                        // exit();
                    // $user->username = $username;
                    $user->first_name = $model->first_name;
                    $user->last_name = $model->last_name;
                    $user->gender = $model->id_prefix;
                    $user->telephone = $model->phone_number;
                    // $user->img_url = $model->img_url;
                    $user->email = $model->email;
                    $user->membership_id = $model->id;
                    // $user->user_type_id = 3;
                    $user->status = $model->status;
                    // $user->created_by = Yii::$app->user->getId(); 
                    // $user->created_date = date('Y-m-d H:i:s');
                    if(!empty($password)){
                        $user->setPassword($password);
                        $user->generateAuthKey();
                    }
                    
                    $user->save() ? $user : null;

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

        return $this->render('_detail', [
            'model' => $model,
        ]);
    }

    public function actionSubscriberDetail($id)
    {
        $current_page = Yii::$app->controller->id."-subscriber";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);
        
        // $model->membership_type = 2; //id 1 membership,2 Subscriber
        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) && $model->save()) { 
            
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->render('_subscriber_detail', [
            'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }

    // public function actionUploads()
    // {
    //     $this->view->params['current_page'] = Yii::$app->controller->id."-index";
    //     $imageFile = \yii\web\UploadedFile::getInstanceByName('img_url');
    //     $directory =  Yii::getAlias("@app/web/backend/uploads/membership-profile/") ;
    //     $filePath = Yii::getAlias("@web/web/backend/uploads/membership-profile/");

    //     if (!is_dir($directory)) {
    //         FileHelper::createDirectory($directory);
    //     }
    //     if (isset($imageFile)) {
    //         $file_extension =   strtolower($imageFile->extension) ;

    //         $uid = uniqid(time(), true);
    //         $fName = str_replace("." . $file_extension,"",$imageFile->name);
    //         $fName = str_replace(" ","_",$fName);
    //         $fileName = $fName . '-' . $uid  .'.'. $file_extension;
    //         $filePath = $directory . $fileName;
    //         if ($imageFile->saveAs($filePath)) {

    //             $path = $filePath . $fileName;

    //             $file_path = $directory .  $fileName;

              

    //             // $model = User::find()->where(['id'=>$user])->one();
    //             // $model->image_url = "uploads/". 'membership-profile'.'/'. $fileName;
            

    //             // $model->save( false);
    //             $path = "uploads/". 'membership-profile/' . $fileName;


    //             $items = array(['name'=>$imageFile->name,'path'=>$path]);
    //             \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

    //             return json_encode($items);
    //         }

    //     }
    //     return "";
    // }

    /**
     * Deletes an existing MembershipProfile model.
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

    public function actionDeleteSubscriber($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['subscriber']);
    }

    public function actionValidation($id = null){

        $model = $id === null ? new MembershipProfile() : MembershipProfile::find()->where(['id'=>$id])->one();
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }

    /**
     * Finds the MembershipProfile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return MembershipProfile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = MembershipProfile::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
