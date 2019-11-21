<?php

namespace backend\controllers;

use Yii;
use backend\models\EventList;
use backend\models\EventListSearch;
use backend\models\MembershipEventSearch;
use backend\models\MembershipProfile;
use backend\models\MembershipEvent;
use backend\models\Folder;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\filters\AccessControl;
use backend\models\MembershipPayment;
use yii\imagine\Image;
use yii\helpers\FileHelper;
use backend\models\Document;
/**
 * EventListController implements the CRUD actions for EventList model.
 */
class EventListController extends Controller
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
        // return [
        //     'access' => [
        //         'class' => AccessControl::className(),
        //         'rules' => [
        //             [
        //                 'actions' => ['login', 'error'],
        //                 'allow' => true,
        //             ],
        //             [
        //                 'actions' => ['logout', 'index'],
        //                 'allow' => true,
        //                 'roles' => ['@'],
        //             ],
        //         ],
        //     ],
        //     'verbs' => [
        //         'class' => VerbFilter::className(),
        //         'actions' => [
        //             'logout' => ['post'],
        //         ],
        //     ],
        // ];
    }

    /**
     * Lists all EventList models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new EventListSearch();
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
    public function actionCreateParticipation()
    {
        $model = new MembershipEvent();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->status = 1; 
        $model->approval_status = 1; 
        if ($model->load(Yii::$app->request->post())) { 

            $event_list_data = Yii::$app->db->createCommand('
                SELECT * FROM event_list WHERE event_list.id = '.$model->id_event_list.'
            ')->queryOne(); 

            $model->description = $event_list_data['description'];
            $model->from_date = $event_list_data['from_date'];           
            $model->to_date = $event_list_data['to_date'];           
            $model->address = $event_list_data['address'];         
            $model->address_line_2 = $event_list_data['address_line_2'];           
            $model->prefix_phone_code = $event_list_data['prefix_phone_code'];           
            $model->phone_number = $event_list_data['phone_number'];           
            $model->prefix_phone_code_line_2 = $event_list_data['prefix_phone_code_line_2']; 
            $model->phone_number_line_2 = $event_list_data['phone_number_line_2'];           
            $model->id_country = $event_list_data['id_country'];  
            $model->id_city = $event_list_data['id_city']; 
            $model->id_province = $event_list_data['id_province']; 
            $model->postal_code = $event_list_data['postal_code']; 
            $model->email = $event_list_data['email'];     
            $model->status = $event_list_data['status'];
 
            $model_membership_payment = new MembershipPayment();
            $model_membership_payment->id_membership_profile = $model->id_membership_profile;
            $model_membership_payment->id_payment_type = $model->id_payment_type;
            $model_membership_payment->id_payment_method = $model->id_payment_method;
            $model_membership_payment->description = $model->member_description;
            $model_membership_payment->status = 1;
            $model_membership_payment->id_payment_for = 2;
            $model_membership_payment->from_date = $event_list_data['from_date'];           
            $model_membership_payment->to_date = $event_list_data['to_date'];

            $model_membership_payment->amount = $model->amount;
            $model_membership_payment->balance = $model->balance;
            $model_membership_payment->paid = $model->paid;
            $model_membership_payment->save(); 
            
            if($model->save())
            {  

                $membership_profile = Yii::$app->request->post('membership_profile');
                $register_date = Yii::$app->request->post('register_date');
                $number_of_audient = Yii::$app->request->post('number_of_audient');
                $payment_type = Yii::$app->request->post('payment_type');
                $payment_method = Yii::$app->request->post('payment_method');
                $amount = Yii::$app->request->post('amount');
                $balance = Yii::$app->request->post('balance');
                $event_fee = Yii::$app->request->post('event_fee');
                $paid = Yii::$app->request->post('paid');
                $member_description = Yii::$app->request->post('member_description'); 

                
                if (!empty($membership_profile))
                {
                    foreach ($membership_profile as $key => $membership_profiles)
                    { 
                        $membership_event = new MembershipEvent();
                        $membership_event->id_membership_profile = $membership_profiles;
                        $membership_event->id_event_list = $model->id_event_list;
                        $membership_event->register_date = $register_date[$key];
                        $membership_event->amount = $amount[$key];
                        $membership_event->balance = $balance[$key];
                        $membership_event->event_fee = $event_fee[$key];
                        $membership_event->paid = $paid[$key];
                        $membership_event->number_of_audient = $number_of_audient[$key];
                        $membership_event->id_payment_type = $payment_type[$key];
                        $membership_event->id_payment_method = $payment_method[$key];
                        $membership_event->member_description = $member_description[$key];
                        $membership_event->status = 1;
                        $membership_event->created_date = date('Y-m-d H:i:s');
                        $membership_event->created_by = Yii::$app->user->getId(); 
                        $membership_event->description = $event_list_data['description'];
                        $membership_event->from_date = $event_list_data['from_date'];           
                        $membership_event->to_date = $event_list_data['to_date'];           
                        $membership_event->address = $event_list_data['address'];         
                        $membership_event->address_line_2 = $event_list_data['address_line_2'];           
                        $membership_event->prefix_phone_code = $event_list_data['prefix_phone_code'];           
                        $membership_event->phone_number = $event_list_data['phone_number'];           
                        $membership_event->prefix_phone_code_line_2 = $event_list_data['prefix_phone_code_line_2']; 
                        $membership_event->phone_number_line_2 = $event_list_data['phone_number_line_2'];           
                        $membership_event->id_country = $event_list_data['id_country'];  
                        $membership_event->id_city = $event_list_data['id_city']; 
                        $membership_event->id_province = $event_list_data['id_province']; 
                        $membership_event->postal_code = $event_list_data['postal_code']; 
                        $membership_event->email = $event_list_data['email'];
                        $membership_event->save();  
                    }  
                    
                    foreach ($membership_profile as $asd => $memberID)
                    { 
                        $membership_payment = new MembershipPayment();
                        $membership_payment->id_membership_profile = $memberID;
                        $membership_payment->id_payment_type = $payment_type[$asd];
                        $membership_payment->id_payment_method = $payment_method[$asd];
                        $membership_payment->description = $member_description[$asd];
                        $membership_payment->status = 1;
                        $membership_payment->id_payment_for = 2;
                        $membership_payment->from_date = $event_list_data['from_date'];           
                        $membership_payment->to_date = $event_list_data['to_date'];
                        $membership_payment->amount = $event_fee[$asd] * $number_of_audient[$asd];
                        $membership_payment->balance = $balance[$asd];
                        $membership_payment->paid = $paid[$asd];
                        $membership_payment->save(); 
                    }
                     
                    
                } 
            } 
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('create_participation', [
            'model' => $model,
        ]);
    }

    public function actionUpdateParticipation($id)
    {
        $model = $this->findModelMember($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            // return $this->redirect(['participation']);
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update_participation', [
            'model' => $model,
        ]);
    }
    public function actionDependent($id){
        $request = Yii::$app->request; 
        if($request->isAjax){
            if($request->post('action')=='get_data_by_event'){
                $id_membership_profile = $request->post('id_membership_profile');
                $id_event = $id;
                $response = Yii::$app->db->createCommand('
                SELECT
                    membership_profile.id_prefix as id_prefix,
                    CONCAT(data_option_prefix.`names`," ", membership_profile.first_name," ",membership_profile.last_name) as membership_name,
                    CONCAT("(","+",phone_prefix1.code,")"," ",membership_profile.phone_number) as phone_number1,
                    CONCAT("(","+",phone_prefix2.code,")"," ",membership_profile.phone_number_line_2) as phone_number2,
                    membership_profile.email as email,
                    membership_profile.membership_type as membership_type,
                    if(membership_profile.membership_type = 1,event_list.fee_for_membership,event_list.fee_for_subscriber) as event_fee
                FROM membership_profile
                LEFT JOIN data_option_prefix on data_option_prefix.id = membership_profile.id_prefix
                LEFT JOIN data_option_phone_number_country_code as phone_prefix1 on phone_prefix1.id = membership_profile.prefix_phone_code
                LEFT JOIN data_option_phone_number_country_code as phone_prefix2 on phone_prefix2.id = membership_profile.prefix_phone_code_line_2
                INNER JOIN event_list on event_list.id = :id_event
                WHERE membership_profile.id = :id_membership_profile

                ')
                ->bindParam(':id_membership_profile',$id_membership_profile)
                ->bindParam(':id_event',$id_event)
                ->queryAll();
                return json_encode($response);
            }
        }
    }
 
    public function actionCreateNewParticipation($id_event_list)
    {
        $model = new MembershipProfile();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        $model->membership_type = 2; //id 1 membership,2 Subscriber
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('_create_new_participation', [
            'model' => $model,
        ]);
    }


    /**
     * Displays a single EventList model.
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

    public function actionViewParticipation($id)
    {
        return $this->renderAjax('view_participation', [
            'model' => $this->findModelMember($id),
        ]);
    }


    /**
     * Creates a new EventList model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionDetail($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
        return $this->render('_detail', [
            'model' => $model,
        ]);
    }

    public function actionCreate()
    {
        $model = new EventList();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    public function actionExportCsv($id_event_list)
    { 
        $request = Yii::$app->request;
        $data_participation = [];
        $this -> layout = false;
        $data_participation = Yii::$app->db->createCommand("
            SELECT 
                membership_profile.company_name as company_name,
                membership_profile.email as email,
                membership_profile.first_name as first_name,
                membership_profile.last_name as last_name, 
                data_option_prefix.`names` as prefix_name
            FROM membership_event
            INNER JOIN membership_profile on membership_profile.id = membership_event.id_membership_profile
            LEFT JOIN data_option_prefix on data_option_prefix.id = membership_profile.id_prefix
            WHERE membership_event.id_event_list = $id_event_list
            GROUP BY membership_event.id_membership_profile
        ")->queryAll();

        return $this->render('_export_participation_csv', [
            'data_participation' => $data_participation,
        ]);
    }

    public function actionParticipation($id_event_list)
    {

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
 
        $searchModel = new MembershipEventSearch();
        // $searchModel->id_event_list = $id_event_list; 
        // $searchModel->approval_status = 1; 
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->where(['approval_status'=>1])->andWhere(['id_event_list'=>$id_event_list]);
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

        return $this->render('participation', [
            'page_size' => $page_size,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Updates an existing EventList model.
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
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing EventList model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        Yii::$app->session->setFlash('success', "Delete successful");
        return $this->redirect(Yii::$app->request->referrer);
    }

    public function actionDeleteParticipation($id)
    {
        $this->findModelMember($id)->delete();
        Yii::$app->session->setFlash('success', "Delete successful");
        return $this->redirect(Yii::$app->request->referrer); 
    }

    // Start Document
    public function actionEventDocument($id_event_list)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        return $this->render('document', [ 
        ]);
    }

    public function actionUpload($folder,$id_event_list)
    {
        
        $per_folder = Folder::find()->where(['status'=>1,'id'=>$folder])->all();
        
        //$per_folder = $folder == 0 ? 1 : $per_folder;
        if(!empty($per_folder)){
                //in this section folder with parent id will has real path as task's child
            $this->view->params['current_page'] = Yii::$app->controller->id."-index";
            $controller = Yii::$app->controller->id;
            $fileName = 'file';
            if (isset($_FILES[$fileName]))
            {
                $file = \yii\web\UploadedFile::getInstanceByName($fileName);

                $original_fileName = strtolower($file->name);
                $file_size = $file->size; // file size in bytes
                $server_path = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend';
                $directory = $server_path. "/uploads/$controller/$folder/";
                $filePath = Yii::getAlias("@web/backend/uploads/$controller/$folder/");
                $thumbDir = $server_path. "/uploads/thumb/$controller/$folder/";
                $thumbPath = Yii::getAlias("@web/backend/uploads/thumb/$controller/$folder/");
                $db_path = "uploads/$controller/$folder/";
            
                
                if (!is_dir($directory)) {
                FileHelper::createDirectory($directory); 
                    //mkdir($directory);
                    
                }
                if (!is_dir($thumbDir)) {
                    FileHelper::createDirectory($thumbDir); 
                    //mkdir($thumbDir);
                }
            
                if (isset($file)) {
                    $file_extension = $file->extension;
        
                    $uid = uniqid(time(), true);
                    
                    $fName = str_replace("." . $file_extension,"",$original_fileName);
                    $nUid = str_replace(".","",$uid);
                    $fileName = $fName . '-' . $nUid . '.' . $file_extension;
                    $filePath = $directory . $fileName;
                    if ($file->saveAs($filePath)) {
        
                        $path = $filePath . $fileName;
        
                        $file_path = $directory .  $fileName;
        
                        $file_thumb = $thumbDir .  $fileName;
        
                        $db_thumbnail_path = "";
                        if($file_extension == "gif" || $file_extension == "jpg"  || $file_extension=="png"){
                            Image::thumbnail($file_path, 64, 64)->save($file_thumb, ['quality' => 100]);
                            $file_thumb = $thumbPath .  $fileName;
                            
                                $db_thumbnail_path  = "uploads/thumb/". $controller ."/".$folder."/". $fileName;
                            
                        }elseif(
                        //file extenstion words
                        $file_extension == "doc" ||
                        $file_extension == "dot" ||
                        $file_extension == "wbk" ||
                        $file_extension == "docx" ||
                        $file_extension == "docm" ||
                        $file_extension == "dotx" ||
                        $file_extension == "dotm" ||
                        $file_extension == "docb" 
                    
                        ){

                        $db_thumbnail_path  = "thumbs/". 'icon-word.png';
                    }
                    elseif(
                        //file extenstion excel
                        $file_extension == "xls" ||
                        $file_extension == "xlt" ||
                        $file_extension == "xlm" ||
                        $file_extension == "xlsx" ||
                        $file_extension == "xlsm" ||
                        $file_extension == "xltx" ||
                        $file_extension == "xltm" ||
                        $file_extension == "xlsb" ||
                        $file_extension == "xla" ||
                        $file_extension == "xlam" ||
                        $file_extension == "xll" ||
                        $file_extension == "xlw" 
                        ){

                        $db_thumbnail_path  = "thumbs/". 'icon-excel.png';
                    }
                    elseif(
                        //file extenstion power point
                        $file_extension == "ppt" ||
                        $file_extension == "pot" ||
                        $file_extension == "pps" ||
                        $file_extension == "pptx" ||
                        $file_extension == "pptm" ||
                        $file_extension == "potx" ||
                        $file_extension == "potm" ||
                        $file_extension == "ppam" ||
                        $file_extension == "ppsx" ||
                        $file_extension == "ppsm" ||
                        $file_extension == "sldx" ||
                        $file_extension == "sldm" 
                    
                        ){
                        $db_thumbnail_path  = "thumbs/". 'icon-powerpoint.png';
                        
                    }
                    elseif(
                        //file extenstion access
                        $file_extension == "accdb" ||
                        $file_extension == "accde" ||
                        $file_extension == "accdt" ||
                        $file_extension == "accdr" 
                        ){
                        $db_thumbnail_path  = "thumbs/". 'icon-access.png';
                        
                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pub" ||
                        $file_extension == "xps" 
                        
                        ){

                        $db_thumbnail_path  = "thumbs/". 'icon-publisher.png';
                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pdf" ||
                        $file_extension == "html"
                        
                        ){

                        $db_thumbnail_path  = "thumbs/". 'icon-pdf.png';
                    }else {
                            
                            $db_thumbnail_path = "thumbs/icon-default.jpg";
                        }
                        // Save file to database
                        $model_file = new Document();
                        $model_file->file_path =$db_path . $fileName;
                        $model_file->id_folder = $folder;
                        $model_file->thumbnail = $db_thumbnail_path;
                        $model_file->file_size = $file_size;
                        $model_file->file_name = $original_fileName;
                        $model_file->created_by = Yii::$app->user->id;
                        $model_file->created_date = date('Y-m-d H:i:s');
                        $model_file->id_event_list = $id_event_list;
                        $model_file->status = 1;
                        
                        //create permission
                        if($model_file->save()){
                        
                                $id = $model_file->id;
                                $path = $db_path . $fileName;
                                $items = array(['name'=>$fileName,'id'=>$id,'thumbnail'=>$db_thumbnail_path,'path'=>$path]);
                                \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                
                                return json_encode($items);
                                Yii::$app->session->setFlash('success', "Saved successful");
                        }else{
                            return 0;
                        }
                    }
                }   

            }   
        }else{
            return false;
        }
    }
    
    public function actionUploadDocument($folder){
        // $check = Folder::find()->where(['id'=>$folder])->all();
        // if(empty($check)){
            
        //     Yii::$app->request->referrer();
        // }
        return $this->renderAjax('upload',[
            'folder'=>$folder]);
    }
    //from dropzone
    public function actionRemoveFile()
    {
        
        $session = Yii::$app->getSession();
      $request= Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='remove_file'){
                $id= $request->post('id');
                $mm = Document::find()->where(['id'=>$id])->one();
                
                
                if(!empty($mm)){
                    $file_thumb = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->thumbnail;

                     $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->file_path;
                     if($mm->delete()){
 
                        if(file_exists($file_thumb) && file_exists($file)){
                        
                            if(unlink($file_thumb)&&unlink($file)){
                                
                                return 'Success';
                            }
                        }else{
    
                            throw new HttpException(500, "Error message");
                        }
                    }else{
                        throw new HttpException(500, "Error message");
                    }
                }else{
                   throw new HttpException(500, "Error message");
                }
            }

        }
        
    } 
    
    //==== Start Folder block ====//
    public function actionCreateFolder()
    {
        $model = new Folder();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        
        // print_r($model->getAttributes());
        // exit();
        if ($model->load(Yii::$app->request->post())) {
            $check_folder_name = Yii::$app->db->createCommand('
            SELECT folder.folder_name as folder_name
            FROM folder
            WHERE folder.id_event_list = "'.$model->id_event_list.'"
            AND folder.folder_name = "'.$model->folder_name.'"
            ')->queryAll();
            if(count($check_folder_name)  >= 1 || $model->folder_name == "Home"){
                Yii::$app->session->setFlash('warning', "Folder is already existed.");
            }else{
                $model->save();
                Yii::$app->session->setFlash('success', "Saved successful");
            }  
            return $this->redirect(Yii::$app->request->referrer);
        }


        return $this->renderAjax('create_folder', [
            'model' => $model,
        ]);
    }

    public function actionRenameFolder($id)
    {
        $model = $this->findModelFolder($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        
        if ($model->load(Yii::$app->request->post())) 
        {
            $check_folder = Folder::find()->where(['status'=>1,'id'=>$id])->one();
            if($check_folder['folder_name'] != $model->folder_name)
            {
                
                $check_folder_name = Yii::$app->db->createCommand('
                SELECT folder.folder_name as folder_name
                    FROM folder
                WHERE folder.id_event_list = "'.$model->id_event_list.'"
                AND folder.folder_name = "'.$model->folder_name.'"
                ')->queryAll();
                if(count($check_folder_name) >= 1 || $model->folder_name == "Home"){
                    Yii::$app->session->setFlash('warning', "Folder is already existed.");
                }else{
                    $model->save();
                    Yii::$app->session->setFlash('success', "Saved successful");
                }  

            }else{
                Yii::$app->session->setFlash('info', "Nothing changed.");
            }
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('rename_folder', [
            'model' => $model,
        ]);
    }

    public function actionGetInfo($id)
    {
        return $this->renderAjax('_get_info', [
            'model' => $this->findModelFolder($id),
        ]);
    } 

    //from link
    public function actionRemove($id)
    {
         $session = Yii::$app->getSession();
        $mm = Document::find()->where(['id'=>$id])->one();
               
                 //$file_thumb = ''.$mm->image_thumbnail;
                // $file ="/../images/".$mm->file_url;
                if(!empty($mm)){
                    $file_thumb = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->thumbnail;

                    $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/'.$mm->file_path;
                    if($mm->delete()){

                        if(file_exists($file_thumb) && file_exists($file)){
                          
                            if(unlink($file_thumb)&&unlink($file)){
                                
                                Yii::$app->session->setFlash('success', "Deleted successful");
                                return $this->redirect(Yii::$app->request->referrer);
                               
                            }
                        }else{
    
                           Yii::$app->session->setFlash('warning', "Error");
                             return $this->redirect(Yii::$app->request->referrer);
                        
                        }
                    }else{
                         return $this->redirect(Yii::$app->request->referrer);
                           
                    }
                }else{
                     return $this->redirect(Yii::$app->request->referrer);
                            
                   //throw new HttpException(500, "Error message");
                }
    }

    public function actionDownload($id) {

        ini_set('max_execution_time', 5*60); // 5 minutes

        $mm = Document::find()->where(['id'=>$id])->one();
        
        $path = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/';
       

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
    public function actionDependentFolder(){
        $request = Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='get_data_folder'){
                $id_folder = $request->post('id_folder');
                $id_event_list = $request->post('id_event_list');
                $response = Yii::$app->db->createCommand('
                SELECT
                document.*,
                folder.folder_name as folder_name,
                user.username as name_creater
                FROM document
                LEFT JOIN folder on folder.id = document.id_folder
                LEFT JOIN user on user.id = document.created_by
                WHERE document.id_folder = :id_folder
                and document.id_event_list = :id_event_list
                ')->bindParam(':id_event_list',$id_event_list)->bindParam(':id_folder',$id_folder)->queryAll();
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
    // End Document

    /**
     * Finds the EventList model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return EventList the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = EventList::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    protected function findModelMember($id)
    {
        if (($model = MembershipEvent::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    protected function findModelFolder($id)
    {
        if (($model = Folder::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}
