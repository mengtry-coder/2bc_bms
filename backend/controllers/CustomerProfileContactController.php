<?php

namespace backend\controllers;

use Yii;
use backend\models\CustomerProfileContact;
use backend\models\CustomerProfileContactSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * CustomerProfileContactController implements the CRUD actions for CustomerProfileContact model.
 */

class CustomerProfileContactController extends Controller
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
        //             'actions' => ['view','index','create','delete'],
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
 
    public function actionIndex()
    {
        $this->layout ="customer_layout";
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $request = Yii::$app->request; 
        $id_customer_profile = $request->get('id_customer_profile',0);
        $searchModel = new CustomerProfileContactSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['id_customer'=>$id_customer_profile]); 
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
     * Displays a single CustomerProfileContact model.
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
     * Creates a new CustomerProfileContact model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CustomerProfileContact();
        $request = Yii::$app->request; 
        $id_customer_profile = $request->get('id_customer_profile',0); 

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId();
        $model->id_customer = $id_customer_profile;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "Saved successful");
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    // Start Import file csv
    public function actionDownloadSampleCsv() {

        ini_set('max_execution_time', 5*60); // 5 minutes 

        $file = $_SERVER['DOCUMENT_ROOT'].Yii::getAlias('@web').'/backend/demo_file/customer_profile_contact.csv'; 

       if (file_exists($file)) {

       Yii::$app->response->sendFile($file);

      }else{
         return $this->redirect(Yii::$app->request->referrer);
      }
    }

    public function actionImportCsv($reset = 0)
    {
        $request = Yii::$app->request; 
        
        $model = new \backend\models\CustomerProfileContact();
        if($model->load(Yii::$app->request->post())){ 
            $id_customer_profile = $request->get('id_customer_profile',0);
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
                {   $contact_name = isset($fileop[0]) ? $fileop[0] : '';
                    $position = isset($fileop[1]) ? $fileop[1] : '';
                    $phone = isset($fileop[2]) ? $fileop[2] : '';
                    $email_address = isset($fileop[3]) ? $fileop[3] : ''; 
                    $note = isset($fileop[4]) ? $fileop[4] : '';

                    $tem_arr = [$contact_name,$position ,$phone,$email_address,$note,$user_id,$current_date,$id_customer_profile];

                    array_push($array_data, $tem_arr);
                }
                if(isset($array_data[0])){
                    unset($array_data[0]);
                }     
                $str_not_save = ' 
                    <h2 class="title-error-inPanel"><i class="icon-1x demo-pli-information"></i> Failed to saved or duplicated record(s):</h2>
                    <table border="1px" style="width: 100%;margin-bottom: 20px;height: 100%;">
                        <tbody >
                            <tr style="background-color: #f45145; color: white;">
                                <th style="padding: 5px;">
                                    Contact Name
                                </th>
                                <th style="padding: 5px;">
                                    Position
                                </th>
                                <th style="padding: 5px;">
                                    Phone Number
                                </th>
                                <th style="padding: 5px;">
                                    Email
                                </th>
                                <th style="padding: 5px;">
                                    Note
                                </th>
                            </tr>

                ';
                $count_not_save = 0;

                foreach($array_data as $key => $value){
                    $model_import = new CustomerProfileContact();
                    $model_import->scenario = 'new_record';

                    if(isset($value[0])){
                        $model_import->contact_name = $value[0];
                    }
                    if(isset($value[1])){
                        $model_import->position = $value[1];
                    }
                    if(isset($value[2])){
                        $model_import->phone = $value[2];
                    }
                    if(isset($value[3])){
                        $model_import->email_address = $value[3];
                    } 
                    if(isset($value[4])){
                        $model_import->note = $value[4];
                    } 
                    $model_import->id_customer = $id_customer_profile;
                    $model_import->created_by = $user_id;
                    $model_import->created_date = $current_date;
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
                                
                        "</tr>";
                        $count_not_save++;
                    } 
                }

                $str_not_save .= "</tbody></table>"; 
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

    /**
     * Updates an existing CustomerProfileContact model.
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
     * Deletes an existing CustomerProfileContact model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        return $this->redirect(Yii::$app->request->referrer);
        // return $this->redirect(['index']);
    }

    /**
     * Finds the CustomerProfileContact model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CustomerProfileContact the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CustomerProfileContact::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
