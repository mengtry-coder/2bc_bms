<?php

namespace backend\controllers;

use Yii;
use backend\models\User;
use backend\models\CustomerProfile;
use backend\models\LeadProfile;
use backend\models\LeadProfileSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\helpers\FileHelper;
use backend\models\Document;
use backend\models\Folder;
use yii\imagine\Image; 
/**
 * LeadProfileController implements the CRUD actions for LeadProfile model.
 */
class LeadProfileController extends Controller
{
    public function behaviors()
    {
        
       return [
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                 'rules' => [
                    [
                    'allow' => true,
                    'actions' =>User::getUserPermission(Yii::$app->controller->id),
                    'roles' => ['@'],
                    ]
                 ]
            ],
        ];
        
    }

    /**
     * Lists all LeadProfile models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new LeadProfileSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['!=','customer_status',6]);
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

    public function actionView($id)
    {
        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    } 

    public function actionConvertLead($id) 
    { 
        $model = $this->findModel($id);
        $currentDate =  date('Y-m-d H:i:s');
        $currentUser = Yii::$app->user->getId();
        $model->updated_date =  $currentDate;
        $model->updated_by = $currentUser;
        $model->customer_status = 6; 
        $check_dublicate = CustomerProfile::find()->where(['customer_profile.email_address'=>$model->email_address])->count();
        if($check_dublicate > 0){
            Yii::$app->session->setFlash('warning', "Convert Lead to Customer is dublicated.");
            return $this->redirect(Yii::$app->request->referrer);
        }

        $insert = Yii::$app->db->createCommand('
            INSERT INTO customer_profile 
                (company_name,
                customer_name,
                email_address,
                address,
                phone_number,
                id_country,
                id_city,
                zip_code,
                status,
                billing_address,
                id_billing_city,
                id_billing_country,
                shipping_address,
                id_shipping_city,
                id_shipping_country,
                created_by,
                created_date) 
            SELECT 
                company_name,
                lead_name,
                email_address,
                address,
                phone_number,
                id_country,
                id_city,
                zip_code,
                "1",
                billing_address,
                id_billing_city,
                id_billing_country,
                shipping_address,
                id_shipping_city,
                id_shipping_country ,
                "'.$currentUser.'",
                "'.$currentDate.'"
            FROM lead_profile 
            WHERE id ='.$id
        ); 
        if ($model->save() && $insert->execute()) {  
            Yii::$app->session->setFlash('success', "Convert Lead to Customer successful.");
            $newCustomerId = CustomerProfile::find()->where(['customer_profile.email_address'=>$model->email_address])->One();
            $this->redirect(['customer-profile/profile','id'=>$newCustomerId['id'],'smMenu'=>1]);
        }  
    }

    /**
     * Creates a new LeadProfile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new LeadProfile();

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
    public function actionValidation($id = null){

        $model = $id === null ? new LeadProfile : LeadProfile::findOne($id);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }
    /**
     * Updates an existing LeadProfile model.
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
     * Deletes an existing LeadProfile model.
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

    public function actionProfile($id)
    {
        $this->layout="lead_layout";
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->render('profile', [
            'model' => $model,
        ]);
    }

    // Start Import file csv
    public function actionDownloadSampleCsv() {

        ini_set('max_execution_time', 5*60); // 5 minutes 

        $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/demo_file/lead_profile.csv'; 

       if (file_exists($file)) {

       Yii::$app->response->sendFile($file);

      }else{
         return $this->redirect(Yii::$app->request->referrer);
      }
    }

    public function actionImportCsv($reset = 0)
    {
        $request = Yii::$app->request;
        $model = new \backend\models\LeadProfile();
        if($model->load(Yii::$app->request->post())){

            $model->file = \yii\web\UploadedFile::getInstance($model, 'file');

            if ( $model->file )
                {

                if($model->file->extension !== 'csv'){
                    //alert error , wrong file extension
                    // Yii::$app->session->setFlash('success', "Deleted successful");
                    Yii::$app->session->setFlash('danger', 'Support only CSV file!');
                    Yii::$app->session->setFlash('warning', 'error');
                    Yii::$app->session->setFlash('warning', 'Support only CSV file!');
                    return $this->redirect(Yii::$app->request->referrer);
                    
                }

                $time = time();
                $directory =  Yii::getAlias("@app/web/uploads/testing/");
                if (!is_dir($directory)) {
                    FileHelper::createDirectory($directory); 
                    //mkdir($directory); 
                }
                $model->file->saveAs($directory.$time .'.'. $model->file->extension);
                $model->file = $directory .$time. '.' . $model->file->extension;
                $file_path = $model->file;

                $handle = fopen($model->file, "r");

                $array_data = [];
                $user_id = Yii::$app->user->id;
                $current_date = Date('Y-m-d H:i:s');

                /* START GET DATA AND BATCH INSERT TO DATABASE */
                while (($fileop = fgetcsv($handle, 1000, ",")) !== false) 
                {   $lead_name = isset($fileop[0]) ? $fileop[0] : '';
                    $company_name = isset($fileop[1]) ? $fileop[1] : '';
                    $address = isset($fileop[2]) ? $fileop[2] : '';
                    $email_address = isset($fileop[3]) ? $fileop[3] : ''; 
                    $phone_number = isset($fileop[4]) ? $fileop[4] : '';
                    $zip_code = isset($fileop[5]) ? $fileop[5] : '';
                    $billing_address = isset($fileop[6]) ? $fileop[6] : '';
                    $shipping_address = isset($fileop[7]) ? $fileop[7] : ''; 

                    $tem_arr = [$lead_name,$company_name ,$address,$email_address,$phone_number,$zip_code,$billing_address,$shipping_address,$user_id,$current_date];

                    array_push($array_data, $tem_arr);
                }
                if(isset($array_data[0])){
                    unset($array_data[0]);
                }     
                $str_not_save = '
                <div class="panel">
                    <div class="panel-heading">
                        <h2 class="title-error-inPanel"><i class="icon-1x demo-pli-information"></i> Failed to saved or duplicated record(s):</h2>
                    </div>
                    <div class="panel-body">
                    <table border="1px" style="width: 100%;margin-bottom: 20px;height: 100%;">
                        <tbody >
                            <tr style="background-color: #f45145; color: white;">
                                <th style="padding: 5px;">
                                    Lead Name
                                </th>
                                <th style="padding: 5px;">
                                    Company Name
                                </th>
                                <th style="padding: 5px;">
                                    Address
                                </th>
                                <th style="padding: 5px;">
                                    Email
                                </th>
                                <th style="padding: 5px;">
                                    Phone Number
                                </th>
                                <th style="padding: 5px;">
                                    Zip Code
                                </th>
                                <th style="padding: 5px;">
                                    Billing Address
                                </th>
                                <th style="padding: 5px;">
                                    Shipping Address
                                </th>

                            </tr>

                ';
                $count_not_save = 0;

                foreach($array_data as $key => $value){
                    $model_import = new LeadProfile();
                    $model_import->scenario = 'new_record';

                    if(isset($value[0])){
                        $model_import->lead_name = $value[0];
                    }
                    if(isset($value[1])){
                        $model_import->company_name = $value[1];
                    }
                    if(isset($value[2])){
                        $model_import->address = $value[2];
                    }
                    if(isset($value[3])){
                        $model_import->email_address = $value[3];
                    } 
                    if(isset($value[4])){
                        $model_import->phone_number = $value[4];
                    } 
                    if(isset($value[5])){
                        $model_import->zip_code = $value[5];
                    } 
                    if(isset($value[6])){
                        $model_import->billing_address = $value[6];
                    } 
                    if(isset($value[7])){
                        $model_import->shipping_address = $value[7];
                    } 
                    $model_import->created_by = $user_id;
                    $model_import->created_date = $current_date;
                    $model_import->customer_status = 1;
                    if(!$model_import->save()){
                        $str_not_save .="<tr>";

                            if(isset($value[0])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[0] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[1])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[1] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[2])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[2] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[3])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[3] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[4])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[4] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[5])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[5] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[6])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[6] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                            if(isset($value[7])){
                                $str_not_save .= "<th style='padding: 5px;'>". $value[7] ."</th>";
                            }else{
                                $str_not_save .= "<th style='padding: 5px;'> Null </th>";
                            }
                                
                        "</tr>";
                        $count_not_save++;
                    } 
                }

                $str_not_save .= "</tbody></table></div></div>"; 
                /* END GET DATA AND BATCH INSERT TO DATABASE */ 
            } 
            /* START REMOVE FILE ON IMPORT COMPLETED */
            if(is_file($file_path)){ 
                unset($handle);
                // chmod($file_path, 0777);
                if(unlink($file_path)){ 
                }
            } 
            // exit();
            /* END REMOVE FILE ON IMPORT COMPLETED */
            if($count_not_save != 0){
                Yii::$app->session->setFlash('success', 'Import Successfully, ', $count_not_save.' record(s) was not save!');
                Yii::$app->session->setFlash('error_import',$str_not_save);
            }else{
                Yii::$app->session->setFlash('success', 'Import Successfully');
            }
            // Yii::$app->session->setFlash('success', 'success');
            // Yii::$app->session->setFlash('success', 'Import Successfully');
            return $this->redirect(Yii::$app->request->referrer);
        }else{
        return $this->renderAjax('_import_csv',
            [
                'model'=>$model
            ]);
        }
    }
    // End Import file csv
    // Start Document Block
    public function actionDocument($id_lead_profile)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $request = Yii::$app->request;
        $id_lead_profile = $request->get('id_lead_profile',0);
        if($id_lead_profile != 0){
            $this->layout="lead_layout";
        }   
        return $this->render('document', [ 
            ]);
    }
    
    public function actionUpload($folder,$id_lead_profile)
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
                            $file_extention = 0;
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

                            $file_extention = 1;
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

                            $file_extention = 1;
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
                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-powerpoint.png';
                        
                    }
                    elseif(
                        //file extenstion access
                        $file_extension == "accdb" ||
                        $file_extension == "accde" ||
                        $file_extension == "accdt" ||
                        $file_extension == "accdr" 
                        ){
                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-access.png';
                        
                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pub" ||
                        $file_extension == "xps" 
                        
                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-publisher.png';
                    }
                    elseif(
                        //file extenstion publisher
                        $file_extension == "pdf" ||
                        $file_extension == "html"
                        
                        ){

                            $file_extention = 1;
                            $db_thumbnail_path  = "thumbs/". 'icon-pdf.png';
                    }else {
                            
                        $file_extention = 1;    
                        $db_thumbnail_path = "thumbs/icon-default.jpg";
                        }
                        // Save file to database
                        $model_file = new Document();
                        $model_file->file_path =$db_path . $fileName;
                        $model_file->id_folder = $folder;
                        $model_file->thumbnail = $db_thumbnail_path;
                        $model_file->file_extention = $file_extention;
                        $model_file->file_size = $file_size;
                        $model_file->file_name = $original_fileName;
                        $model_file->created_by = Yii::$app->user->id;
                        $model_file->created_date = date('Y-m-d H:i:s');
                        $model_file->id_lead_profile = $id_lead_profile;
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
            WHERE folder.id_lead_profile = "'.$model->id_lead_profile.'"
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
                WHERE folder.id_lead_profile = "'.$model->id_lead_profile.'"
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
                    $file_extension = $mm->file_extention; 
                    
                    if($mm->delete()){
                        if($file_extension == 1){
                            if(file_exists($file)){
                                                
                                if(unlink($file)){
                                    
                                    Yii::$app->session->setFlash('success', "Deleted successful");
                                    return $this->redirect(Yii::$app->request->referrer);
                                
                                }
                            }else{

                            Yii::$app->session->setFlash('warning', "Error");
                                return $this->redirect(Yii::$app->request->referrer);
                            
                            }
                        }else{
                            if(file_exists($file_thumb) && file_exists($file)){
                                                
                                if(unlink($file_thumb)&&unlink($file)){
                                    
                                    Yii::$app->session->setFlash('success', "Deleted successful");
                                    return $this->redirect(Yii::$app->request->referrer);
                                
                                }
                            }else{

                            Yii::$app->session->setFlash('warning', "Error");
                                return $this->redirect(Yii::$app->request->referrer);
                            
                            }
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
                $id_lead_profile = $request->post('id_lead_profile');
                $response = Yii::$app->db->createCommand('
                SELECT
                document.*,
                folder.folder_name as folder_name,
                user.username as name_creater
                FROM document
                LEFT JOIN folder on folder.id = document.id_folder
                LEFT JOIN user on user.id = document.created_by
                WHERE document.id_folder = :id_folder
                and document.id_lead_profile = :id_lead_profile
                ')->bindParam(':id_lead_profile',$id_lead_profile)->bindParam(':id_folder',$id_folder)->queryAll();
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
    protected function findModel($id)
    {
        if (($model = LeadProfile::findOne($id)) !== null) {
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
