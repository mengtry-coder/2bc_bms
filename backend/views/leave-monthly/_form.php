<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$month_list = Yii::$app->db->createCommand("
        SELECT *
        FROM month_list
        -- WHERE id not in (SELECT id_month FROM payroll_request WHERE id_year = $model->id_year)
")->queryAll();

$month_list = ArrayHelper::map($month_list, 'id', 'name'); 

$year_list = ArrayHelper::map(\backend\models\YearList::find()
    ->all(), 'id', 'name');
$leave_type = \backend\models\LeaveTypeName::find()->where(['status'=>1])->all();

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 


$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';
?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
    .row_line .date {
        background: transparent !important;
    }
</style>
<div class="payroll-request-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-4">
            <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                    'data' => $employee_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-4">
                    <?= $form->field($model, 'id_year', ['template'=>$date_template])->widget(Select2::classname(), [
                            'data' => $year_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>  
                </div>
                <div class="col-md-4">
                    <?= $form->field($model, 'id_month', ['template'=>$date_template])->widget(Select2::classname(), [
                            'data' => $model->isNewRecord?[]:$month_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>  
                </div>
                <div class="col-md-4">
                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>   
                </div>
            </div>
        </div>
        
    </div>

    <div class="panel panel-bordered panel-primary">
        <div class="panel-heading">
            <div class="row">

                <div class="col-md-5">
                    <h3 class="panel-title">Leave Type</h3>
                </div>

                <div class="col-md-3">
                    <h3 class="panel-title">Amount</h3>
                </div>
                <div class="col-md-3">
                    <h3 class="panel-title">Date</h3>
                </div>

                <div class="col-md-1" style="padding-top: 9px;">
                    <i class="demo-psi-gear" style="font-size: 15px"></i>
                </div>

            </div>
        </div>
        <div class="panel-body each_item">
            <?php 
                if($model->isNewRecord){
            ?>
            <div class="row row_line" id="row_line_1" data-id="1">
                <div class="col-md-5">
                    <select class="form-control leave_type" name="leave_type[]" data-id=1 id="leave_type_1">
                    <?php 
                        foreach ($leave_type as $key => $value) {
                            echo "<option value=".$value->id.">". $value->names."</option>";
                        }
                    ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="number" name="amount[]" value="<?= number_format(0,2) ?>" step=0.01 min="0" class="form-control amount" data-id=1 id="amount_1" />
                </div>
                <div class="col-md-3">
                    <input type="text" name="date[]" readonly class="form-control date" data-id=1 id="date_1" />
                </div>
                <div class="col-md-1 text-center">
                    <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <?php 
                }else{
                    $i = 0;
                    foreach ($model_data as $key => $value) {
                        $i++;
            ?>
            <div class="row row_line" data-id="<?= $i ?>" id="row_line_<?= $i ?>">
                <div class="col-md-5">
                    <select class="form-control leave_type" name="leave_type[]" data-id="<?= $i ?>" id="leave_type_<?= $i ?>">
                    <?php 
                        foreach ($leave_type as $key => $val) {
                            if($value['id_leave_type'] == $val->id){
                                $selected = 'selected';
                            }else{
                                $selected = '';
                            }

                            echo "<option ".$selected." value=".$val->id.">". $val->names ."</option>";
                        }
                    ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="number" step="0.01" name="amount[]" value="<?= $value->amount ?>" class="form-control amount" data-id="<?= $i ?>" id="amount_<?= $i ?>" />
                </div>
                <div class="col-md-3">
                    <input type="text" readonly name="date[]" value="<?= $value->date ?>" class="form-control date" data-id="<?= $i ?>" id="date_<?= $i ?>" />
                </div>
                <div class="col-md-1 text-center">
                    <?php if($i == 1){ ?>
                    <button type="button" class="btn btn-primary btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                    <?php }else{ ?>
                    <button type='button' class='btn btn-danger btn-icon btn-circle btn_remove' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                    <?php } ?>
                </div>
            </div>
            <?php
                    }
                }
            ?>
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$leave_type = \backend\models\LeaveTypeName::find()->where(['status'=>1])->asArray()->all();
$leave_type = json_encode($leave_type);

$script = <<<JS

    var dataToString = JSON.stringify($leave_type);
    var stringReplaced = dataToString.replace(/'/g, "&#39;");
    var leave_type_data = JSON.parse(stringReplaced);

    var string_leave_type_data = "";
    $.each(leave_type_data,function(key,value){
        string_leave_type_data = string_leave_type_data + "<option value="+value.id+">"+value.names+"</option>";
    });

    var base_url = "$base_url";

    $("#leavemonthly-id_employee").change(function(){
        $("#leavemonthly-id_year").val('').trigger('change');
    });

    $('.date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
    });
    

    $("#leavemonthly-id_year").change(function(){
        var id = $(this).val();
        var id_employee = $("#leavemonthly-id_employee").val();

        $.ajax({
            url: base_url+'/leave-monthly/dependent',
            type: 'post',
            data: {
                id: id,
                id_employee: id_employee,
                action: 'get_month'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option></option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#leavemonthly-id_month').html(str);
            }
        });

    });


    var data_i = $(document).find('.amount[data-id]:last').attr('data-id'); 
    var i = parseInt(data_i);

    $('#add_more').unbind('click');
    $('#add_more').bind('click', function (e){
        e.preventDefault(); 

        var amount = $('.amount[data-id='+i+']').val();
    
        var leave_type_length = $($($(".each_item").find('.leave_type')[$(".each_item").find('.leave_type').length - 1])[0]).find("option:not([hidden])").length;
        
        if(parseInt(leave_type_length) == 1){
            swal("Information", "No more leave_type list available!", "warning");
            return false;
        }
        
        if(amount =='' || amount <= 0.01){
            swal("Information", "Amount can not zero!", "warning");
            return false;
        }
        i++;

        var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                        "<div class='col-md-5'>" +
                            "<select name='leave_type[]' class='form-control leave_type' id='leave_type_"+i+"' data-id="+i+">" +
                                string_leave_type_data +
                            "</select>" +   
                        "</div>" +
                        "<div class='col-md-3'>" +
                            "<input type='number' value=0 step=0.01 class='form-control amount' name='amount[]' id='amount_"+i+"' data-id="+i+">" +
                        "</div>" +
                        "<div class='col-md-3'>" +
                            "<input type='text' readonly class='form-control date' name='date[]' id='date_"+i+"' data-id="+i+">" +
                        "</div>" +
                        "<div class='col-md-1 text-center'>" +
                            "<button type='button' class='btn btn-danger btn-icon btn-circle btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                "<i class='fa fa-minus'></i>" +
                            "</button>" +
                        "</div>" +

                    "</div>";

        $('.each_item').append(string);

        $('.date').datepicker({
            format: 'yyyy-mm-dd',
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            todayBtn: "linked",
        });

        DynamicDropdown();

    });
  
    DynamicDropdown();

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id');

        var sum = 0;

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_'+ id).remove();

        DynamicDropdown();

    });

    function DynamicDropdown(){
        $('.leave_type').change(function() {
            var used = new Set;
            $('.leave_type').each(function () {
                var reset = false;
                $('option', this).each(function () {
                var hide = used.has($(this).text());
                if (hide && $(this).is(':selected')) reset = true;
                    $(this).prop('hidden', hide);
                });
                if (reset) $('option:not([hidden]):first', this).prop('selected', true);  
                used.add($('option:selected', this).text());
            });
        }).trigger('change'); // run at load
    }

JS;

$this->registerJs($script);

?>