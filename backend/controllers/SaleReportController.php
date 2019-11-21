<?php

namespace backend\controllers;

use Yii;
use backend\models\SaleReport; 
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Cookie;
/**
 * SaleReportController implements the CRUD actions for SaleReport model.
 */
class SaleReportController extends Controller
{ 
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

    public function actionInvoice()
    {
        $model = new SaleReport(); 
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        
        $invoiceData = [];
        if ($model->load(Yii::$app->request->post())) {
            
            $from_date = $model->from_date;
            $to_date = $model->to_date;
            $id_customer = $model->id_customer;
            if($id_customer !=""){
                $andCustomer = "AND customer_invoice.id_customer = ".$id_customer;
            }else{
                $andCustomer = "";
            } 
            $invoiceData = Yii::$app->db->createCommand('
                SELECT
                    CONCAT(customer_profile.customer_name," (",customer_profile.company_name,")") as customer_name,
                    customer_profile.id as id_customer,
                    project.project_name as project_name,
                    project.id as id_project,
                    invoice_status.`name` as status,
                    invoice_status.css_class as status_css,
                    customer_invoice.doc_id as doc_id,
                    customer_invoice.date as date,
                    customer_invoice.total_amount as total_amount,
                    customer_invoice.receive_amount as receive_amount,
                    customer_invoice.balance_amount as balance_amount,
                    customer_invoice.id as id_customer_invoice
                FROM customer_invoice
                LEFT JOIN customer_profile on customer_profile.id = customer_invoice.id_customer
                LEFT JOIN project on project.id = customer_invoice.id_project
                LEFT JOIN invoice_status on invoice_status.id = customer_invoice.`status` 
                WHERE customer_invoice.date BETWEEN :from_date AND :to_date
                '.$andCustomer.'
            ')->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
            // Yii::$app->session->setFlash('success', "Successful");
            // return $this->redirect(Yii::$app->request->referrer);
        } 

        if($is_print == 2)//export excel
        {
            return $this->renderAjax('invoice_export_excel', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }else{
            return $this->render('invoice', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]); 
        } 
        
    }

    public function actionItem()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new SaleReport();
        return $this->render('item', [
            'model' => $model, 
        ]);
    }

    public function actionPaymentRecieve()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new SaleReport();
        return $this->render('payment_recieve', [
            'model' => $model, 
        ]);
    }

    public function actionCreditNote()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new SaleReport();
        return $this->render('credit_note', [
            'model' => $model, 
        ]);
    }

    public function actionProposal()
    {
        $model = new SaleReport(); 
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        
        $invoiceData = [];
        if ($model->load(Yii::$app->request->post())) {
            
            $from_date = $model->from_date;
            $to_date = $model->to_date;
            $related_to = $model->related_to;
            if($related_to !=""){
                $andCustomer = "AND IF(proposal.related_id = 1,
                CONCAT(customer_profile.customer_name,' (',customer_profile.company_name,')'),
                CONCAT(lead_profile.lead_name,' (',lead_profile.company_name,')')
            ) ='".$related_to."' ";
            }else{
                $andCustomer = "";
            } 
            $invoiceData = Yii::$app->db->createCommand('
                SELECT 
                IF(proposal.related_id = 1,
                    CONCAT(customer_profile.customer_name," (",customer_profile.company_name,")"),
                    CONCAT(lead_profile.lead_name," (",lead_profile.company_name,")")
                ) as lead_or_customer, 
                proposal.* 
                FROM proposal
                LEFT JOIN customer_profile on customer_profile.id = proposal.id_lead_customer and proposal.related_id = 1
                LEFT JOIN lead_profile on lead_profile.id = proposal.id_lead_customer and proposal.related_id = 2
                WHERE proposal.date BETWEEN :from_date AND :to_date
                '.$andCustomer.'
            ')->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
            // Yii::$app->session->setFlash('success', "Successful");
            // return $this->redirect(Yii::$app->request->referrer);
        } 

        if($is_print == 2)//export excel
        {
            return $this->renderAjax('proposal_export_excel', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }else{
            return $this->render('proposal', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]); 
        } 

    }

    public function actionQuotation()
    {
        $model = new SaleReport(); 
        $request = Yii::$app->request;
        $is_print = Yii::$app->request->post('is_print');
        
        $invoiceData = [];
        if ($model->load(Yii::$app->request->post())) {
            
            $from_date = $model->from_date;
            $to_date = $model->to_date;
            $id_customer = $model->id_customer;
            if($id_customer !=""){
                $andCustomer = "AND quotation.id_customer = ".$id_customer;
            }else{
                $andCustomer = "";
            } 
            $invoiceData = Yii::$app->db->createCommand('
                SELECT
                    customer_profile.id as id_customer,
                    quotation.id as id,
                    quotation.`code` as code,
                    CONCAT(customer_profile.customer_name," (",customer_profile.company_name,")") as customer_name,
                    quotation.date as date,
                    quotation.open_till as open_till,
                    IF(quotation.is_converted_from_proposal = 1,"Yes","No") as is_converted,
                    quotation_status.`name` as status,
                    quotation.total as total
                FROM quotation
                LEFT JOIN customer_profile on customer_profile.id = quotation.id_customer
                LEFT JOIN quotation_status on quotation_status.id = quotation.`status`
                WHERE quotation.date BETWEEN :from_date AND :to_date
                '.$andCustomer.'
            ')->bindParam(':from_date',$from_date)->bindParam(':to_date',$to_date)->queryAll();
        } 

        if($is_print == 2)//export excel
        {
            return $this->renderAjax('quotation_export_excel', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }elseif($is_print == 3){
            return $this->renderAjax('_export_pdf', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]);
        }else{
            return $this->render('quotation', [
                'model' => $model,
                'invoiceData' => $invoiceData ,
            ]); 
        } 
    }

    public function actionCustomer()
    {
        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;
        $model = new SaleReport();
        return $this->render('customer', [
            'model' => $model, 
        ]);
    }
 
}
