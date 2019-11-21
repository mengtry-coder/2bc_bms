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

$month_list = ArrayHelper::map(\backend\models\MonthList::find()->all(), 'id', 'name');

$department = ArrayHelper::map(\backend\models\Department::find()
    ->all(), 'id', 'name');
    $employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
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
                                'data' => $year,
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
                    </div>


                    <?php
                      $class = "form-control";
                      if ($model->isNewRecord) {
                        $class = "form-control budgetsetup-budget_value_new";
                      }
                    echo $form->field($model, 'budget_value')->textInput(['type' => 'number','min'=>1,'class'=>$class])?>
                    <?= $form->field($model, 'id_department')->hiddenInput(['label'=>false]);?>
                    <?= $form->field($model, 'id_position')->hiddenInput();?>

                  </div>
                  <div class="col-md-6">
                    <?= $form->field($model, 'actual')->textInput(['type' => 'number','min'=>1,'readonly'=>true]);?>
                    <?= $form->field($model, 'under_or_over')->textInput(['type' => 'number','min'=>1,'readonly'=>true]);?>
                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
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
                    <div class="row">
                        <div class="col-md-10">
                            <h3 class="panel-title">Budget Plan Detail</h3>
                            <hr/>
                        </div>
                        <div class="col-md-2 text-right">
                            <h3 class="panel-title"><i class="demo-psi-gear"></i></h3>
                        </div>
                    </div>
                </div>
                <div class="panel-body calculate_item">
                    <?php
                        if($model->isNewRecord){
                    ?>
                    <div class="row row_line" data-id=1 id="row_line_1">
                        <div class="col-md-2">
                            <?= Html::dropDownList('month_list[]','', $month_list,[
                                'class' => 'form-control month_list',
                                'id' => 'month_list_1',
                                'data-id' =>1
                            ])?>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Daily</span>
                                <input type="text" name="daily[]" value="0" min="1" step="0.01" class="form-control daily" data-id=1 id="daily_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</i></span>
                                <input type="text" name="weekly[]" value="0" min="1" step="0.01" class="form-control weekly" data-id=1 id="weekly_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</i></span>
                                <input type="text" name="monthly[]" value="0" min="1" step="0.01" class="form-control monthly" data-id=1 id="monthly_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Quarterly</i></span>
                                <input type="text" name="quarterly[]" value="0" min="1" step="0.01" class="form-control quarterly" data-id=1 id="quarterly_1" />
                            </div>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <?php
                        }else{
                            if(empty($model_item)){
                    ?>
                    <div class="row row_line" data-id=1 id="row_line_1">
                        <div class="col-md-2">
                            <?= Html::dropDownList('month_list[]','', $month_list,[
                                'class' => 'form-control month_list',
                                'id' => 'month_list_1',
                                'data-id' =>1
                            ])?>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Daily</span>
                                <input type="text" name="daily[]" value="0" min="1" step="0.01" class="form-control daily" data-id=1 id="daily_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</span>
                                <input type="text" name="weekly[]" value="0" min="1" step="0.01" class="form-control weekly" data-id=1 id="weekly_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</span>
                                <input type="text" name="monthly[]" value="0" min="1" step="0.01" class="form-control monthly" data-id=1 id="monthly_1" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Quarterly</span>
                                <input type="text" name="quarterly[]" value="0" min="1" step="0.01" class="form-control quarterly" data-id=1 id="quarterly_1" />
                            </div>
                        </div>
                        <div class="col-md-1 text-center">
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <?php
                        }
                            $i = 1;
                            foreach ($model_item as $key => $value) {
                                $i++;
                    ?>
                    <div class="row row_line" data-id="<?= $i; ?>" id="row_line_<?= $i; ?>">
                        <div class="col-md-2">
                            <?= Html::dropDownList('month_list[]', $value->id_month, $month_list,[
                                'class' => 'form-control month_list',
                                'id' => 'month_list_'.$i,
                                'data-id' => $i
                            ])?>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Daily</span>
                                <input type="text" name="daily[]" value="<?= $value->daily; ?>" min="1" step="0.01" class="form-control daily" data-id="<?= $i; ?>" id="daily_<?= $i; ?>" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Weekly</span>
                                <input type="text" name="weekly[]" value="<?= $value->weekly; ?>" min="1" step="0.01" class="form-control weekly" data-id="<?= $i; ?>" id="weekly_<?= $i; ?>" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Monthly</span>
                                <input type="text" name="monthly[]" value="<?= $value->monthly; ?>" min="1" step="0.01" class="form-control monthly" data-id="<?= $i; ?>" id="monthly_<?= $i; ?>" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">Quarterly</span>
                                <input type="text" name="quarterly[]" value="<?= $value->quarterly; ?>" min="1" step="0.01" class="form-control quarterly" data-id="<?= $i; ?>" id="quarterly_<?= $i; ?>" />
                            </div>
                        </div>

                        <div class="col-md-2 text-center">
                            <?php if($i == 2){ ?>
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                            <?php }else{ ?>
                            <button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                            <?php } ?>
                        </div>
                    </div>
                    <?php }} ?>
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

