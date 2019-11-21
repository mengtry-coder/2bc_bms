<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');
?>

<div class="standard-operation-step-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-11">
                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-1" style="padding-top: 23px;padding-left: 5px;">
                    <span class="btn btn-warning btn-rounded btn-circle add_row">
                        <i class="fa fa-plus"></i>
                    </span>
                </div>
            </div> 
            <div class="demo_new_row">
                <?php
                if(!$model->isNewRecord){
                    $sop_step_list = Yii::$app->db->createCommand('
                        select * from standard_operation_step_list where id_standard_operation_step = "'.$model->id.'" order by id
                    ')->queryAll();
                    $index = 0;
                    foreach($sop_step_list as $value){
                    $index++;
                    ?>
                    <div class="count_class demo_new_row_wrap_<?=$index;?>">
                        <div class="row row_stylePanel">  
                            <div class="col-md-2" style="margin-top: 28px;">
                                <div class="form-group standardoperationstep-is_track">
                                    <input id="is_track-<?=$index;?>" value="1" <?= $value['is_track'] == "1" ?"checked":'' ?> name="is_track[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$index;?>">
                                    <label for="is_track-<?=$index;?>">Is track</label>
                                </div> 
                                <input type="hidden" name="is_tracking[]" value="<?= $value['is_track'] == 1 ?1:0 ?>" data-id="<?= $index ?>" id="is_tracking_<?= $index ?>">
                            </div>
                            <div class="col-md-2">
                                <div class="form-group standardoperationstep-sort">
                                    <label class="control-label" for="standardoperationstep-sort">Sort</label>
                                    <input type="number" id="standardoperationstep-sort" class="form-control" value="<?= $value['sort'];?>" data-id="<?=$index;?>" name="sort[]">
                                </div> 
                            </div>
                            <div class="col-md-7">
                                <div class="form-group standardoperationstep-step_list">
                                    <label class="control-label" for="standardoperationstep-step_list">Step list name</label>
                                    <input type="text" id="standardoperationstep-step_list" value="<?= $value['name'];?>" class="form-control" data-id="<?=$index;?>" name="step_list[]">
                                </div> 
                            </div>
                            <div class="col-md-1" style="padding-top: 23px;padding-left: 5px;">  
                                <div class="btn btn-danger btn-rounded btn-circle" id="btn_remove" data-id="<?=$index;?>">
                                    <i class="fa fa-minus"></i>
                                </div>
                            </div> 
                        </div>  
                    </div>
                    <?php
                    }
                }
                ?>
            </div>
        </div>

        <div class="col-md-12">
            <?= $form->field($model, 'id_employee_position')->widget(Select2::classname(), [
                    'data' => $position,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?> 
        </div>
        <div class="col-md-4">
            <div class="input-group mar-btm"> 
                <?= $form->field($model, 'css')->textInput(['maxlength' => true])->label('CSS'); ?>
                <span class="input-group-btn">
                    <input type="color" name="colorInput" value="<?= $model->isNewRecord == true ? "#04274A" : $model->css ;?>" id="colorInput" style="margin: 14px 50px -10px -1px;padding: 0px;" class="form-control">
                </span>
            </div>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'sort')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div> 
        
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div> 
<?php 

$script = <<<JS

$("#colorInput").change(function(){
    $('#standardoperationstep-css').val($(this).val());
});

$(document).on('change', '.checkbox_tracking', function() {
    var id = $(this).data('id');
    if ($(this).is(':checked')) {
        $("#is_tracking_"+id).val(1);
    }else{
        $("#is_tracking_"+id).val(0);
    }
});

JS;

  $this->registerJs($script);
?>
<script>
// Start Append Row
var howMany = 100;
$('.add_row').click(function() {
    howMany += 1;   
    $('.demo_new_row').append(`
        <div class="count_class demo_new_row_wrap_${howMany}">
            <div class="row row_stylePanel">  
                <div class="col-md-2" style="margin-top: 28px;">
                    <div class="form-group standardoperationstep-is_track">
                        <input id="is_track-${howMany}" value="1" name="is_track[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="${howMany}">
                        <label for="is_track-${howMany}" class="checkbox_tracking" data-id="${howMany}">Is track</label>
                    </div> 
                    <input type="hidden" name="is_tracking[]" value="0" data-id="${howMany}" id="is_tracking_${howMany}">
                </div>
                <div class="col-md-2">
                    <div class="form-group standardoperationstep-sort">
                        <label class="control-label" for="standardoperationstep-sort">Sort</label>
                        <input type="number" id="standardoperationstep-sort" class="form-control" data-id="${howMany}" name="sort[]">
                    </div> 
                </div>
                <div class="col-md-7">
                    <div class="form-group standardoperationstep-step_list">
                        <label class="control-label" for="standardoperationstep-step_list">Step list name</label>
                        <input type="text" id="standardoperationstep-step_list" class="form-control" data-id="${howMany}" name="step_list[]" required>
                    </div> 
                </div>
                <div class="col-md-1" style="padding-top: 23px;padding-left: 5px;">  
                    <div class="btn btn-danger btn-rounded btn-circle" id="btn_remove" data-id="${howMany}">
                        <i class="fa fa-minus"></i>
                    </div>
                </div> 
            </div>  
        </div>
        `);
    });


    $(document).on('click', '#btn_remove', function(){
        var row_id = $(this).data('id');
        $('.demo_new_row_wrap_'+row_id+'').remove();  
    }); 


// End Append Row
</script>