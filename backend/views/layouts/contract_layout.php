
<?php 
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use backend\models\Customer; 
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url; 

$this->beginContent('@app/views/layouts/main.php');
// $customer_list = ArrayHelper::map(\backend\models\customerProfile::find()
//     ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $request = Yii::$app->request;
    $smMenu = 1;
    $id_contracts = $request->get('id',0);
    if($id_contracts !=0){
        $id_contract = $id_contracts;
    }else{
        $id_contract = $request->get('id_contract');
    }
    $controllerName = Yii::$app->controller->id;
    $actionName = Yii::$app->controller->action->id; 

?> 
<style>
.panel-eo {
    border-color: #f87232;
} 
.fullscreen{
    overflow: scroll;
}
</style>

<div class="row"> 
    <div class="col-md-2 col-sm-3 no-print">
        <div class="panel">
            <div class="panel-heading panel-eo">
                <h3 class="panel-title" style="font-weight: 500;">Contract Menu</h3>
            </div>
            <div class="panel-body">
                <!--Link Items-->
                <!--===================================================-->
                <div class="list-group"> 
                    <a class="list-group-item emNavActiveOnAction_overview" href="<?= Url::toRoute('contract/overview?id='.$id_contract.'&smMenu='.$smMenu) ?>">Overview</a>  
                    <a class="list-group-item emNavActiveOnAction_detail" href="<?= Url::toRoute('contract/detail?id='.$id_contract.'&smMenu='.$smMenu) ?>">Contract</a>  
                    <a class="list-group-item emNavActive_task" href="<?= Url::toRoute('task/index/?id_contract='.$id_contract.'&smMenu='.$smMenu) ?>">Task</a> 
                    <a class="list-group-item emNavActiveOnAction_document" href="<?= Url::toRoute('contract/document?id_contract='.$id_contract.'&smMenu='.$smMenu) ?>">Document</a>
                    <a class="list-group-item emNavActive_contract-note" href="<?= Url::toRoute('contract-note/index?id_contract='.$id_contract.'&smMenu='.$smMenu) ?>">Note</a>
                </div>
                <!--===================================================-->

            </div>
        </div>
    </div>
    <div class="col-md-10 col-sm-9"> 
        <div class="panel">
            <div class="panel-heading panel-eo no-print">
                <div class="panel-control">
                    <button class="btn btn-default" data-panel="fullscreen">
                        <i class="icon-max demo-psi-maximize-3"></i>
                        <i class="icon-min demo-psi-minimize-3"></i>
                    </button>
                </div>
                <h3 class="panel-title" style="font-weight: 500;"><?=$this->title;?></h3>
            </div>
            <div class="panel-body" style="overflow: auto;">
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