$month_list_json = json_encode(\backend\models\MonthList::find()->asArray()->all());
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
      // var text = $(this).select2('data')[0]['text'];
      // $(".field-task-id_related_profile label").text(text);
      var id = $(this).val();
      $.ajax({
          url: base_url+'/budget-set-up/get-department',
          type: 'post',
          data: {
              id: id,
              action: 'get_department'
          },
          // console.log(id);

          success: function(response){
              console.log(data);
              var data = JSON.parse(response);
              if(data['department'] != ''){
              console.log(data);
              var str = "";
              $.each(data,function(key,value){
                var department_id = value.id_department;
                $("#budgetsetup-id_department").val(department_id);
                var position_id = value.id_position;
                $("#budgetsetup-id_position").val(position_id);
              });
              $('#budgetsetup-id_position').html(str);
            }
          }
      });

  });


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    var dataToString = JSON.stringify($month_list_json);
    var stringReplaced = dataToString.replace(/'/g, "&#39;");
    var month_data = JSON.parse(stringReplaced);

    var string_month_data = "";
    $.each(month_data,function(key,value){
        string_month_data = string_month_data + "<option value="+value.id+">"+value.name+"</option>";
    });


        var data_i = $(document).find('.month_list[data-id]:last').attr('data-id');
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            // var item = $('.description[data-id='+i+']').val();
            // if(item ==''){
            //     alert("Description can not null!");
            //     return false;
            // }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-2'>" +
                                "<select name='month_list[]' class='form-control month_list' id='month_list_"+i+"' data-id="+i+">" +
                                    string_month_data +
                                "</select>" +
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>" +
                                    "<span class='input-group-addon'>Daily</span>" +
                                    "<input type='text' name='daily[]' value='0' min='1' step='0.01' class='form-control daily' data-id="+i+" id='daily_"+i+"' />" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>" +
                                    "<span class='input-group-addon'>Weekly</span>" +
                                    "<input type='text' name='weekly[]' value='0' min='1' step='0.01' class='form-control weekly' data-id="+i+" id='weekly_"+i+"' />" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>" +
                                    "<span class='input-group-addon'>Monthly</span>" +
                                    "<input type='text' name='monthly[]' value='0' min='1' step='0.01' class='form-control monthly' data-id="+i+" id='monthly_"+i+"' />" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>" +
                                    "<span class='input-group-addon'>Quarterly</span>" +
                                    "<input type='text' name='quarterly[]' value='0' min='1' step='0.01' class='form-control quarterly' data-id="+i+" id='quarterly_"+i+"' />" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-2 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>"
                        ;

            $('.calculate_item').append(string);


        });

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id');

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_'+ id).remove();

    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


JS;
$this->registerJs($script);
?>
