<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use yii\helpers\arrayhelper;
use kartik\select2\Select2;

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$customer_type = ArrayHelper::map(\backend\models\CustomerType::find()->all(), 'id', 'name');

$country = ArrayHelper::map(\backend\models\Country::find()->all(), 'id', 'names');
$city = ArrayHelper::map(\backend\models\City::find()->all(), 'id', 'names');
$customer_group = ArrayHelper::map(\backend\models\CustomerGroup::find()->all(), 'id', 'name');
$customer_status = ArrayHelper::map(\backend\models\CustomerProfileStatus::find()->where(['!=','id',6])->all(), 'id', 'name');
$source = ArrayHelper::map(\backend\models\Source::find()->all(), 'id', 'name');
$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;}); 
?>

<div class="lead-profile-form">
    <?php 
    $validationUrl = ['lead-profile/validation'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => true,
        'enableClientValidation' => true,
        'options' => ['autocomplete' => 'off'],
        'validationUrl' => $validationUrl
    ]); 
    ?>
        <!--Panel heading-->
        <div class="panel-heading">
            <div class="panel-control" style="float: left;">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-lead-details" data-toggle="tab">Lead Details</a></li>
                    <li><a href="#tab-billing-shipping" data-toggle="tab">Billing & Shipping</a></li>
                </ul>
            </div>
            <!-- <h3 class="panel-title">Panel With tabs</h3> -->
        </div> 
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-lead-details">  
                    <div class="row"> 
                        
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-7"> 
                                    <?php
                                    if(!$model->isNewRecord){
                                    ?>
                                        <button class="btn btn-success btn-rounded btn-labeled button-convertLead" style="margin-top: 20px;margin-bottom: 10px;" data-value="<?= yii\helpers\Url::to(['lead-profile/convert-lead', 'id' => $model->id]); ?>" title="Lead" data-confirm="Are you sure want to convert this Lead to Customer?" data-method="post"><i class="btn-label fa fa-user-o icon-lg icon-fw"></i> CONVERT TO CUSTOMER</button>
                                    <?php
                                    }else{ 
                                    ?>
                                        <button class="btn btn-success btn-rounded btn-labeled" style="margin-top: 20px;margin-bottom: 10px;" title="Lead" disabled><i class="btn-label fa fa-user-o icon-lg icon-fw"></i> CONVERT TO CUSTOMER</button>
                                    <?php
                                    }
                                    ?>
                                </div>
                                <div class="col-md-5"> 
                                    <?= 
                                        $form->field($model, 'customer_status')->widget(Select2::classname(), [
                                            'data' => $customer_status,
                                            'theme' => Select2::THEME_DEFAULT,
                                            'language' => 'eg',
                                            // 'options' => ['placeholder' => 'Select'],
                                            'pluginOptions' => [
                                                'allowClear' => false
                                            ],
                                        ]);
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <?= 
                                        $form->field($model, 'id_source')->widget(Select2::classname(), [
                                            'data' => $source,
                                            'theme' => Select2::THEME_DEFAULT,
                                            'language' => 'eg',
                                            'options' => ['placeholder' => 'Select'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                        ]);
                                    ?> 
                                    
                                </div>
                                <div class="col-md-6">
                                    <?= 
                                        $form->field($model, 'assigned_to')->widget(Select2::classname(), [
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
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'lead_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'email_address')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                                <?= 
                                                    $form->field($model, 'id_customer_type')->widget(Select2::classname(), [
                                                        'data' => $customer_type,
                                                        'theme' => Select2::THEME_DEFAULT,
                                                        'language' => 'eg',
                                                        'options' => ['placeholder' => 'Select'],
                                                        'pluginOptions' => [
                                                            'allowClear' => true
                                                        ],
                                                    ]);
                                                ?> 
                                                </div>
                                    <div class="col-md-6"> 
                                    <?= $form->field($model, 'star_rating')->textInput(['maxlength' => true,'type'=>'number']) ?>
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <?= 
                                $form->field($model, 'id_country')->widget(Select2::classname(), [
                                    'data' => $country,
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
                            <?= 
                                $form->field($model, 'id_city')->widget(Select2::classname(), [
                                    'data' => $city,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?> 
                        </div>
                        
                        <div class="col-md-6">
                            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                        </div>  
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-7">
                                    <?= $form->field($model, 'zip_code')->textInput(['maxlength' => true]) ?>
                                </div>
                                <div class="col-md-5"> 
                                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>   
                                </div> 
                            </div>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-12"> 
                            <?= $form->field($model, 'note')->textarea(['rows' => '4']) ?>
                        </div>
                    </div>
                </div>
            
                <div class="tab-pane fade" id="tab-billing-shipping"> 
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-info btn-rounded btn-labeled" id="btn_get" style="margin-bottom: 10px;" ><i class="btn-label demo-pli-information icon-lg icon-fw"></i> SAME AS lead INFO</button>

                            <?= $form->field($model, 'billing_address')->textInput(['maxlength' => true]) ?>
                            <?= 
                                $form->field($model, 'id_billing_city')->widget(Select2::classname(), [
                                    'data' => $city,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                            <?= 
                                $form->field($model, 'id_billing_country')->widget(Select2::classname(), [
                                    'data' => $country,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div> 

                        <div class="col-md-6">
                            <button type="button" class="btn btn-mint btn-rounded btn-labeled" id="btn_copy" style="margin-bottom: 10px;" ><i class="btn-label demo-pli-information icon-lg icon-fw" ></i> COPY BILLING ADDRESS</button>
                           
                            <?= $form->field($model, 'shipping_address')->textInput(['maxlength' => true]) ?>
                            <?= 
                                $form->field($model, 'id_shipping_city')->widget(Select2::classname(), [
                                    'data' => $city,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>   
                            <?= 
                                $form->field($model, 'id_shipping_country')->widget(Select2::classname(), [
                                    'data' => $country,
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
                </div> 
            </div>   
        </div> 
        <div class="text-right"> 
            <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
        </div> 
    <?php ActiveForm::end(); ?> 
</div>      
<?php  
$this->registerJs('
    $("#btn_get").click(function(){
        var address = $("#leadprofile-address").val();
        $("#leadprofile-billing_address").val(address);
        var city = $("#leadprofile-id_city").val();
        $("#leadprofile-id_billing_city").val(city);
        var country = $("#leadprofile-id_country").val();
        $("#leadprofile-id_billing_country").val(country); 
    });
    $("#btn_copy").click(function(){
        var address = $("#leadprofile-billing_address").val();
        $("#leadprofile-shipping_address").val(address);
        var city = $("#leadprofile-id_billing_city").val();
        $("#leadprofile-id_shipping_city").val(city);
        var country = $("#leadprofile-id_billing_country").val();
        $("#leadprofile-id_shipping_country").val(country);
    });
    
'); 
?>
<style type="text/css">
    .row-form {
        margin: 0px -15px;
    }
    .nav-tabs {
        padding-left: 0px;
    }
    .nav-tabs li a{
        margin-right: 0px;
    }
    .titleproperty{
        padding-top: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }
</style>
<?php 
$script = <<<JS
    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-convertLead')){
            swal({
                text: "Are you sure you want to Convert this Lead to Customer?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
    };

JS;
$this->registerJs($script);
?>