<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;

$base_url = Yii::getAlias('@web'); 

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 

$request = Yii::$app->request; 
$id_customer_profile = $request->get('id',0);

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$accommodation_status = ArrayHelper::map(\backend\models\CustomerSolutionStatus::find()
    ->orderBy(['order_by'=>SORT_ASC])
    ->all(), 'id', 'name'); 


$this->title = 'Customer Solution';
$this->params['breadcrumbs'][] = ['label' => 'Customer', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->company_name];
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .title-error-inPanel{
        font-weight: normal;
        padding: 0 0px 0 1px;
        font-size: 22px;
        line-height: 0px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        color: #f45145;
        margin-top: 5px;
    }
    .col-xs-8r,
    .col-sm-8r,
    .col-md-8r,
    .col-lg-8r {
        position: relative;
        min-height: 1px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .col-xs-8r {
        width: 12.5%;
        float: left;
    }

    @media (min-width: 768px) {
        .col-sm-8r {
            width: 12.5%;
            float: left;
        }
    }

    @media (min-width: 992px) {
        .col-md-8r {
            width: 12.5%;
            float: left;
        }
    }

    @media (min-width: 1200px) {
        .col-lg-8r {
            width: 12.5%;
            float: left;
        }
    }

    .box {
        border: 1px solid #0580a1;
        padding: 10px 5px;
        position: relative;
    }
    .box input {
        position: absolute;
        top: -5px;
        right: -1px;
    }
    .box .product-title {
        font-size: 13px;
        font-weight: 500;
    }
    .custom-checkbox {
        background: transparent;
        height: 20px;
        width: 20px;
        float: left;
        margin-left: 30px;
        /*border: 1px solid #0580a1;*/
        -webkit-appearance: none;
        cursor: pointer;
    }
    .custom-checkbox:after {
        content: "✓";
        color: transparent;
        display: block;
        height: 100%;
        width: 100%;
        text-align: center;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.4s ease;
    }
    .custom-checkbox:checked {
        background: #f87233;
        border: 1px solid #f87233;
    }
    .custom-checkbox:checked:after {
        color: #FFF;
        border: 1px solid #f87233;
        box-shadow: none;
        outline: none;
    }
    .custom-checkbox:focus{
        outline: none !important;
    }
    .solution_column {
        margin-bottom: 15px;
    }
</style>
<div class="customer-profile-contact-index">
    <?php $form = ActiveForm::begin(); ?> 
    <div class="row">
        <div class="hide">
            <?= $form->field($model, 'id')->hiddenInput() ?>
        </div>
        <?php
            if(!empty($id_customer_profile)){
                $solutions = Yii::$app->db->createCommand("
                    SELECT a.id, a.`name`, a.icon, b.id_solution as checked
                    FROM hls_solutions AS a
                    LEFT JOIN customer_profile_solution AS b ON a.id = b.id_solution AND b.id_customer = :id_customer_profile
                    ORDER BY a.id ASC")
                ->bindParam(':id_customer_profile', $id_customer_profile)
                ->queryAll();
                foreach ($solutions as $key => $value) {
                    $checked = 'checked';
                    if($value['checked'] == null){
                        $checked = '';
                    }
        ?>
                    <div class="col-xs-4 col-sm-2 text-center solution_column" data-id="<?= $value['id'] ?>">
                        <div class="box" id="box_<?= $value['id'] ?>">
                            <input type="checkbox" class="custom-checkbox" name='solutions[]' <?= $checked ?> value="<?= $value['id'] ?>" id="chk_<?= $value['id'] ?>" />
                            <label for="chk_<?= $value['id'] ?>">
                                <i class="<?= $value['icon'] ?>" style="font-size: 2.5em; color: #0580a1;"></i><br><br>
                                <span class="product-title"><?= $value['name'] ?></span>
                            </label>
                        </div>
                    </div>
        <?php
                }
            }
        ?>
    </div>

    <div class="panel panel-bordered panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Solution Info</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'sale_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'lived_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'passed_by')->widget(Select2::classname(), [
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
                <div class="col-md-3">
                    <?= $form->field($model, 'handle_by')->widget(Select2::classname(), [
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

            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'accomodation_status')->widget(Select2::classname(), [
                            'data' => $accommodation_status,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?> 
                </div>
            </div>
            

            <div class="row-terminated <?= $model->accomodation_status ==3?'show':'hide'?>"">
                <div class="row">
                    <div class="col-md-3">
                        <?= $form->field($model, 'deactivated_at', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background:white']) ?>
                    </div>
                    <div class="col-md-3">
                        <?= $form->field($model, 'deactivated_by')->widget(Select2::classname(), [
                            'data' => $employee_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['prompt' => 'Choose deactivated by'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ]]);
                        ?> 
                    </div>
                    <div class="col-md-3">
                        <?= $form->field($model, 'deactivated_requested_by')->textInput(['maxlength' => true]) ?>
                    </div>
                    <div class="col-md-3">
                        <?= $form->field($model, 'deactivated_requested_contact_detail')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="col-md-12">
                        <?= $form->field($model, 'deactivated_reason')->textArea(['rows' => 4]) ?>
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

    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $("#customerprofile-sale_date").change(function(){

        $('#customerprofile-lived_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#customerprofile-lived_date').val())){
            $('#customerprofile-lived_date').datepicker('setDate', $(this).val());
        }

    });

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $('#customerprofile-sale_date, #customerprofile-lived_date, #customerprofile-deactivated_at').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
        todayHighlight : true,
    });
    
    $('.solution_column').on('click', function(){
        var id = $(this).data('id');
        var checkbox = $("#box_"+id).children('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));
    });

    $("#customerprofile-accomodation_status").change(function(){
        var id = $(this).val();
        id = parseInt(id);

        if(id == 3){
            $(".row-terminated").removeClass('hide');
        }else{
            $(".row-terminated").addClass('hide');
        }
    });

    $(".emNavActive_customer-profile-solution").css({"color": "#f87232", "font-weight": "500"});

JS;
$this->registerJs($script);
?>
