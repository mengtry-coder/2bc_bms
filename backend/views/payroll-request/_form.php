<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 

$month_list = Yii::$app->db->createCommand("
        SELECT *
        FROM month_list
        -- WHERE id not in (SELECT id_month FROM payroll_request WHERE id_year = $model->id_year)
")->queryAll();

$month_list = ArrayHelper::map($month_list, 'id', 'name'); 

$year_list = ArrayHelper::map(\backend\models\YearList::find()
    ->all(), 'id', 'name');

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';
?>

<div class="payroll-request-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            
            <?= $form->field($model, 'date',['template'=>$date_template])->textInput(['value'=>date('Y-m-d')]) ?>
            
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

            <?= $form->field($model, 'id_prepared_by')->widget(Select2::classname(), [
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
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS

    var base_url = "$base_url";

    $('#payrollrequest-date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
    });

    $("#payrollrequest-id_year").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/payroll-request/dependent',
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
                $('#payrollrequest-id_month').html(str);
            }
        });

    });

JS;

$this->registerJs($script);

?>