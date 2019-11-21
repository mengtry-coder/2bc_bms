<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetUp */
/* @var $form yii\widgets\ActiveForm */
$base_url = Yii::getAlias('@web');
$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');
$this->registerJsFile(
    '@web/plugins/summernote/summernote.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$month_list = \backend\models\MonthList::find()->all();

$department = ArrayHelper::map(\backend\models\Department::find()
    ->all(), 'id', 'name');
$employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->where(['id_department' => 1])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
?>
<style media="screen">
  .field-budgetsetup-id_department, .field-budgetsetup-id_position{display: none;}

    .action_button {
        width: 30px !important;
        height: 30px !important;
        padding: 0px !important;
        border-radius: 50%;
    }
    .row_line {
        padding-bottom: 15px;
    }
    .col-xs-5r,
    .col-sm-5r,
    .col-md-5r,
    .col-lg-5r {
        position: relative;
        min-height: 1px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .col-xs-5r {
        width: 20%;
        float: left;
    }

    @media (min-width: 768px) {
        .col-sm-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 992px) {
        .col-md-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 1200px) {
        .col-lg-5r {
            width: 20%;
            float: left;
        }
    }
    .quarterly {
        font-size: 16px;
        font-weight: bold;
    }
    .yearly {
        font-size: 16px;
        font-weight: bold;
        /*background: transparent !important;
        border: none !important;
        color: #fff;*/
    }
</style>
<div class="budget-set-up-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-md-12">
                  <div class="col-md-6">
                    <?=
                        $form->field($model, 'id_employee')->widget(Select2::classname(), [
                            'data' => $employee,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            // 'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true,

                            ],
                        ]);
                    ?>
                    <div class="row">
                      <div class="col-md-6">
                        <?php
                            $firstYear = (int)date('Y');
                            $lastYear = $firstYear + 20;
                            $year = ["2019"=>2019,
                                      "2020"=>2020,
                                      "2021"=>2021,
                                      "2022"=>2022,
                                      "2023"=>2023,
                                      "2024"=>2024,
                                      "2025"=>2025,
                                      "2026"=>2026,
                                      "2027"=>2027,
                                      "2028"=>2028,
                                      "2029"=>2029,
                                      "2030"=>2030
                                    ];
                            echo $form->field($model, 'year')->widget(Select2::classname(), [
                                'data' => $model->isNewRecord?[]:$year,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                // 'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => true,

                                ],
                            ]);
                        ?>
                      </div>
                      <div class="col-md-6">

                        <?= $form->field($model, 'unit_type')->widget(Select2::classname(), [
                              'data' => ["$"=>"USD","(Unit) "=>"Unit"],
                              'theme' => Select2::THEME_DEFAULT,
                              'language' => 'eg',
                              // 'options' => ['placeholder' => 'Select'],
                              'pluginOptions' => [
                                  'allowClear' => true,
                              ],
                          ]);
                         ?>
                      </div>

                        <div class="col-md-12">
                            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                            <?php if ($model->status != 1) { $model->status = 0;} ?>
                            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                        </div>
                    </div>


                    <?php
                      $class = "form-control";
                      if ($model->isNewRecord) {
                        $class = "form-control budgetsetup-budget_value_new";
                      }
                    // echo $form->field($model, 'budget_value')->textInput(['type' => 'number','min'=>1,'class'=>$class])?>
                    <?= $form->field($model, 'id_department')->hiddenInput(['label'=>false]);?>
                    <?= $form->field($model, 'id_position')->hiddenInput();?>

                  </div>
                  <div class="col-md-6">
                    <?= $form->field($model, 'actual')->textInput(['type' => 'number','min'=>1,'readonly'=>true]);?>
                    <?= $form->field($model, 'under_or_over')->textInput(['type' => 'number','min'=>1,'readonly'=>true]);?>
                  </div>
                </div>
                <div class="col-md-12">
                  <?= $form->field($model, 'note')->textArea(['rows'=>5])?>
                </div>
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
                                <input type="number" name="daily[]" value="0" min="0" step="0.01" class="form-control daily" data-id="<?= $value->id ?>" id="daily_<?= $value->id ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</i></span>
                                <input type="number" name="weekly[]" value="0" min="0" step="0.01" class="form-control weekly" data-id="<?= $value->id ?>" id="weekly_<?= $value->id ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</i></span>
                                <input type="number" name="monthly[]" value="0" min="0" step="0.01" class="form-control monthly" data-id="<?= $value->id ?>" id="monthly_<?= $value->id ?>" />
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
                                    <input type="number" name="quarterly_<?= $value->id ?>" readonly value="0" min="0" step="0.01" class="form-control quarterly" data-id="quarterly_<?= $value->id ?>" id="quarterly_<?= $value->id ?>" />
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
                                <input type="number" name="daily[]" value="<?= $value->daily ?>" min="0" step="0.01" class="form-control daily" data-id="<?= $value->id_month ?>" id="daily_<?= $value->id_month ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</i></span>
                                <input type="number" name="weekly[]" value="<?= $value->weekly ?>" min="0" step="0.01" class="form-control weekly" data-id="<?= $value->id_month ?>" id="weekly_<?= $value->id_month ?>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</i></span>
                                <input type="number" name="monthly[]" value="<?= $value->monthly ?>" min="0" step="0.01" class="form-control monthly" data-id="<?= $value->id_month ?>" id="monthly_<?= $value->id_month ?>" />
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
                                    <input type="number" name="quarterly_<?= $value->id_month ?>" readonly min="0" step="0.01" class="form-control quarterly" data-id="quarterly_<?= $value->id_month ?>" id="quarterly_<?= $value->id_month ?>" />
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
                                <input type="number" name="yearly" id="yearly" value="0.00" readonly min="0" step="0.01" class="form-control yearly" />
                            </div>
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
$('#modal').on('shown.bs.modal', function() {
          var d_height = $("#detail-height").outerHeight();
          $("#logo-height").css("height",d_height);
      });


    // ========department=====

    $(".budgetsetup-budget_value_new").change(function(){
        $("#budgetsetup-actual").val(0);
        var value = $(this).val();
        $("#budgetsetup-under_or_over").val('-'+value);
    });

    $("#budgetsetup-id_employee").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/budget-set-up/dependent',
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
                $('#budgetsetup-year').html(str);
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
        monthly_1 = parseFloat(monthly_1);

        var monthly_2 = $("#monthly_2").val();
        monthly_2 = parseFloat(monthly_2);

        var monthly_3 = $("#monthly_3").val();
        monthly_3 = parseFloat(monthly_3);

        var quarterly_1 = monthly_1 + monthly_2 + monthly_3;
        $("#quarterly_3").val(parseFloat(quarterly_1).toFixed(2));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_4 = $("#monthly_4").val();
        monthly_4 = parseFloat(monthly_4);

        var monthly_5 = $("#monthly_5").val();
        monthly_5 = parseFloat(monthly_5);

        var monthly_6 = $("#monthly_6").val();
        monthly_6 = parseFloat(monthly_6);

        var quarterly_2 = monthly_4 + monthly_5 + monthly_6;
        $("#quarterly_6").val(parseFloat(quarterly_2).toFixed(2));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_7 = $("#monthly_7").val();
        monthly_7 = parseFloat(monthly_7);

        var monthly_8 = $("#monthly_8").val();
        monthly_8 = parseFloat(monthly_8);

        var monthly_9 = $("#monthly_9").val();
        monthly_9 = parseFloat(monthly_9);

        var quarterly_3 = monthly_7 + monthly_8 + monthly_9;
        $("#quarterly_9").val(parseFloat(quarterly_3).toFixed(2));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Quarter 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var monthly_10 = $("#monthly_10").val();
        monthly_10 = parseFloat(monthly_10);

        var monthly_11 = $("#monthly_11").val();
        monthly_11 = parseFloat(monthly_11);

        var monthly_12 = $("#monthly_12").val();
        monthly_12 = parseFloat(monthly_12);

        var quarterly_4 = monthly_10 + monthly_11 + monthly_12;
        $("#quarterly_12").val(parseFloat(quarterly_4).toFixed(2));

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Yearly~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var yearly = parseFloat(quarterly_1) + parseFloat(quarterly_2) + parseFloat(quarterly_3) + parseFloat(quarterly_4);
        $("#yearly").val(parseFloat(yearly).toFixed(2));

    }





JS;
$this->registerJs($script);
?>
