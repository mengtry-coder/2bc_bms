
<?php 
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use backend\models\lead; 
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url; 

$this->beginContent('@app/views/layouts/main.php');
// $lead_list = ArrayHelper::map(\backend\models\leadProfile::find()
//     ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
    $request = Yii::$app->request;
    $smMenu = 1;
    $id_lead_profiles = $request->get('id',0);
    if($id_lead_profiles !=0){
        $id_lead_profile = $id_lead_profiles;
    }else{
        $id_lead_profile = $request->get('id_lead_profile');
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
                <h3 class="panel-title" style="font-weight: 500;">Lead Menu</h3>
            </div>
            <div class="panel-body">
                <!--Link Items-->
                <!--===================================================-->
                <div class="list-group"> 
                    <a class="list-group-item emNavActiveOnAction_profile" href="<?= Url::toRoute('lead-profile/profile?id='.$id_lead_profile.'&smMenu='.$smMenu) ?>">Profile</a> 
                    <a class="list-group-item emNavActive_proposal" href="<?= Url::toRoute('proposal/index?id_lead_profile='.$id_lead_profile.'&smMenu='.$smMenu) ?>">Proposals</a>
                    <a class="list-group-item emNavActive_task" href="<?= Url::toRoute('task/index/?id_lead_profile='.$id_lead_profile.'&smMenu='.$smMenu) ?>">Task</a> 
                    <a class="list-group-item emNavActiveOnAction_document" href="<?= Url::toRoute('lead-profile/document?id_lead_profile='.$id_lead_profile.'&smMenu='.$smMenu) ?>">Document</a>
                    <a class="list-group-item emNavActive_lead-profile-note" href="<?= Url::toRoute('lead-profile-note/index?id_lead_profile='.$id_lead_profile.'&smMenu='.$smMenu) ?>">Note</a>
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