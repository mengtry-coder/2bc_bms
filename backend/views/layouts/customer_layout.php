
<?php 
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use backend\models\Customer; 
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url; 
use backend\models\SystemSetting;
$system_setting = SystemSetting::find()->one();
if(empty($system_setting)){
    $system_setting = 1;
}else{
    $system_setting = $system_setting->active;
}

$this->beginContent('@app/views/layouts/main.php');
// $customer_list = ArrayHelper::map(\backend\models\customerProfile::find()
//     ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $request = Yii::$app->request;
    $smMenu = 1;
    $id_customer_profiles = $request->get('id',0);
    if($id_customer_profiles !=0){
        $id_customer_profile = $id_customer_profiles;
    }else{
        $id_customer_profile = $request->get('id_customer_profile');
    }
    $controllerName = Yii::$app->controller->id;
    $actionName = Yii::$app->controller->action->id; 

?> 
<style>
.panel-eo {
    border-color: #f87232;
} 
</style>

<div class="row"> 
    <div class="col-md-2 col-sm-3">
        <div class="panel">
            <div class="panel-heading panel-eo">
                <h3 class="panel-title" style="font-weight: 500;">Customer Menu</h3>
            </div>
            <div class="panel-body">
                <!--Link Items-->
                <!--===================================================-->
                <div class="list-group"> 
                    <a class="list-group-item emNavActiveOnAction_profile" href="<?= Url::toRoute('customer-profile/profile?id='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Profile</a> 
                    <?php if($system_setting == 1){ ?>
                    <a class="list-group-item emNavActive_customer-profile-solution" href="<?= Url::toRoute('customer-profile/solution?id='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Solution</a>
                    <?php } ?>
                    <a class="list-group-item emNavActive_customer-profile-contact" href="<?= Url::toRoute('customer-profile-contact/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Contact</a>
                    <a class="list-group-item emNavActive_customer-invoice" href="<?= Url::toRoute('customer-invoice/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Invoice</a>
                    <a class="list-group-item emNavActive_customer-payment" href="<?= Url::toRoute('customer-payment/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Payment</a>
                    <a class="list-group-item emNavActive_contract" href="<?= Url::toRoute('contract/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Contract</a>
                    <a class="list-group-item emNavActive_project" href="<?= Url::toRoute('project/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Project</a>
                    <a class="list-group-item emNavActive_task" href="<?= Url::toRoute('task/index/?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Task</a> 
                    <a class="list-group-item emNavActiveOnAction_document" href="<?= Url::toRoute('customer-profile/document?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Document</a>
                    <a class="list-group-item emNavActive_customer-profile-note" href="<?= Url::toRoute('customer-profile-note/index?id_customer_profile='.$id_customer_profile.'&smMenu='.$smMenu) ?>">Note</a>
                </div>
                <!--===================================================-->

            </div>
        </div>
    </div>
    <div class="col-md-10 col-sm-9"> 
        <div class="panel">
            <div class="panel-heading panel-eo">
                <div class="panel-control">
                    <button class="btn btn-default" data-panel="fullscreen">
                        <i class="icon-max demo-psi-maximize-3"></i>
                        <i class="icon-min demo-psi-minimize-3"></i>
                    </button>
                </div>
                <h3 class="panel-title" style="font-weight: 500;"><?=$this->title;?></h3>
            </div>
            <div class="panel-body">
                <?= $content;?>
            </div>
        </div>   
    </div>
</div> 
<?php $this->endContent(); ?>
<style media="screen">
 .emNavActive_<?=$controllerName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 .emNavActiveOnAction_<?=$actionName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 </style>