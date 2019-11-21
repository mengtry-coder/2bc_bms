
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
    $id_standard_operation_procedure_set_ups = $request->get('id',0);
    if($id_standard_operation_procedure_set_ups !=0){
        $id_standard_operation_procedure_set_up = $id_standard_operation_procedure_set_ups;
    }else{
        $id_standard_operation_procedure_set_up = $request->get('id_standard_operation_procedure_set_up');
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
                <h3 class="panel-title" style="font-weight: 500;">S.O.P Menu</h3>
            </div>
            <div class="panel-body"> 
                <div class="list-group">  
                    <a class="list-group-item emNavActiveOnAction_sop-setup" href="<?= Url::toRoute('standard-operation-procedure-set-up/sop-setup?id='.$id_standard_operation_procedure_set_up.'&smMenu='.$smMenu) ?>">S.O.P Detail</a>
                    <a class="list-group-item emNavActive_standard-operation-procedure-article" href="<?= Url::toRoute('standard-operation-procedure-article/index?id='.$id_standard_operation_procedure_set_up.'&smMenu='.$smMenu) ?>">Acticle</a>
                    <a class="list-group-item emNavActiveOnAction_document" href="<?= Url::toRoute('standard-operation-procedure-set-up/document?id_standard_operation_procedure_set_up='.$id_standard_operation_procedure_set_up.'&smMenu='.$smMenu) ?>">Document</a>
                </div>
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