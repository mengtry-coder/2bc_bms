<?php
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\helpers\Html;
$controllerName = Yii::$app->controller->id;
$actionName = Yii::$app->controller->action->id;
$request = Yii::$app->request;
    $smMenu = 1;
    $id_lead_profiles = $request->get('id',0);
    if($id_lead_profiles !=0){
        $id_lead_profile = $id_lead_profiles;
    }else{
        $id_lead_profile = $request->get('id_lead_profile');
    }

?>
<div class="panel">
    <div class="panel-heading panel-eo">
        <h3 class="panel-title" style="font-weight: 500;">Sale Report Menu</h3>
    </div>
    <div class="panel-body">
        <div class="list-group">
            <a class="list-group-item emNavActiveOnAction_report" href="<?= Url::toRoute('employee-report/report?smMenu='.$smMenu) ?>">Employee</a>
            <a class="list-group-item emNavActiveOnAction_project" href="<?= Url::toRoute('employee-report/project?smMenu='.$smMenu) ?>">Projects</a>
            <a class="list-group-item emNavActiveOnAction_tasks" href="<?= Url::toRoute('employee-report/tasks?smMenu='.$smMenu) ?>">Tasks</a>
        </div>
    </div>
</div>

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
