<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use backend\models\CustomerInvoice;
use backend\models\LeadProfile;
use backend\models\Project;
use backend\models\Task;
use backend\models\Quotation;
use backend\models\Proposal;
use backend\models\ProjectNote; 
use backend\models\User;
/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    // public function behaviors()
    // {
    //     return [
    //         'access' => [
    //             'class' => AccessControl::className(),
    //             'rules' => [
    //                 [
    //                     'actions' => ['login'],
    //                     'allow' => true,
    //                 ],
    //                 [
    //                     'actions' => ['logout', 'index'],
    //                     'allow' => true,
    //                     'roles' => ['@'],
    //                 ],
    //             ],
    //         ],
    //         'verbs' => [
    //             'class' => VerbFilter::className(),
    //             'actions' => [
    //                 'logout' => ['post'],
    //             ],
    //         ],
    //     ];
    // }

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error','user','slide-show'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => User::getUserPermission(Yii::$app->controller->id),
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
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {

         
        // Start Dashboard
        $waitingInvoiceToPay = CustomerInvoice::find()->where(['!=','status',1])->count();
        $allInvoiceToPay = CustomerInvoice::find()->count();

        $invoice_overview_1 = CustomerInvoice::find()->where(['status'=>1])->count();
        $invoice_overview_2 = CustomerInvoice::find()->where(['status'=>2])->count();
        $invoice_overview_3 = CustomerInvoice::find()->where(['status'=>3])->count();
        $invoice_overview_4 = CustomerInvoice::find()->where(['status'=>4])->count();

        $countInvoiceAmount_1 = CustomerInvoice::find()->where(['status'=>1])->sum('total_amount');//PAID
        $countInvoiceAmount_2 = CustomerInvoice::find()->where(['status'=>2])->sum('total_amount');//OVERDUE
        $countInvoiceAmount_3 = CustomerInvoice::find()->where(['status'=>3])->sum('total_amount');//PARTIALLY PAID

        $leadConverted = LeadProfile::find()->where(['customer_status'=>6])->count();
        $allLead = LeadProfile::find()->count(); 

        $lead_customer_status_1 = LeadProfile::find()->where(['customer_status'=>1])->count();
        $lead_customer_status_2 = LeadProfile::find()->where(['customer_status'=>2])->count();
        $lead_customer_status_3 = LeadProfile::find()->where(['customer_status'=>3])->count();
        $lead_customer_status_4 = LeadProfile::find()->where(['customer_status'=>4])->count();
        $lead_customer_status_5 = LeadProfile::find()->where(['customer_status'=>5])->count();
        $lead_customer_status_6 = LeadProfile::find()->where(['customer_status'=>6])->count();

        $taskCompleted = Task::find()->where(['=','status',5])->count();
        $allTask = Task::find()->count();

        $projectInprogress = Project::find()->where(['project.status'=>2])->count();
        $allProject = Project::find()->count();

        $status_1 = Project::find()->where(['project.status'=>1])->count();
        $status_2 = Project::find()->where(['project.status'=>2])->count();
        $status_3 = Project::find()->where(['project.status'=>3])->count();
        $status_4 = Project::find()->where(['project.status'=>4])->count();
        $status_5 = Project::find()->where(['project.status'=>5])->count();
        
        $allQuotation = Quotation::find()->count();
        $quotation_status_1 = Quotation::find()->where(['status'=>1])->count();
        $quotation_status_2 = Quotation::find()->where(['status'=>2])->count(); 
        $quotation_status_4 = Quotation::find()->where(['status'=>4])->count();
        $quotation_status_5 = Quotation::find()->where(['status'=>5])->count();
        $quotation_status_6 = Quotation::find()->where(['status'=>6])->count();

        $allProposal = Proposal::find()->count();
        $proposal_status_1 = Proposal::find()->where(['status'=>1])->count();
        $proposal_status_2 = Proposal::find()->where(['status'=>2])->count(); 
        $proposal_status_3 = Proposal::find()->where(['status'=>3])->count();
        $proposal_status_4 = Proposal::find()->where(['status'=>4])->count();
        $proposal_status_5 = Proposal::find()->where(['status'=>5])->count();
        $proposal_status_6 = Proposal::find()->where(['status'=>6])->count();
        // End Dashboard

        $user_id = Yii::$app->user->identity->id;
        $id_employee = Yii::$app->user->identity->id_employee;
        $user_type_id = Yii::$app->user->identity->user_type_id;
        if($user_type_id != 1 && $user_id != 1){ 
            return $this->redirect(['task/index?smMenu=1']);
        }else{
            return $this->render('index',[
                'waitingInvoiceToPay' => $waitingInvoiceToPay,
                'allInvoiceToPay' => $allInvoiceToPay,
                'leadConverted' => $leadConverted,
                'allLead' => $allLead,
                'projectInprogress' => $projectInprogress,
                'allProject' => $allProject,
                'taskCompleted' => $taskCompleted,
                
                'allTask' => $allTask,
                'status_1' => $status_1,
                'status_2' => $status_2,
                'status_3' => $status_3,
                'status_4' => $status_4,
                'status_5' => $status_5, 
    
                'lead_customer_status_1' => $lead_customer_status_1,
                'lead_customer_status_2' => $lead_customer_status_2,
                'lead_customer_status_3' => $lead_customer_status_3,
                'lead_customer_status_4' => $lead_customer_status_4,
                'lead_customer_status_5' => $lead_customer_status_5,
                'lead_customer_status_6' => $lead_customer_status_6,
    
                'invoice_overview_1' => $invoice_overview_1,
                'invoice_overview_2' => $invoice_overview_2,
                'invoice_overview_3' => $invoice_overview_3,
                'invoice_overview_4' => $invoice_overview_4,
    
                'allQuotation' => $allQuotation,
                'quotation_status_1' => $quotation_status_1,
                'quotation_status_2' => $quotation_status_2, 
                'quotation_status_4' => $quotation_status_4,
                'quotation_status_5' => $quotation_status_5,
                'quotation_status_6' => $quotation_status_6,
    
                'allProposal' => $allProposal,
                'proposal_status_1' => $proposal_status_1,
                'proposal_status_2' => $proposal_status_2, 
                'proposal_status_3' => $proposal_status_3,
                'proposal_status_4' => $proposal_status_4,
                'proposal_status_5' => $proposal_status_5,
                'proposal_status_6' => $proposal_status_6,
                'countInvoiceAmount_1' => $countInvoiceAmount_1,
                'countInvoiceAmount_2' => $countInvoiceAmount_2,
                'countInvoiceAmount_3' => $countInvoiceAmount_3,
            ]);
        } 
    }

    /**
     * Login action.
     *
     * @return string
     */
    // public function actionLogin()
    // {
    //     $this->layout = "login";
    //     if (!Yii::$app->user->isGuest) { 
    //         return $this->goHome();
    //     }

    //     $model = new LoginForm();
    //     if ($model->load(Yii::$app->request->post())) {

    //         if($model->login()){

    //             $user_id = Yii::$app->user->getId();
    //             $user = \common\models\User::findOne($user_id);
    //             $user_type_id = $user->user_type_id;

    //             if($user_type_id == 3){
    //                 return $this->redirect(['project/my-project','user'=>$user_id]);
    //             }else{
    //                 return $this->goBack();
    //             }
    //         }
            
    //     } else {
    //         $model->password = ''; 
    //         return $this->render('login', [
    //             'model' => $model,
    //         ]);
    //     }
    // }

    public function actionLogin()
    {
        $this->layout = "login";
        if (!Yii::$app->user->isGuest) { 
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            
            $user_id = Yii::$app->user->getId();
            $user = \common\models\User::findOne($user_id);
            $user_type_id = $user->user_type_id;

            if($user_type_id == 3){
                return $this->redirect(['standard-operation/index']);
                // return $this->redirect(['project/my-project','user'=>$user_id]);
            }else{
                return $this->goBack();
            }
        } else {
            $model->password = '';

            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionTesting($id_project)
    {
        $id_user = Yii::$app->user->identity->id;
        $model_note = ProjectNote::findOne(['id_project'=>$id_project, 'id_user'=>$id_user]);
        if(empty($model_note)){
            $model_note = new ProjectNote();
        }

        $model = $this->findModel($id_project);

        $current_page = Yii::$app->controller->id."-index";
        $this->view->params['current_page'] = $current_page;

        if ($model_note->load(Yii::$app->request->post())) {

            $model_note->id_project = $id_project;
            $model_note->id_user = $id_user;

            if($model_note->save()){
                Yii::$app->session->setFlash('success', "Record updated successfully");
                return $this->redirect(Yii::$app->request->referrer);
            }else{
                Yii::$app->session->setFlash('warning', "Failed to update record");
                return $this->redirect(Yii::$app->request->referrer);
            }
        }
        return $this->render('testing', [
            'model' => $model,
            'model_note' => $model_note,
        ]);
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    } 
    protected function findModel($id)
    {
        if (($model = Project::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
