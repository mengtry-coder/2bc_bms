<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\StandardOperationCheckList;

$base_url = Yii::getAlias('@web'); 
 
$sopStep = ArrayHelper::map(\backend\models\StandardOperationStep::find()
    ->all(), 'id', 'name');
 
$priority = ArrayHelper::map(\backend\models\Priority::find()
    ->all(), 'id', 'name'); 

$related_to = ArrayHelper::map(\backend\models\TaskRelatedTo::find()
    ->all(), 'id', 'name'); 

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['id_position'=> $model->id_employee_position])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$time_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-clock"></i></span> {input} </div>{error}{hint}';

$related_to_profile = [];
$response = [];
if($model->id_related_to == 1){ //Project
    $response = Yii::$app->db->createCommand("
        SELECT id, project_name as profile_name
        FROM project
    ")->queryAll();
} else if($model->id_related_to == 2){ //Invoice
    $response = Yii::$app->db->createCommand("
        SELECT a.id, CONCAT(b.customer_name, ' (', b.company_name,')') as profile_name
        FROM customer_invoice as a
        INNER JOIN customer_profile as b on a.id_customer = b.id
    ")->queryAll();
} else if($model->id_related_to == 3){ //Customer
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
        FROM customer_profile
    ")->queryAll(); 
} else if($model->id_related_to == 4){ //Expense
    $response = Yii::$app->db->createCommand("
        SELECT id, 
            (CASE
                WHEN id_related_to = 1 THEN (SELECT CONCAT(supplier_name, ' (', company_name,')') FROM supplier_profile WHERE id = id_related_profile)
                WHEN id_related_to = 2 THEN (SELECT CONCAT(customer_name, ' (', company_name,')') FROM customer_profile WHERE id = id_related_profile)
                WHEN id_related_to = 3 THEN (SELECT project_name FROM project WHERE id = id_related_profile)
            END) as profile_name
        FROM expense
    ")->queryAll();
} else if($model->id_related_to == 5){ //Contract
    $response = Yii::$app->db->createCommand("
        SELECT id, subject as profile_name
        FROM contract
    ")->queryAll();
} else if($model->id_related_to == 6){ //Lead
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(lead_name, ' (', company_name,')') as profile_name
        FROM lead_profile
        WHERE customer_status <> 6 
    ")->queryAll();
} else if($model->id_related_to == 7){ //Proposal
    $response = Yii::$app->db->createCommand("
        SELECT id, name as profile_name
        FROM proposal
    ")->queryAll();
}
$related_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
 

?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
</style>
<div class="standardoperation-form-view">

<?php 

$validationUrl = ['task/validation'];
if (!$model->isNewRecord){
    $validationUrl['id'] = $model->id;
}

$form = ActiveForm::begin([
    'id' => $model->formName(),
    'enableAjaxValidation' => false,
    'enableClientValidation' => true,
    'options' => ['autocomplete' => 'off'],
    'validationUrl' => $validationUrl
]); 
?>
 
<div class="row"> 
    <div class="col-md-4">
        <div class="panel panel-bordered panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">SOP Overview</h3>
            </div>
            <div class="panel-body" style="margin-bottom: -20px;">
                <div class="row"> 
                    <div class="col-md-12">
                        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                    </div>
                    <div class="col-md-12">
                        <?= $form->field($model, 'id_priority')->widget(Select2::classname(), [
                                'data' => $priority,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]);
                        ?>
                    </div>
                    <div class="col-md-12">
                        <?= $form->field($model, 'id_related_to')->widget(Select2::classname(), [
                                'data' => $related_to,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]);
                        ?>  
                    </div>
                    <div class="col-md-12">
                        <?= $form->field($model, 'id_related_profile')->widget(Select2::classname(), [
                                'data' => $related_to_profile,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]);
                        ?>  
                    </div>
                </div> 
                
                <div class="row">
                    <div class="col-md-4">
                        <?= $form->field($model, 'start_date')->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                    </div>
                    <div class="col-md-4">
                        <?= $form->field($model, 'due_date')->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                    </div>
                    <div class="col-md-4">
                        <?= $form->field($model, 'deadline')->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                    </div>
                    
                </div>  
                <div class="row">
                    <div class="col-md-12"> 
                        <?php 
                            if(!$model->isNewRecord){
                                $member_arr = \backend\models\StandardOperationMember::find()
                                    ->select('id_employee')
                                    ->where(['id_standard_operation'=>$model->id])
                                    ->asArray()
                                    ->all();
                                $row = [];
                                if(!empty($member_arr)){
                                    foreach($member_arr as $d){
                                        $row[]=$d['id_employee'];
                                    }
                                }
                            }else{
                                $row = [];
                            } 
                        ?>
                        <label>Assign To</label>
                        <?= Select2::widget([
                                'name' => 'assign_to[]',
                                'data' => $employee_list,
                                'value'=> $row,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => ['placeholder' => ' Assign To', 'multiple' => true, 'id'=>'id_assign_to'],
                                'pluginOptions' => [
                                    'allowClear' => false
                                ],
                            ]);
                        ?>
                        <div class="line15"></div>
                    </div>
                </div>
                
                
                <!-- 
                <div class="row">
                    <div class="col-md-12">
                    <label>Related Member</label></br>
                        <?php
                            $assignee_img = Yii::$app->db->createCommand('
                            select 
                                sop_member.id_employee as id_employee,
                                CONCAT(`user`.first_name," ",`user`.last_name) as user_name,
                                uploaded_file.filename as user_img_url
                            from standard_operation_member as sop_member
                                left join `user` on `user`.id = sop_member.id_employee
                                left join uploaded_file on uploaded_file.id = `user`.img_url
                            where sop_member.id_standard_operation = "'.$model->id.'"
                            ')->queryAll(); 
                            foreach($assignee_img as $user_img){ 
                        ?>
                            <img class="img-xs img-circle img_circle_hover add-tooltip" data-container="body" title="<?=$user_img["user_name"];?>" data-toggle="tooltip" data-placement="bottom" src="<?= $base_url.'/'.$user_img["user_img_url"];?>" onError="this.onerror=null;this.src='<?=$base_url?>/backend/uploads/NoPicAvailable.jpg';" style="padding: 2px;">
                        <?php
                            }
                        ?> 
                    </div>  
                </div>
                <br>-->
                <div class="row">
                    <div class="col-md-12" style="padding: 0px 0px 15px 10px;"> 
                        <span class="label label-info text-md">Created <?= time_elapsed_string($model->created_date);?></span>
                        <span class="text-md">Created by : <a href="#" class="btn-link"><?=$model->createdBy->first_name." ".$model->createdBy->last_name;?></a></span>
                    </div> 
                </div>
            </div>  
        </div> 
    </div> <!-- end col-md-4 -->

    <div class="col-md-8">
        <div class="row">
            <div class="col-md-12">
                <div id="demo-accordion" class="panel-group accordion">
                    <?php
                        $sop_step_list = Yii::$app->db->createCommand('
                        select standard_operation_step_list.* ,
                        standard_operation_step.name as step_name
                        from standard_operation_step_list 
                        left join standard_operation_step on standard_operation_step.id = standard_operation_step_list.id_standard_operation_step
                        where id_standard_operation_step = "'.$model->id_standard_operation_step.'"
                        ')->queryAll();
                        foreach($sop_step_list as $key => $value){ 

                            $checkList = StandardOperationCheckList::find()->where(['id_standard_operation_step_list' => $value['id'],'id_standard_operation_step'=>$model->id_standard_operation_step,'id_standard_operation'=>$model->id])->one();

                    ?> 
                        <div class="panel"> 
                            <div class="panel-heading panel-bordered panel-mint">
                                <h4 class="panel-title">
                                    <div class="row">
                                        <div class="col-md-8 col-xs-8">
                                            <a data-parent="#demo-accordion" data-toggle="collapse" href="#demo-acc-panel-<?=$key;?>" aria-expanded="true" class=""><b><?=$value['step_name']."</b> > ".$value['name'];?></a>
                                        </div>
                                        <div class="col-md-4 col-xs-4">
                                            <?php
                                            if($value['is_track'] == 1){
                                            ?> 
                                            <div class="pull-right" style="margin-right: 10px;">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" id="done_date_<?=$key?>" class="done_date form-control" name="done_date[]" placeholder="Done Date" value="<?= $checkList['done_date'] == "" ?"": $checkList['done_date'] ?>" data-id="<?=$key?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                            <input id="is_done-<?=$key?>" <?= $checkList['is_done'] == "1" ?"checked":'' ?> value="1" name="is_dones[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$key?>">
                                                            <label for="is_done-<?=$key?>" style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                            <input type="hidden" name="is_done[]" value="<?= $checkList['is_done'] == 1 ?1:0 ?>" data-id="<?=$key?>"  id="is_done_<?=$key?>">
                                                        </div>  
                                                    </div>
                                                </div> 
                                            </div>
                                            <?php
                                            }else{
                                            ?>
                                            <div class="pull-right" style="margin-right: 10px; display:none;">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" id="done_date_<?=$key?>" class="done_date form-control" name="done_date[]" placeholder="Done Date" value="<?= $checkList['done_date'] == "" ?"": $checkList['done_date'] ?>" data-id="<?=$key?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                            <input id="is_done-<?=$key?>" <?= $checkList['is_done'] == "1" ?"checked":'' ?> value="1" name="is_dones[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$key?>">
                                                            <label for="is_done-<?=$key?>" style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                            <input type="hidden" name="is_done[]" value="<?= $checkList['is_done'] == 1 ?1:0 ?>" data-id="<?=$key?>"  id="is_done_<?=$key?>">
                                                        </div>  
                                                    </div>
                                                </div> 
                                            </div>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </h4> 
                            </div> 

                            <div id="demo-acc-panel-<?=$key;?>" class="panel-collapse collapse" aria-expanded="true" style="">
                                <div class="panel-body panel-bordered panel-mint">
					                <div class="row">
                                        <div class="col-md-12">
                                            <label>Note</label> 
                                            <textarea name="description[]" rows="6" class="form-control" data-id="<?=$key?>"><?= $checkList['description'];?></textarea>
                                            <input name="sop_step_list[]" type="hidden" data-id="<?=$key?>" value="<?=$value['id']?>">
                                        </div>
                                    </div>
					            </div>
                            </div>
                        </div>
                    
                    <?php
                        }
                    ?>
                </div>
            </div> 

            <!-- start other old sop step -->
            <div class="col-md-12">  
                <div class="text-info text-bold bord-btm">S.O.P Step History</div>
                <br>
                <div id="demo-accordion-old" class="panel-group accordion">
                    <?php
                        $sop_step_list_old = Yii::$app->db->createCommand('
                        SELECT
                            standard_operation.`name` as sop_name,
                            standard_operation_step.`name` as sop_step_name,
                            standard_operation_step_list.`name` as sop_step_list_name,
                            standard_operation_step_list.is_track as is_track,
                            standard_operation_check_list.*
                        FROM standard_operation_check_list 
                            LEFT JOIN standard_operation on standard_operation.id = standard_operation_check_list.id_standard_operation
                            LEFT JOIN standard_operation_step on standard_operation_step.id = standard_operation_check_list.id_standard_operation_step
                            LEFT JOIN standard_operation_step_list on standard_operation_step_list.id = standard_operation_check_list.id_standard_operation_step_list
                        WHERE standard_operation_check_list.id_standard_operation = "'.$model->id.'"
                        AND standard_operation_check_list.id_standard_operation_step != "'.$model->id_standard_operation_step.'"
                        ')->queryAll();
                        foreach($sop_step_list_old as $keyOld => $valueOld){ 

                            // $checkList = StandardOperationCheckList::find()->where(['id_standard_operation_step_list' => $valueOld['id'],'id_standard_operation_step'=>$model->id_standard_operation_step,'id_standard_operation'=>$model->id])->one();
                    ?> 
                        <div class="panel"> 
                            <div class="panel-heading panel-bordered panel-info"> 

                                <h4 class="panel-title">
                                    <div class="row">
                                        <div class="col-md-8 col-xs-8">
                                        <a data-parent="#demo-accordion-old" data-toggle="collapse" href="#demo-acc-panel-old-<?=$keyOld;?>" aria-expanded="true" class=""><b><?=$valueOld['sop_step_name']."</b> > ".$valueOld['sop_step_list_name'];?></a>
                                        </div>
                                        <div class="col-md-4 col-xs-4">
                                            <?php
                                            if($valueOld['is_track'] == 1){
                                            ?>  

                                            <div class="pull-right" style="margin-right: 10px;">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" id="done_date_<?=$keyOld?>" class="form-control" name="done_date[]" placeholder="Done Date" value="<?= $valueOld['done_date'] == "" ?"": $valueOld['done_date'] ?>" data-id="<?=$keyOld?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                            <input disabled id="is_done_old-<?=$keyOld?>" <?= $valueOld['is_done'] == "1" ?"checked":'' ?> value="1" name="is_done_olds[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$keyOld?>">
                                                            <label for="is_done_old-<?=$keyOld?>"  style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                            <input disabled type="hidden" name="is_done_old[]" value="<?= $valueOld['is_done'] == 1 ?1:0 ?>" data-id="<?=$keyOld?>"  id="is_done_old_<?=$keyOld?>">
                                                        </div>  
                                                    </div>
                                                </div>
                                            </div>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </h4> 
                            </div> 

                            <div id="demo-acc-panel-old-<?=$keyOld;?>" class="panel-collapse collapse" aria-expanded="true" style="">
                                <div class="panel-body panel-bordered panel-info">
					                <div class="row">
                                        <div class="col-md-12">
                                            <label>Note</label> 
                                            <textarea name="description_old[]" rows="6" class="form-control" data-id="<?=$keyOld?>" readonly style="background-color: #fff;"><?= $valueOld['description'];?></textarea>
                                            <input name="sop_step_list_old[]" type="hidden" data-id="<?=$keyOld?>" value="<?=$valueOld['id']?>">
                                        </div>
                                    </div>
					            </div>
                            </div>
                        </div>
                    
                    <?php
                        }
                    ?>
                </div>
            </div> 
            <!-- end other old sop step -->
        </div> 
 
    </div><!-- end col-md-8 -->
</div> 

<div class="row">
    <div class="col-md-12">
        <?= $form->field($model, 'description')->textArea(['rows' => 5]) ?>
    </div>
</div>


    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 
 
$script = <<<JS
     
    var base_url = "$base_url";

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });
 
    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $('.done_date,#standardoperation-due_date, #standardoperation-start_date, #standardoperation-deadline').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayHighlight: true
    }); 

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $("#standardoperation-id_related_to").change(function(){
        var text = $(this).select2('data')[0]['text'];
        $(".field-standardoperation-id_related_profile label").text(text);
        var id = $(this).val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_profile'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.profile_name+'</option>';
                });
                $('#standardoperation-id_related_profile').html(str);
            }
        });

    });

    $("#standardoperation-id_related_profile").change(function(){
        var id = $(this).val();
        var id_related = $("#standardoperation-id_related_to").val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                id_related: id_related,
                action: 'get_profile_detail'
            },
            success: function(response){
                var data = JSON.parse(response);

                $('#standardoperation-start_date').datepicker('setStartDate', data['start_date']);
                $('#standardoperation-due_date').datepicker('setStartDate', data['start_date']);
            }
        });

    }); 

    $(document).on('change', '.checkbox_tracking', function() {
        var id = $(this).data('id');
        if ($(this).is(':checked')) {
            $("#is_done_"+id).val(1);
        }else{
            $("#is_done_"+id).val(0);
        }
    });


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
