<?php

namespace backend\controllers;

use Yii;
use backend\models\Payroll;
use backend\models\PayrollRequest;
use backend\models\PayrollRequestData;
use backend\models\PayrollRequestSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use yii\base\Exception;
use common\models\GlobalFunction;

/**
 * PayrollRequestController implements the CRUD actions for PayrollRequest model.
 */
class PayrollRequestController extends Controller
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

    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new PayrollRequestSearch();
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

    public function actionView($id, $smMenu)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = $this->findModel($id);

        if (Yii::$app->request->post()) {
            
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {

                $model->grand_total_basic_salary = Yii::$app->request->post('grand_total_basic_salary');
                $model->grand_total_probation_pass_amount = Yii::$app->request->post('grand_total_probation_pass_amount');
                $model->grand_total_probation_working_day = Yii::$app->request->post('grand_total_probation_working_day');
                $model->grand_total_probation_per_day_amount = Yii::$app->request->post('grand_total_probation_per_day_amount');
                $model->grand_total_probation_pass_total_amount = Yii::$app->request->post('grand_total_probation_pass_total_amount');
                $model->grand_total_absent = Yii::$app->request->post('grand_total_absent');
                $model->grand_total_absent_deduct_amount = Yii::$app->request->post('grand_total_absent_deduct_amount');
                $model->grand_total_advance_deduct_amount = Yii::$app->request->post('grand_total_advance_deduct_amount');
                $model->grand_total_increase_amount = Yii::$app->request->post('grand_total_increase_amount');
                $model->grand_total_other_amount = Yii::$app->request->post('grand_total_other_amount');
                $model->grand_total_balance_amount = Yii::$app->request->post('grand_total_balance_amount');
                $model->grand_total_service_charge_amount = Yii::$app->request->post('grand_total_service_charge_amount');
                $model->grand_total_bonus_amount = Yii::$app->request->post('grand_total_bonus_amount');
                $model->grand_total_net_pay_amount = Yii::$app->request->post('grand_total_net_pay_amount');
                $model->grand_total_tip_amount = Yii::$app->request->post('grand_total_tip_amount');
                $model->grand_total_total_net_pay_amount = Yii::$app->request->post('grand_total_total_net_pay_amount');

                if(!$model->save()) throw new Exception("Failed to save!");

                $id_employee = Yii::$app->request->post('id_employee');
                $basic_salary = Yii::$app->request->post('basic_salary');
                $probation_pass_amount = Yii::$app->request->post('probation_pass_amount');
                $probation_working_day = Yii::$app->request->post('probation_working_day');
                $probation_per_day_amount = Yii::$app->request->post('probation_per_day_amount');
                $probation_pass_total_amount = Yii::$app->request->post('probation_pass_total_amount');
                $absent = Yii::$app->request->post('absent');
                $absent_deduct_amount = Yii::$app->request->post('absent_deduct_amount');
                $advance_deduct_amount = Yii::$app->request->post('advance_deduct_amount');
                $increase_amount = Yii::$app->request->post('increase_amount');
                $other_amount = Yii::$app->request->post('other_amount');
                $balance_amount = Yii::$app->request->post('balance_amount');
                $service_charge_amount = Yii::$app->request->post('service_charge_amount');
                $bonus_amount = Yii::$app->request->post('bonus_amount');
                $net_pay_amount = Yii::$app->request->post('net_pay_amount');
                $id_payment_method = Yii::$app->request->post('id_payment_method');
                $tip_amount = Yii::$app->request->post('tip_amount');
                $total_net_pay_amount = Yii::$app->request->post('total_net_pay_amount');
                $remark = Yii::$app->request->post('remark');

                PayrollRequestData::deleteAll(['id_payroll_request'=>$model->id]);
                if((!empty($id_employee)) || ($id_employee != '')){
                    foreach ($id_employee as $key => $value) {
                        $data = new PayrollRequestData();
                        $data->id_payroll_request = $model->id;
                        $data->id_employee = $id_employee[$key];
                        $data->basic_salary = $basic_salary[$key];
                        $data->probation_pass_amount = $probation_pass_amount[$key];
                        $data->probation_working_day = $probation_working_day[$key];
                        $data->probation_per_day_amount = $probation_per_day_amount[$key];
                        $data->probation_pass_total_amount = $probation_pass_total_amount[$key];
                        $data->absent = $absent[$key];
                        $data->absent_deduct_amount = $absent_deduct_amount[$key];
                        $data->advance_deduct_amount = $advance_deduct_amount[$key];
                        $data->increase_amount = $increase_amount[$key];
                        $data->other_amount = $other_amount[$key];
                        $data->balance_amount = $balance_amount[$key];
                        $data->service_charge_amount = $service_charge_amount[$key];
                        $data->bonus_amount = $bonus_amount[$key];
                        $data->net_pay_amount = $net_pay_amount[$key];
                        $data->id_payment_method = $id_payment_method[$key];
                        $data->tip_amount = $tip_amount[$key];
                        $data->total_net_pay_amount = $total_net_pay_amount[$key];
                        $data->remark = $remark[$key];
                        if(!$data->save()) throw new Exception("Failed to save payroll data!");
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

        $model_data = Yii::$app->db->createCommand("
            SELECT 
                a.id as id_employee,
                a.employee_code as code,
                b.`name` as department, 
                CONCAT(a.id_prefix, ' ', a.first_name, ' ', a.last_name) as employee_name,
                a.join_date,
                TIMESTAMPDIFF( YEAR, a.join_date, now() ) as p_year,
                TIMESTAMPDIFF( MONTH, a.join_date, now() ) % 12 as p_month,
                FLOOR( TIMESTAMPDIFF( DAY, a.join_date, now() ) % 30.4375 ) as p_day,
                30 as working_day,
                a.basic_salary,
                (
                    SELECT cash_advance_request.amount / cash_advance_request.id_pay_type
                    from cash_advance_request
                    where id_employee = a.id
                    and status = 1
                    and DATE_FORMAT(cash_advance_request.date, '%m') between DATE_FORMAT(NOW(), '%m') AND (DATE_FORMAT(date, '%m') + cash_advance_request.id_pay_type)
                ) as current_advance_deduct_amount
            FROM employee_profile as a
            INNER JOIN department as b on a.id_department = b.id
            ORDER BY b.id, a.join_date ASC
        ")->queryAll();
        $model_data = empty($model_data) ? [] : $model_data;

        $model_payroll_request_data = Yii::$app->db->createCommand("
            SELECT 
                a.employee_code as code,
                b.`name` as department, 
                CONCAT(a.id_prefix, ' ', a.first_name, ' ', a.last_name) as employee_name,
                a.join_date,
                TIMESTAMPDIFF( YEAR, a.join_date, now() ) as p_year,
                TIMESTAMPDIFF( MONTH, a.join_date, now() ) % 12 as p_month,
                FLOOR( TIMESTAMPDIFF( DAY, a.join_date, now() ) % 30.4375 ) as p_day,
                30 as working_day,
                a.basic_salary as current_salary,
                c.*
            FROM employee_profile as a
            INNER JOIN department as b on a.id_department = b.id
            INNER JOIN payroll_request_data as c on c.id_employee = a.id
            WHERE c.id_payroll_request = :id_payroll_request
            ORDER BY b.id, a.join_date ASC
        ")->bindParam(':id_payroll_request', $id)->queryAll();
        $model_payroll_request_data = empty($model_payroll_request_data) ? [] : $model_payroll_request_data;

        $check_data = PayrollRequestData::find()->where(['id_payroll_request'=>$model->id])->all();
        $check_data = empty($check_data) ? [] : $check_data;


        return $this->render('view', [
            'model' => $model,
            'model_data' => $model_data,
            'model_payroll_request_data' => $model_payroll_request_data,
            'check_data' => $check_data
        ]);
    }

    public function actionCreate()
    {
        $model = new PayrollRequest();

        $model->created_date =  date('Y-m-d H:i:s');
        $model->created_by = Yii::$app->user->getId(); 
        if ($model->load(Yii::$app->request->post())) {
            $model->status = 3;
            if($model->save()){
                Yii::$app->session->setFlash('success', "Saved successful");
                return $this->redirect(['payroll-request/view', 'id'=>$model->id, 'smMenu'=>1]);
            }else{
                Yii::$app->session->setFlash('warning', "Failed to save record");
                return $this->redirect(Yii::$app->request->referrer);
            }
            
        }

        return $this->renderAjax('create', [
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

    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionSubmit($id){
        $model = $this->findModel($id);
        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {
            $model->status = 2;
            if(!$model->save()) throw new Exception("Failed to Save!");

            $model_payroll = new Payroll();
            $model_payroll->id_payroll_request = $model->id;
            $model_payroll->doc_id = (new GlobalFunction)->GenerateDocumentID('payroll_request', 4);
            $model_payroll->date = date('Y-m-d');
            $model_payroll->pay_for = $model->id_month;
            $model_payroll->total_net_pay = $model->grand_total_total_net_pay_amount;
            $model_payroll->status = 4;
            $model_payroll->created_date =  date('Y-m-d H:i:s');
            $model_payroll->created_by = Yii::$app->user->getId(); 
            if(!$model_payroll->save()) throw new Exception("Failed to save payroll!");

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Submit successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage());
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }
        
    }

     public function actionDependent(){

        if(Yii::$app->request->isAjax){

            if(Yii::$app->request->post('action') =='get_month'){
                $id = Yii::$app->request->post('id');

                $month_list = Yii::$app->db->createCommand("
                        SELECT *
                        FROM month_list
                        WHERE id not in (SELECT id_month FROM payroll_request WHERE id_year = :id)
                ")->bindParam(':id', $id)->queryAll();

                return json_encode($month_list);

            } 
        }
    }

    protected function findModel($id)
    {
        if (($model = PayrollRequest::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
