<?php

namespace backend\controllers;

use Yii;
use backend\models\ChartAccount;
use backend\models\ChartAccountSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use Mpdf\Mpdf;
/**
 * ChartAccountController implements the CRUD actions for ChartAccount model.
 */
class ChartAccountController extends Controller
{
    /**
     * @inheritdoc
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

    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $searchModel = new ChartAccountSearch();
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

        $btn_doc = Yii::$app->request->get('btn_doc');

        if($btn_doc == "print" || $btn_doc =="excel" || $btn_doc == "pdf"){            
            $this -> layout = false;
            $page_size_print = 100;
            $dataProvider->pagination->pageSize = $page_size_print;

            // if($btn_doc == "pdf"){

            //     $date_title = date('d M Y');
            //     $title = 'Chart of Account';
            //     $delimiter = '-';
            //     $file_name =  strtolower(trim(preg_replace('/[\s-]+/', $delimiter, preg_replace('/[^A-Za-z0-9-]+/', $delimiter, preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $title))))), $delimiter)).'-upto-'.$date_title;

            //     $html = $this->render('_print', [
            //         'btn_doc' => $btn_doc,
            //         'page_size' => $page_size,
            //         'searchModel' => $searchModel,
            //         'dataProvider' => $dataProvider,
            //     ]);

            //     $mpdf = new Mpdf(['mode'=>'utf-8','autoPageBreak'=>true,'format'=>'A4-P']);
            
            //     $mpdf->useAdobeCJK = true;
            //     $mpdf->autoScriptToLang = true;
            //     $mpdf->autoLangToFont = true;
              
            //     $mpdf->WriteHTML($html);
            //     $mpdf->Output('');
            //     // $mpdf->Output($file_name.'.pdf',\Mpdf\Output\Destination::DOWNLOAD); 
            //     exit();

            // }

            return $this->render('_print', [
                'btn_doc' => $btn_doc,
                'page_size' => $page_size,
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);

        }else{

            return $this->render('index', [
                'page_size' => $page_size,
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }
    }

    /**
     * Displays a single ChartAccount model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->renderAjax('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ChartAccount model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ChartAccount();
        $request = Yii::$app->request;
        if($request->isAjax){
            if($request->post('action')=='get_parent'){
                $id = $request->post('id');
                $city = Yii::$app->db->createCommand("select * from account_type where is_parent = $id and status = 1")->queryAll();
                return json_encode($city);
            }
        }

        if ($model->load(Yii::$app->request->post())) {            
            if($model->save()){
                Yii::$app->session->setFlash('success', "Record saved successfully");
                return $this->redirect(Yii::$app->request->referrer);  
            }else{
                Yii::$app->session->setFlash('warning', "Failed to save record");
                return $this->redirect(Yii::$app->request->referrer);  
            }
        } else {
            return $this->renderAjax('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing ChartAccount model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $save = false;
        $msg = '';

        if ($model->load(Yii::$app->request->post())) {           

            $old_is_parent =  ChartAccount::find()->where(['=', 'id', $id])->one()->is_parent;
            $new_is_parent = $model->is_parent == ""?0:$model->is_parent;
            $is_hassub = ChartAccount::find()->where(['=', 'is_parent', $id])->all();

            if(sizeOf($is_hassub) == 0){
                $save = true;
                $msg = 'Record updated successfully'; 

            }else{
                if($old_is_parent == $new_is_parent){
                    $save = true;
                    $msg = 'Record updated successfully';  
                }else{
                    $save = false;
                    $msg = 'Failed to update record, please delete its sub account first!';
                }
            }

            if($save == true){
                $model->updated_date =  date('Y-m-d H:i:s');
                $model->updated_by = Yii::$app->user->getId();
                $model->save();
                Yii::$app->session->setFlash('success', $msg);
                return $this->redirect(['index']);
            }else{
                Yii::$app->session->setFlash('warning', $msg);
                return $this->redirect(['index']);
            }

        }else {
            return $this->renderAjax('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing ChartAccount model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $arr = (new \common\models\GlobalFunction)->getColumnListAsArray('id_chart_account','chart_account_id','chart_of_account', 'id_chart_of_account');
        $exist = (new \common\models\GlobalFunction)->getDataInUse($id,$arr); 

        $is_inused = ChartAccount::find()->where(['=', 'is_parent', $id])->exists();

        if ($is_inused){                  
          Yii::$app->session->setFlash('warning', "Failed to delete record, Please delete sub chart account first!");
          return $this->redirect(Yii::$app->request->referrer);
        }else if($exist > 0){
            Yii::$app->session->setFlash('warning', "Failed to delete record, data in used!");
            return $this->redirect(Yii::$app->request->referrer);
        }else if (!$model->delete()) {
            Yii::$app->session->setFlash('warning', "Failed to delete record");
            return $this->redirect(Yii::$app->request->referrer);
        }else{
            Yii::$app->session->setFlash('info', "Record deleted successfully");
            return $this->redirect(['index']);
        }

    }

    /**
     * Finds the ChartAccount model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ChartAccount the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ChartAccount::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
