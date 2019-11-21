<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web');

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');

$year_list = ArrayHelper::map(\backend\models\YearList::find()
    ->all(), 'name', 'name');

$month_list = \backend\models\MonthList::find()->all();

$sop_step = \backend\models\StandardOperationStep::find()->where(['id_employee_possition' => $model->id_position, 'status' => 1])->asArray()->all();
$sop_step = ArrayHelper::map($sop_step, 'id', 'name');

$sop_step_list = \backend\models\StandardOperationStepList::find()->where(['id_standard_operation_step' => $model->id_sop_step, 'is_track' => 1])->asArray()->all();
$sop_step_list = ArrayHelper::map($sop_step_list, 'id', 'name');

$employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['id_position' => $model->id_position])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});

$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
</style>
<div class="sop-goal-setup-form">

    <?php

        $validationUrl = ['sop-goal-setup/validation'];
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
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'id_position')->widget(Select2::classname(), [
                            'data' => $position,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                            'data' => $model->isNewRecord ? [] : $employee,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <?= $form->field($model, 'id_year')->widget(Select2::classname(), [
                            'data' => $year_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-4">
                    <?= $form->field($model, 'id_sop_step')->widget(Select2::classname(), [
                            'data' => $model->isNewRecord ? [] : $sop_step,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-4">
                    <?= $form->field($model, 'id_sop_step_list')->widget(Select2::classname(), [
                            'data' => $model->isNewRecord ? [] : $sop_step_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <?= $form->field($model, 'note')->textArea(['rows'=>5])?>
        </div>
        
    </div>

    <div class="col-md-12 col-sm-12">
            <div class="panel panel-bordered panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Budget Plan Detail</h3>
                </div>
                <div class="panel-body calculate_item">
                    <?php
                        if($model->isNewRecord){
                            foreach ($month_list as $key => $value) {
                    ?>
                    <div class="row row_line" data-id="<?= $value->id ?>" id="row_line_<?= $value->id ?>">
                        <div class="col-sm-3">
                            <select name="month_list[]" class="form-control month_list" data-id="<?= $value->id ?>" id="month_list_<?= $value->id ?>">
                                <option value="<?= $value->id ?>"> <?= $value->name ?></option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Daily</span>
                                <input type="number" name="daily[]" value="0" min="0" class="form-control daily" data-id="<?= $value->id ?>" id="daily_<?= $value->id ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</i></span>
                                <input type="number" name="weekly[]" value="0" min="0" class="form-control weekly" data-id="<?= $value->id ?>" id="weekly_<?= $value->id ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</i></span>
                                <input type="number" name="monthly[]" value="0" min="0" class="form-control monthly" data-id="<?= $value->id ?>" id="monthly_<?= $value->id ?>" />
                            </div>
                        </div>
                    </div>
                    <?php
                        if( $value->id == 3 || $value->id == 6 || $value->id == 9 || $value->id == 12){
                    ?>
                        <div class="row row_line">
                            <div class="col-sm-3 col-sm-offset-9">
                                <div class="input-group">
                                    <span class="input-group-addon bg-primary">Quarterly</i></span>
                                    <input type="number" name="quarterly_<?= $value->id ?>" readonly value="0" min="0" class="form-control quarterly" data-id="quarterly_<?= $value->id ?>" id="quarterly_<?= $value->id ?>" />
                                </div>
                            </div>
                        </div>
                    <?php
                        }
                    ?>
                    <?php
                            }
                        }else{
                    ?>
                    <?php
                        $i = 1;
                        foreach ($model_item as $key => $value) {
                            $i++;
                    ?>
                    <div class="row row_line" data-id="<?= $value->id_month ?>" id="row_line_<?= $value->id_month ?>">
                        <div class="col-sm-3">
                            <select name="month_list[]" class="form-control month_list" data-id="<?= $value->id_month ?>" id="month_list_<?= $value->id_month ?>">
                                <option value="<?= $value->id_month ?>"> <?= $value->monthList->name ?></option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Daily</span>
                                <input type="number" name="daily[]" value="<?= $value->daily ?>" min="0" class="form-control daily" data-id="<?= $value->id_month ?>" id="daily_<?= $value->id_month ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</i></span>
                                <input type="number" name="weekly[]" value="<?= $value->weekly ?>" min="0" class="form-control weekly" data-id="<?= $value->id_month ?>" id="weekly_<?= $value->id_month ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</i></span>
                                <input type="number" name="monthly[]" value="<?= $value->monthly ?>" min="0" class="form-control monthly" data-id="<?= $value->id_month ?>" id="monthly_<?= $value->id_month ?>" />
                            </div>
                        </div>
                    </div>
                    <?php
                        if( $value->id_month == 3 || $value->id_month == 6 || $value->id_month == 9 || $value->id_month == 12){
                    ?>
                        <div class="row row_line">
                            <div class="col-sm-3 col-sm-offset-9">
                                <div class="input-group">
                                    <span class="input-group-addon bg-primary">Quarterly</i></span>
                                    <input type="number" name="quarterly_<?= $value->id_month ?>" readonly min="0" class="form-control quarterly" data-id="quarterly_<?= $value->id_month ?>" id="quarterly_<?= $value->id_month ?>" />
                                </div>
                            </div>
                        </div>
                    <?php
                        }
                    ?>
                    <?php }} ?>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-sm-3 col-sm-offset-9">
                            <div class="input-group">
                                <span class="input-group-addon bg-info">Yearly</i></span>
                                <input type="number" name="yearly" id="yearly" value="0.00" readonly min="0" class="form-control yearly" />
                            </div>
                        </div>
                    </div>
                </div>
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

    $("#sopgoalsetup-id_position").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/sop-goal-setup/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_employee'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option></option>";
                $.each(data['employee'], function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#sopgoalsetup-id_employee').html(str);

                var str = "<option></option>";
                $.each(data['sop_step'], function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#sopgoalsetup-id_sop_step').html(str);

                $("#sopgoalsetup-id_year").val("").trigger("change");
                $("#sopgoalsetup-id_sop_step_list").val("").trigger("change");
            }
        });

    });
    
    $("#sopgoalsetup-id_employee").change(function(){
        var id = $(this).val();
        
        $("#sopgoalsetup-id_year").val('').trigger('change');
        $("#sopgoalsetup-id_sop_step").val('').trigger('change');
        $("#sopgoalsetup-id_sop_step_list").val('').trigger('change');

        $.ajax({
            url: base_url+'/sop-goal-setup/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_year'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.name+'">'+value.name+'</option>';
                });
                $('#sopgoalsetup-id_year').html(str);
            }
        });

    });

    $("#sopgoalsetup-id_year").change(function(){
        $("#sopgoalsetup-id_sop_step").val('').trigger('change');
        $("#sopgoalsetup-id_sop_step_list").val('').trigger('change');
    });

    $("#sopgoalsetup-id_sop_step").change(function(){
        var id = $(this).val();
        var id_year = $('#sopgoalsetup-id_year').val();
        var id_employee = $('#sopgoalsetup-id_employee').val();

        $.ajax({
            url: base_url+'/sop-goal-setup/dependent',
            type: 'post',
            data: {
                id: id,
                id_year: id_year,
                id_employee: id_employee,
                action: 'get_sop_step_list'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#sopgoalsetup-id_sop_step_list').html(str);
            }
        });

    });

    calculate_quarter();

    $(".monthly").on("keyup change", function(){
        calculate_quarter();

    });
    function calculate_quarter(){
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_1 = $("#monthly_1").val();
        monthly_1 = parseInt(monthly_1);

        var monthly_2 = $("#monthly_2").val();
        monthly_2 = parseInt(monthly_2);

        var monthly_3 = $("#monthly_3").val();
        monthly_3 = parseInt(monthly_3);

        var quarterly_1 = monthly_1 + monthly_2 + monthly_3;
        $("#quarterly_3").val(parseInt(quarterly_1));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_4 = $("#monthly_4").val();
        monthly_4 = parseInt(monthly_4);

        var monthly_5 = $("#monthly_5").val();
        monthly_5 = parseInt(monthly_5);

        var monthly_6 = $("#monthly_6").val();
        monthly_6 = parseInt(monthly_6);

        var quarterly_2 = monthly_4 + monthly_5 + monthly_6;
        $("#quarterly_6").val(parseInt(quarterly_2));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_7 = $("#monthly_7").val();
        monthly_7 = parseInt(monthly_7);

        var monthly_8 = $("#monthly_8").val();
        monthly_8 = parseInt(monthly_8);

        var monthly_9 = $("#monthly_9").val();
        monthly_9 = parseInt(monthly_9);

        var quarterly_3 = monthly_7 + monthly_8 + monthly_9;
        $("#quarterly_9").val(parseInt(quarterly_3));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_10 = $("#monthly_10").val();
        monthly_10 = parseInt(monthly_10);

        var monthly_11 = $("#monthly_11").val();
        monthly_11 = parseInt(monthly_11);

        var monthly_12 = $("#monthly_12").val();
        monthly_12 = parseInt(monthly_12);

        var quarterly_4 = monthly_10 + monthly_11 + monthly_12;
        $("#quarterly_12").val(parseInt(quarterly_4));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Yearly~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var yearly = parseInt(quarterly_1) + parseInt(quarterly_2) + parseInt(quarterly_3) + parseInt(quarterly_4);
        $("#yearly").val(parseInt(yearly));

    }

JS;
$this->registerJs($script);
?>

