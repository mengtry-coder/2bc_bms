<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidArgumentException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use backend\models\User;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\web\NotFoundHttpException;
use backend\models\MembershipProfile;
use backend\models\MembershipPayment;
use backend\models\MembershipPaymentSearch; 
use backend\models\MembershipEvent;
use backend\models\MembershipEventSearch; 
use backend\models\MembershipDocumentSearch;
use backend\models\Document;
use frontend\models\PasswordForm;
use backend\models\Login; 
use yii\web\Cookie;
use yii\imagine\Image;
use yii\helpers\FileHelper;
use backend\models\Folder;
/**
 * Member controller
 */
class MemberController extends Controller
{ 

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }
 
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    public function actionProfile()
    {
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id = $userData->membership_id;
        $model = $this->findModel($id);
        return $this->render('profile', [
            'model' => $model,
            'userData' => $userData
        ]); 
    }
    public function actionUpdateProfile()
    {
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id = $userData->membership_id;
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->render('update_profile', [
            'model' => $model,
        ]); 
    }

    public function actionUpdateUserProfile()
    { 
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id = $userData->membership_id;
        $model = $userData;

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
       
        return $this->render('update_user_profile', [
            'model' => $model,
        ]); 
    }
    

    public function actionPayment()
    {
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id_membership_profile = $userData->membership_id;
        $model = new MembershipPayment(); 
        $request = Yii::$app->request; 
        // $data_member_payment = []; 
        $data_member_payment = Yii::$app->db->createCommand("
            SELECT 
                COALESCE(
                COALESCE(membership_profile.company_name,CONCAT(membership_profile.first_name,' ',membership_profile.last_name),'No Name')
                ) as company_name,
                payment_method.`names` as payment_method,
                payment_for.`names` as payment_for,
                membership_payment.*
            FROM membership_payment
            LEFT JOIN membership_profile on membership_profile.id = membership_payment.id_membership_profile
            LEFT JOIN payment_method on payment_method.id = membership_payment.id_payment_method
            LEFT JOIN payment_for on payment_for.id = membership_payment.id_payment_for
            WHERE membership_payment.id_membership_profile = :id_membership_profile  
        ");  
        $data_member_payment->bindParam(':id_membership_profile',$id_membership_profile); 
        $data_member_payment = $data_member_payment->queryAll();

        if(($request->post()) && ($model->load(Yii::$app->request->post()))){ 
            // $from_date = $model->from_date;
            $payment_for = $model->id_payment_for;  
            $status = $model->status;  
            
            if($status ==""){
                $and_status = "";
            }else{
                $and_status = "AND membership_payment.status = ".$status;
            }

            if($payment_for ==""){
                $and_payment_for = "";
            }else{
                $and_payment_for = "AND membership_payment.id_payment_for = ".$payment_for;
            }

            $data_member_payment = Yii::$app->db->createCommand("
                SELECT 
                    COALESCE(
                    COALESCE(membership_profile.company_name,CONCAT(membership_profile.first_name,' ',membership_profile.last_name),'No Name')
                    ) as company_name,
                    payment_method.`names` as payment_method,
                    payment_for.`names` as payment_for,
                    membership_payment.*
                FROM membership_payment
                LEFT JOIN membership_profile on membership_profile.id = membership_payment.id_membership_profile
                LEFT JOIN payment_method on payment_method.id = membership_payment.id_payment_method
                LEFT JOIN payment_for on payment_for.id = membership_payment.id_payment_for
                WHERE membership_payment.id_membership_profile = :id_membership_profile  
                ".$and_status."
                ".$and_payment_for."
            ");  
            $data_member_payment->bindParam(':id_membership_profile',$id_membership_profile); 
            $data_member_payment = $data_member_payment->queryAll();
        }  
        return $this->render('payment', [ 
            'model' => $model,  
            'data_member_payment' => $data_member_payment,
        ]);

    }

    public function actionEvent()
    {
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id_membership_profile = $userData->membership_id;
        $model = new MembershipEvent();
        $request = Yii::$app->request; 
        $data_member_event = Yii::$app->db->createCommand("
        SELECT 
            membership_event.*,
            event_list.event_name
        FROM membership_event
        INNER JOIN event_list on event_list.id = membership_event.id_event_list
        WHERE membership_event.id_membership_profile = :id_membership_profile
        AND membership_event.approval_status = 1
        ")
        ->bindParam(':id_membership_profile',$id_membership_profile) 
        ->queryAll();

        if(($request->post()) && ($model->load(Yii::$app->request->post()))){ 
            $status = $model->status;  
        
            if($status ==""){
                $and_status = "";
            }else{
                $and_status = "AND membership_event.status = ".$status;
            }

            $data_member_event = Yii::$app->db->createCommand("
            SELECT 
                membership_event.*,
                event_list.event_name
            FROM membership_event
            INNER JOIN event_list on event_list.id = membership_event.id_event_list
            WHERE membership_event.id_membership_profile = :id_membership_profile
            AND membership_event.approval_status = 1
            ".$and_status."
            ")->bindParam(':id_membership_profile',$id_membership_profile)->queryAll();

        }
        return $this->render('event', [
            'data_member_event' => $data_member_event,
            'model' => $model,
        ]); 
    }

    
    public function actionDocument()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $idUSER = Yii::$app->user->getId(); 
        $userData = User::findOne($idUSER);
        $id_membership_profile = $userData->membership_id;

        $searchModel = new MembershipDocumentSearch();
        $searchModel->id_membership_profile = $id_membership_profile; 
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

        return $this->render('document', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'id_membership_profile' => $id_membership_profile,
        ]);
    }

    public function actionGetInfo($id)
    {
        return $this->renderAjax('_get_info', [
            'model' => $this->findModelFolder($id),
        ]);
    } 

    public function actionDownload($id) {

        ini_set('max_execution_time', 5*60); // 5 minutes

        $mm = Document::find()->where(['id'=>$id])->one();
        
        $path = Yii::getAlias('@backend').'/web/backend/'; 

        $file = $path .$mm->file_path;

        if (file_exists($file)) {

       Yii::$app->response->sendFile($file);

      }else{
         return $this->redirect(Yii::$app->request->referrer);
    }

    }

    public function actionDeleteFolder($id)
    {
        $check_folder_in_use = Yii::$app->db->createCommand('
            SELECT id FROM document WHERE id_folder = :id
        ')->bindParam(':id',$id)->queryAll();
        if(count($check_folder_in_use) <= 0){
            $this->findModelFolder($id)->delete();
            Yii::$app->session->setFlash('success', "Deleted successful");
        }else{
            Yii::$app->session->setFlash('warning', "Delete failed, Folder in use!");
        }  
        return $this->redirect(Yii::$app->request->referrer);
    }
    //==== End Folder block ====//
    public function actionDependent(){
        $request = Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='get_data_folder'){
                $id_folder = $request->post('id_folder');
                $id_membership_profile = $request->post('id_membership_profile');
                $response = Yii::$app->db->createCommand('
                SELECT
                document.*,
                folder.folder_name as folder_name,
                user.username as name_creater
                FROM document
                LEFT JOIN folder on folder.id = document.id_folder
                LEFT JOIN user on user.id = document.created_by
                WHERE document.id_folder = :id_folder
                and document.id_membership_profile = :id_membership_profile
                ')->bindParam(':id_membership_profile',$id_membership_profile)->bindParam(':id_folder',$id_folder)->queryAll();
                return json_encode($response);
            }

            if($request->post('action')=='get_data_crum_folder_name'){
                $id_folder = $request->post('id_folder');
                $response = Yii::$app->db->createCommand('
                SELECT
                folder.* 
                FROM folder 
                WHERE folder.id = :id_folder
                ')->bindParam(':id_folder',$id_folder)->queryAll();
                return json_encode($response);
            }

        }
    }


    public function actionChangepassword(){
        $model = new PasswordForm;
        $modeluser = User::find()->where([
            'username'=>Yii::$app->user->identity->username
        ])->one();
      
        if($model->load(Yii::$app->request->post())){
            if($model->validate()){
                try{
                    $modeluser->password = $_POST['PasswordForm']['newpass'];
                    if($modeluser->save()){
                        Yii::$app->getSession()->setFlash(
                            'success','Password changed'
                        );
                        return $this->redirect(['index']);
                    }else{
                        Yii::$app->getSession()->setFlash(
                            'error','Password not changed'
                        );
                        return $this->redirect(['index']);
                    }
                }catch(Exception $e){
                    Yii::$app->getSession()->setFlash(
                        'error',"{$e->getMessage()}"
                    );
                    return $this->render('changepassword',[
                        'model'=>$model
                    ]);
                }
            }else{
                return $this->render('changepassword',[
                    'model'=>$model
                ]);
            }
        }else{
            return $this->render('changepassword',[
                'model'=>$model
            ]);
        }
    }


    protected function findModel($id)
    {
        if (($model = MembershipProfile::findOne($id)) !== null) {
            return $model;
        }
        throw new NotFoundHttpException('The requested page does not exist.');
    }
    // protected function findModelPayment($id)
    // {
    //     if (($model = MembershipPayment::find($id)) !== null) {
    //         return $model;
    //     }
    //     throw new NotFoundHttpException('The requested page does not exist.');
    // }
    protected function findModelFolder($id)
    {
        if (($model = Folder::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    protected function findUserModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

 
}
