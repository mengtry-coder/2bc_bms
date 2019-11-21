<?php

namespace backend\controllers;

use Yii;
use backend\models\EmployeeProfile;
use backend\models\EmployeeProfileSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\helpers\FileHelper;
use backend\models\Document;
use backend\models\Folder;
use backend\models\User;
use yii\imagine\Image;
/**
 * EmployeeProfileController implements the CRUD actions for EmployeeProfile model.
 */
class EmployeeProfileController extends Controller
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
     * Lists all EmployeeProfile models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $model = new EmployeeProfile();
        $searchModel = new EmployeeProfileSearch();
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
        
        $user_id = Yii::$app->user->identity->id;
        $id_employee = Yii::$app->user->identity->id_employee;
        $user_type_id = Yii::$app->user->identity->user_type_id;
        if($user_type_id != 1 && $user_id != 1){ 
            return $this->redirect(['employee-profile/profile', 'id' => $id_employee, 'smMenu' => 1]);
        }else{
            return $this->render('index', [
                'page_size' => $page_size,
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }
        
    }

    /**
     * Displays a single EmployeeProfile model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $this->layout="employee_layout";
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new EmployeeProfile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new EmployeeProfile();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {

            if(!$model->save()){

                Yii::$app->session->setFlash('warning', "Failed to save");
                return $this->redirect(Yii::$app->request->referrer);
            }else{
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(Yii::$app->request->referrer);
            }
            
        }
        $user_id = Yii::$app->user->identity->id;
        $id_employee = Yii::$app->user->identity->id_employee;
        $user_type_id = Yii::$app->user->identity->user_type_id;
        
        if($user_type_id != 1){ 
            return $this->redirect(['employee-profile/profile', 'id' => $id_employee, 'smMenu' => 1]);
        }else{
            return $this->renderAjax('create', [
                'model' => $model,
            ]);
        } 
    }

    /**
     * Updates an existing EmployeeProfile model.
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

            if(!$model->save()){
                Yii::$app->session->setFlash('warning', "Failed to save");
                return $this->redirect(Yii::$app->request->referrer);
            }else{
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(Yii::$app->request->referrer);
            }

        }

        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    }
    public function actionProfile($id)
    {
        $this->layout="employee_layout";
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = $this->findModel($id);
        $user_id = Yii::$app->user->identity->id;
        $id_employee = Yii::$app->user->identity->id_employee;
        $user_type_id = Yii::$app->user->identity->user_type_id;
        
        if($user_type_id != 1 || $user_id != 1){ 
            if($id_employee != $id){ 
                return $this->redirect(['employee-profile/profile','id'=>$id_employee,'smMenu'=>1]);
            }
        }

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post())) {

            if($model->save()){

                if(!empty($model->username)){
                    $modelUser = User::find()->where(['id_employee' => $model->id])->one();
                    if (!empty($modelUser)) {
                        $modelUser->first_name = $model->first_name;
                        $modelUser->last_name = $model->last_name;
                        $modelUser->username = $model->username;
                        $modelUser->gender = $model->id_prefix;
                        $modelUser->telephone = $model->phone_number;
                        $modelUser->img_url = $model->img_url;
                        $modelUser->email = $model->email;
                        $modelUser->user_type_id = $model->id_user_type;
                        $modelUser->id_position = $model->id_position;
                        $modelUser->updated_date =  date('Y-m-d H:i:s');
                        $modelUser->updated_by = Yii::$app->user->getId();

                        if(!empty($model->password)){
                            $modelUser->generateAuthKey();
                            $modelUser->setPassword($model->password);
                        }

                        $modelUser->save(false);

                        // if(!$modelUser->save()){
                        //     Yii::$app->session->setFlash('warning', "Failed to save user record");
                        //     return $this->redirect(Yii::$app->request->referrer);
                        // }

                    }else{
                        $user = new User();
                        $user->username = $model->username;
                        $user->first_name = $model->first_name;
                        $user->last_name = $model->last_name;
                        $user->gender = $model->id_prefix;
                        $user->telephone = $model->phone_number;
                        $user->img_url = $model->img_url;
                        $user->email = $model->email;
                        $user->user_type_id = $model->id_user_type;
                        $user->id_position = $model->id_position;
                        $user->id_employee = $model->id;
                        $user->status = 1;
                        $user->created_date =  date('Y-m-d H:i:s');
                        $user->created_by = Yii::$app->user->getId();

                        if(!empty($model->password)){
                            $user->generateAuthKey();
                            $user->setPassword($model->password);
                        }

                        if(!$user->save(false)){
                            Yii::$app->session->setFlash('warning', "Failed to save user record");
                            return $this->redirect(Yii::$app->request->referrer);
                        }

                    }
                }

                Yii::$app->session->setFlash('success', "Record saved successfully");
                return $this->redirect(Yii::$app->request->referrer);

            }else{

                Yii::$app->session->setFlash('warning', "Failed to save record");
                return $this->redirect(Yii::$app->request->referrer);

            }

        }
        
        // if($id_employee != $id){ 
        //     return $this->redirect(['employee-profile/view','id'=>$id_employee,'smMenu'=>1]);
        // } 

        return $this->render('profile', [
            'model' => $model,
        ]);
    }
    public function actionProject($id_employee_profile)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new Project();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->render('project', [
            'model' => $model,
        ]);
    }

    // Start Document Block
    public function actionDocument($id_employee_profile)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $request = Yii::$app->request;
        $id_employee_profile = $request->get('id_employee_profile',0);
        if($id_employee_profile != 0){ 
            $this->layout="employee_layout";
            $user_id = Yii::$app->user->identity->id;
            $id_employee = Yii::$app->user->identity->id_employee;
            $user_type_id = Yii::$app->user->identity->user_type_id;
            
            if($user_type_id != 1 || $user_id != 1){ 
                if($id_employee != $id_employee_profile){  
                    return $this->redirect(['employee-profile/document','id_employee_profile'=>$id_employee,'smMenu'=>1]);
                }
            }
        }
        return $this->render('document', [
            ]);
    }

    public function actionUpload($folder,$id_employee_profile)
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
                        $model_file->id_employee_profile = $id_employee_profile;
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
            WHERE folder.id_employee_profile = "'.$model->id_employee_profile.'"
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
                WHERE folder.id_employee_profile = "'.$model->id_employee_profile.'"
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
                $id_employee_profile = $request->post('id_employee_profile');
                $response = Yii::$app->db->createCommand('
                SELECT
                document.*,
                folder.folder_name as folder_name,
                user.username as name_creater
                FROM document
                LEFT JOIN folder on folder.id = document.id_folder
                LEFT JOIN user on user.id = document.created_by
                WHERE document.id_folder = :id_folder
                and document.id_employee_profile = :id_employee_profile
                ')->bindParam(':id_employee_profile',$id_employee_profile)->bindParam(':id_folder',$id_folder)->queryAll();
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
    public function actionGetDepartment(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_department'){
                $id = Yii::$app->request->post('id');
                $response = [];
                  $department = Yii::$app->db->createCommand("
                  SELECT b.id as id_department, b.name as department_name from employee_position a inner join department b on a.id_department = b.id where a.id = $id
                  ")->queryAll();
                  $job_description = Yii::$app->db->createCommand("
                  SELECT description from employee_position where id = $id
                  ")->queryOne();
                $response = ['department' => $department, 'job_description' => $job_description];
                return json_encode($response);
            }
        }
    }
    // End Document


    public function actionValidation($id = null){

        $model = $id === null ? new EmployeeProfile() : EmployeeProfile::find()->where(['id'=>$id])->one();
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return \yii\widgets\ActiveForm::validate($model);
        }
    }
    /**
     * Deletes an existing EmployeeProfile model.
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
     * Finds the EmployeeProfile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return EmployeeProfile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = EmployeeProfile::findOne($id)) !== null) {
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
