<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use backend\models\Task;
use backend\models\StandardOperationStep;
use backend\models\StandardOperation;
use dominus77\sweetalert2\assets\SweetAlert2Asset;
SweetAlert2Asset::register($this);
$base_url =  Yii::getAlias('@web');
$user_position = Yii::$app->user->identity->id_position;
$user_id = Yii::$app->user->identity->id_employee; 
$this->title = 'K.P.I Milestone';
$this->params['breadcrumbs'][] = $this->title;
$this->registerCssFile(
    "@web/plugins/jquery-ui/jquery-ui.min.css", 
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/jquery-ui/jquery-ui.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
if(Yii::$app->user->identity->user_type_id != 1){
$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->andWhere(['id' => $user_position])
    ->all(), 'id', 'position_type');
}else{
$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1]) 
    ->all(), 'id', 'position_type');
$employee_profile = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['status' => 1]) 
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
}
$priority = ArrayHelper::map(\backend\models\Priority::find()
    ->all(), 'id', 'name'); 
$related_to = ArrayHelper::map(\backend\models\TaskRelatedTo::find()
    ->all(), 'id', 'name'); 
?> 
<style>
.modal-lg{
    width: 90%;
}
.panel-eo {
    border-color: #f87232;
} 
.tasklist {
    background-color: rgba(0, 0, 0, 0.04);
    border-radius: 0px 0px 3px 3px;;
    padding: 10px;
    margin: 0px 10px;
}
.tasklist li {
    cursor: -webkit-grab;
    cursor: grab;
    background-color: #fff;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.07);
    border-width: 1px 1px 1px 3px;
    border-style: solid;
    border-color: transparent transparent transparent #b4b4b4;
    padding: 10px 15px 10px 15px;
    margin-bottom: 10px;
}
.titleStyle{
    background: #04274a;
    margin: 0px 10px;
    padding: 0px 10px;
    border-radius: 3px 3px 0px 0px;
    color: white;
    font-weight: 600; 
} 
</style>
<div class="standard-operation-index">  
    <div class="panel"> 
        <div class="panel-body"> 
            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
            ]); ?>
            <div class="row"> 
                <div class="col-md-9"> 
                    <div class="row">
                        <div class="col-md-3"  style="padding: 10px;">
                            <?= $form->field($model, 'id_employee_possition')->widget(Select2::classname(), [
                                'data' => $position,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg', 
                                // 'options' => ['placeholder' => 'Select Position'],
                                'pluginOptions' => [
                                    // 'allowClear' => true
                                ],
                            ])->label(false); ?> 
                        </div>
                        <?php   
                        if(Yii::$app->user->identity->user_type_id == 1){
                        ?>
                        <div class="col-md-3"  style="padding: 10px;">
                            <?= $form->field($model, 'by_assigned')->widget(Select2::classname(), [
                                    'data' => $employee_profile,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg', 
                                    'options' => ['placeholder' => 'Select Employee'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ])->label(false); 
                            ?> 
                        </div>
                        <?php } ?>
                        <div class="col-md-3"  style="padding: 10px;">
                            <?= $form->field($model, 'by_related_to')->widget(Select2::classname(), [
                                    'data' => $related_to,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg', 
                                    'options' => ['placeholder' => 'Select Related To'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ])->label(false); 
                            ?>
                        </div>
                        <div class="col-md-3"  style="padding: 10px;">
                            <?= $form->field($model, 'priority')->widget(Select2::classname(), [
                                    'data' => $priority,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg', 
                                    'options' => ['placeholder' => 'Select Priority'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ])->label(false); 
                            ?>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="text-right" style="padding: 10px;">  
                        <?= Html::submitButton('Search', ['class' => 'btn btn-success btn-rounded']) ?>
                        <!-- <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                            Search <i class="fa fa-search go-right"></i>
                        </button> -->
                        <a type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['standard-operation/create']) ?>">Add New <i class="fa fa-plus-square go-right"></i></a> 
                    </div> 
                </div>
            </div>
        <?php ActiveForm::end(); ?>
            <?php
                Modal::begin([
                    'header' => ' <h4 class="modal-title">'.'Standard Operation Processing'.'</h4>',
                    'id' => 'modal',
                    'class' => 'modal fade',
                    'size' => 'modal-lg',
                ]);
                echo "<div id='modalContent'></div>";
                Modal::end();
            
                if(count($standardOperationStep) <= 0){
                    echo "<br><div class='text-lg text-center' style='color: #f87233;'>This position does not contain any S.O.P step.</div>";
                }
            ?>

            <div class="row" style="display:-webkit-inline-box; overflow: scroll;width: 100%;padding: 0px; margin: 0px 0px -10px -3px;">
                <?php   
                    if(Yii::$app->user->identity->id != 1){
                        $val_if_admin = "and standard_operation.assign_to =".$user_id;
                    }else{
                        $val_if_admin = "";
                    } 

                    if($model->by_assigned != ""){
                        $whereEmployee = "and standard_operation.assign_to =".$model->by_assigned;
                    }else{
                        $whereEmployee = "";
                    }

                    if($model->priority != ""){
                        $wherePriority = "and standard_operation.id_priority =".$model->priority;
                    }else{
                        $wherePriority = "";
                    }  
                    if($model->by_related_to != ""){
                        $whereRelatedTo = "and standard_operation.id_related_to =".$model->by_related_to;
                    }else{
                        $whereRelatedTo = "";
                    }   
                    foreach ($standardOperationStep as $sop_step_content) {
                    $id_sop_step_content = $sop_step_content["id"];
                    $standard_operation_data = Yii::$app->db->createCommand('
                        SELECT standard_operation.*,
                            CONCAT(user_data.first_name," ",user_data.last_name) as user_name,
                            uploaded_file.filename as user_img_url,
                            priority.css_class,
                            priority.name as priority_name, 
                            task_related_to.`name` as related_to
                        FROM standard_operation
                            LEFT JOIN user as user_data on user_data.id = standard_operation.created_by
                            LEFT JOIN uploaded_file on uploaded_file.id = user_data.img_url
                            LEFT JOIN priority on priority.id = standard_operation.id_priority
                            LEFT JOIN task_related_to on task_related_to.id = standard_operation.id_related_to
                        WHERE standard_operation.id_standard_operation_step = "'.$id_sop_step_content.'"
                        '.$val_if_admin.'
                        '.$whereEmployee.'
                        '.$wherePriority.'
                        '.$whereRelatedTo.'
                    ')->queryAll();
                    
                ?> 
                    <div style="width: 380px;">    
                        <h4 class="panel-title text-normal titleStyle" style="background: <?=$sop_step_content["css"];?>"><?php echo $sop_step_content["name"]; ?></h4> 
                        <ul class="sortable ui-sortable sortable-list tasklist list-unstyled screen_height" id="sort<?php echo $sop_step_content["id"]; ?>" data-id-sop-step="<?php echo $sop_step_content["id"]; ?>" style="overflow: scroll;">
                           <?php
                                if (!empty($standard_operation_data)) {
                                    foreach ($standard_operation_data as $sop_content) {
                                        $css_color = $sop_content['css_class'];
                                        $priority_color = str_replace("label","task",$css_color); 
                                        $priority_text_color = str_replace("label","text",$css_color); 
                            ?>
                                    <li class="<?=$priority_color;?> sop_content" data-task-id="<?php echo $sop_content["id"]; ?>" style="border-width: 0px 4px 0px 4px;">
                                        <p class="text-semibold text-primary text-md" data-target="#demo-default-modal" data-toggle="modal" id="modalButtonUpdate" value="<?= Url::toRoute(['standard-operation/form-view','id'=>$sop_content["id"]]) ?>" style="cursor: pointer;"><?php echo $sop_content["name"]; ?></p>
                                        <p class="text-mint text-sm"><?= $sop_content['related_to'] == "" ? "" : "Related To: ".$sop_content['related_to'];?></p> 
                                        <p class="<?=$priority_text_color;?> text-xs" ><?= $sop_content['priority_name'] == "" ? "" : "Priority: ".$sop_content['priority_name'];?></p>
                                        <p class="text-primary pad-btm bord-btm"><?= $sop_content['description'];?></p>    
                                        <a href="#" class="task-footer">
                                            <span class="box-inline"> 
                                                <img class="img-xs img-circle" src="<?= $base_url.'/'.$sop_content["user_img_url"];?>" alt="User" onError="this.onerror=null;this.src='<?=$base_url?>/backend/uploads/NoPicAvailable.jpg';">
                                                <?=$sop_content['user_name'];?>
                                            </span> 
                                            <span class="text-sm"><p style="font-size: 12px;display: -webkit-inline-box;"><i class="fa fa-clock-o text-main"></i> <?= time_elapsed_string($sop_content['created_date']);?></p></span> 
                                        </a>
                                    </li>
                            <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                <?php
                    }
                ?> 
            </div>
        </div>
    </div>
</div>

<?php 
 
$url = Yii::getAlias('@web')."/standard-operation/update-step-sop";
 
$script=<<<JS
 
var resize_screen = $(window).height() - 295; 
$(".screen_height").css({"height": resize_screen});

var url = "$url";
 
$( function() { 
     $('ul[id^="sort"]').sortable({
        connectWith: ".sortable",
        placeholder: "task-placeholder",
        forcePlaceholderSize: true,
         receive: function (e, ui) {
             var id_standard_operation_step = $(ui.item).parent(".sortable").data("id-sop-step");
             var task_id = $(ui.item).data("task-id"); 
             $.ajax({
                url: url,
                type:'post',
                data:{
                    id_standard_operation_step: id_standard_operation_step,
                    task_id: task_id,
                    action:'update_step_sop'
                }, 
                success: function(response){
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });

                    Toast.fire({
                        type: 'success',
                        title: 'S.O.P Updated.'
                    })
                }
            });
        }
     
     }).disableSelection();
});

// Start Modal Popup
$(document).on("click","#modalButton",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
});

$(document).on("click","#modalButtonView",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
});

$(document).on("click","#modalButtonUpdate",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
});
// End Modal Popup

JS;

$this->registerJs($script);

// start count day time
function time_elapsed_string($datetime, $full = false) 
{
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}
// end count day time

?>