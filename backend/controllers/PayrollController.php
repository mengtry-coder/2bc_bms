<?php

namespace backend\controllers;

use Yii;
use backend\models\Payroll;
use backend\models\PayrollRequest;
use backend\models\PayrollRequestData;
use backend\models\PayrollSearch;
use backend\models\FinanceChartOfAccount;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
use common\models\GlobalFunction;
use yii\base\Exception;
/**
 * PayrollController implements the CRUD actions for Payroll model.
 */
class PayrollController extends Controller
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
     * Lists all Payroll models.
     * @return mixed
     */
    public function actionIndex()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        
        $searchModel = new PayrollSearch();
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

    public function actionView($id)
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        $model = Payroll::findOne($id);
        $model_payroll_request = PayrollRequest::findOne($model->id_payroll_request);
        $id_payroll_request = $model->id_payroll_request;

        $model_data = Yii::$app->db->createCommand("
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
        ")->bindParam(':id_payroll_request', $id_payroll_request)->queryAll();
        $model_payroll_request_data = empty($model_data) ? [] : $model_data;

        $check_data = PayrollRequestData::find()->where(['id_payroll_request'=>$model->id])->all();
        $check_data = empty($check_data) ? [] : $check_data;

        return $this->render('view', [
            'model' => $model,
            'model_data' => $model_data,
            'model_payroll_request_data' => $model_payroll_request_data,
            'check_data' => $check_data
        ]);
    }

    public function actionApprove($id)
    {
        $model = $this->findModel($id);

        $model->updated_date =  date('Y-m-d H:i:s');
        $model->updated_by = Yii::$app->user->getId(); 
        $model->status = 1;
        $model->save();

        if ($model->load(Yii::$app->request->post())) {
            $transaction_exception = Yii::$app->db->beginTransaction();

            try 
            {
               
                $payroll = new Payroll();
                $payroll->id_payroll_request = $model->id_payroll_request;
                $payroll->doc_id = (new GlobalFunction)->GenerateDocumentID('expense', 3);
                $payroll->date = $model->date;
                $payroll->pay_for = $model->pay_for;
                $payroll->total_net_pay = $model->total_net_pay;
                $payroll->chart_of_account = $model->chart_of_account;
                $payroll->amount = $model->amount;
                $payroll->amount_in_word = $model->amount_in_word;
                $payroll->status = 2;
                $payroll->created_date =  date('Y-m-d H:i:s');
                $payroll->created_by = Yii::$app->user->getId(); 
                if(!$payroll->save()) throw new Exception("Failed to Save!");

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Payroll Expense';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = 'Employee Payroll';
                $chart_account_bank->name_type = 'employee';
                $chart_account_bank->description = "Payroll Expense for ". $model->month->name. ": ". $model->amount_in_word;
                $chart_account_bank->debit = 0;
                $chart_account_bank->credit = $model->amount;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 3; //Bank
                $chart_account_bank->chart_of_account = $model->chart_of_account; //Cash on Hand / in Bank
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Error Code #002");}
                GlobalFunction::AutoCorrectChartOfAccount(3, $model->chart_of_account);
                //End Chart of Account Bank

                $chart_account_bank = new FinanceChartOfAccount();
                $chart_account_bank->date = $model->date;
                $chart_account_bank->transaction_type = 'Payroll Expense';
                $chart_account_bank->doc_id = $model->doc_id;
                $chart_account_bank->name = 'Employee Payroll';
                $chart_account_bank->name_type = 'employee';
                $chart_account_bank->description = "Payroll Expense for ". $model->month->name. ": ". $model->amount_in_word;
                $chart_account_bank->debit = $model->amount;
                $chart_account_bank->credit = 0;
                $chart_account_bank->balance = $model->amount;
                $chart_account_bank->account_type = 2;
                $chart_account_bank->chart_of_account = 22;
                $chart_account_bank->created_date = date('Y-m-d H:i:s');
                $chart_account_bank->created_by = Yii::$app->user->getId();
                $chart_account_bank->status = 1;
                if(!$chart_account_bank->save()){throw new Exception("Error Code #003");}
                GlobalFunction::AutoCorrectChartOfAccount(2, 22);

                $id_payroll_request = $model->id_payroll_request;
                $model_payroll_request = Yii::$app->db->createCommand("
                    SELECT a.id_employee, a.advance_deduct_amount
                    from payroll_request_data as a 
                    INNER JOIN payroll_request as b on a.id_payroll_request = b.id
                    where a.advance_deduct_amount > 0
                    AND b.id = :id_payroll_request
                    ")->bindParam(':id_payroll_request', $id_payroll_request)->queryAll();
                $model_payroll_request = empty($model_payroll_request) ? [] : $model_payroll_request;
                
                foreach ($model_payroll_request as $key => $value) {
                    $chart_account_bank = new FinanceChartOfAccount();
                    $chart_account_bank->date = $model->date;
                    $chart_account_bank->transaction_type = 'Payroll Expense';
                    $chart_account_bank->doc_id = $model->doc_id;
                    $chart_account_bank->name = $value['id_employee'];
                    $chart_account_bank->name_type = 'employee';
                    $chart_account_bank->description = "Deduct Cash Advance ".$value['advance_deduct_amount'];
                    $chart_account_bank->debit = $value['advance_deduct_amount'];
                    $chart_account_bank->credit = 0;
                    $chart_account_bank->balance = $value['advance_deduct_amount'];
                    $chart_account_bank->account_type = 9;
                    $chart_account_bank->chart_of_account = 51;
                    $chart_account_bank->created_date = date('Y-m-d H:i:s');
                    $chart_account_bank->created_by = Yii::$app->user->getId();
                    $chart_account_bank->status = 1;
                    if(!$chart_account_bank->save()){throw new Exception("Error Code #004");}
                }
                GlobalFunction::AutoCorrectChartOfAccount(9, 51);

                $transaction_exception->commit();
                Yii::$app->session->setFlash('success', "Approved successful");
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

    public function actionReject($id)
    {
        $model = $this->findModel($id);
        $transaction_exception = Yii::$app->db->beginTransaction();

        try 
        {
            $model->status = 3;
            $model->updated_date =  date('Y-m-d H:i:s');
            $model->updated_by = Yii::$app->user->getId(); 
            if(!$model->save()) throw new Exception("Failed to Save!");

            $model_payroll_request = \backend\models\PayrollRequest::findOne($model->id_payroll_request);
            $model_payroll_request->status = 0;
            if(!$model_payroll_request->save()) throw new Exception("Failed to Save Payroll request!");

            $transaction_exception->commit();
            Yii::$app->session->setFlash('success', "Rejected successful");
            return $this->redirect(Yii::$app->request->referrer);
        }
        catch (Exception $ex)
        {
            Yii::$app->session->setFlash('warning', $ex->getMessage());
            $transaction_exception->rollBack();
            return $this->redirect(Yii::$app->request->referrer);
        }
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

    /**
     * Deletes an existing Payroll model.
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
     * Finds the Payroll model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Payroll the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Payroll::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
