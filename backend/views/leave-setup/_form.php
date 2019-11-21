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

    <div class="panel panel-bordered panel-primary">
        <div class="panel-heading">
            <div class="row">

                <div class="col-md-6">
                    <h3 class="panel-title">Leave Type</h3>
                </div>

                <div class="col-md-6">
                    <h3 class="panel-title">Amount</h3>
                </div>

            </div>
        </div>
        <div class="panel-body each_item">
            <?php 
                $id_leave_setup = $model->id;
                $data = Yii::$app->db->createCommand("
                    SELECT b.id, b.`names`, IFNULL(a.amount, 0) as amount
                    FROM leave_setup_data as a
                    RIGHT JOIN leave_type_name as b on a.id_leave_type = b.id and a.id_leave_setup = :id_leave_setup
                ")->bindParam(':id_leave_setup', $id_leave_setup)->queryAll();
                $i=0;
                foreach ($data as $key => $value) {
                    $i++;
            ?>
                <div class="row row_line">
                    <div class="col-md-6">
                        <select class="form-control leave_type" name="leave_type[]" data-id="<?= $i ?>" id="leave_type_<?= $i ?>">
                        <?= "<option value=".$value['id'].">". $value['names'] ."</option>"; ?>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <input type="number" step="0.01" name="amount[]" value="<?= $value['amount'] ?>" class="form-control amount" data-id="<?= $i ?>" id="amount_<?= $i ?>" />
                    </div>
                </div>
            <?php
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

    $("#leavesetup-id_year").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/leave-setup/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_month'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option></option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#leavesetup-id_month').html(str);
            }
        });

    });

JS;

$this->registerJs($script);

?>