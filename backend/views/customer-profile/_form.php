<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use yii\helpers\arrayhelper;
use kartik\select2\Select2;

$country = ArrayHelper::map(\backend\models\Country::find()->all(), 'id', 'names');
$city = ArrayHelper::map(\backend\models\City::find()->all(), 'id', 'names');
$customer_group = ArrayHelper::map(\backend\models\CustomerGroup::find()->all(), 'id', 'name');
$customer_type = ArrayHelper::map(\backend\models\CustomerType::find()->all(), 'id', 'name');
 
?>

<div class="customer-profile-form">
    <?php 
        $validationUrl = ['customer-profile/validation'];
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
                    <li class="active"><a href="#tab-customer-details" data-toggle="tab">Customer Details</a></li>
                    <li><a href="#tab-billing-shipping" data-toggle="tab">Billing & Shipping</a></li>
                </ul>
            </div>
            <!-- <h3 class="panel-title">Panel With tabs</h3> -->
        </div> 
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-customer-details">    
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'customer_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'email_address')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
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
                                <div class="col-md-6">
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
                            </div>
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
                        
                        <div class="col-md-6">
                            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                        </div>  

                        <div class="col-md-6">
                            <?php 
                                if(!$model->isNewRecord){
                                    $customerGroupArr = \backend\models\CustomerProfileGroup::find()
                                        ->select('id_customer_group')
                                        ->where(['id_customer_profile'=>$model->id])
                                        ->asArray()
                                        ->all();
                                    $customerGroupTag = [];
                                    if(!empty($customerGroupArr)){
                                        foreach($customerGroupArr as $d){
                                            $customerGroupTag[]=$d['id_customer_group'];
                                        }
                                    }
                                }else{
                                    $customerGroupTag = [];
                                }
                                    
                            ?>
                            <label>Customer Group</label>
                            <?= Select2::widget([
                                    'name' => 'id_customer_group[]',
                                    'data' => $customer_group,
                                    'value'=>$customerGroupTag,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Customer Group', 'multiple' => true, 'id'=>'id_customer_group'],
                                    'pluginOptions' => [
                                        'allowClear' => false
                                    ],
                                ]);
                            ?>
                               
                        </div>
                        
                    </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'zip_code')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                            <?php if ($model->status != 1) { $model->status = 0;} ?>
                            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                        </div>
                    </div>
                </div>
            
                <div class="tab-pane fade" id="tab-billing-shipping"> 
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-info btn-rounded btn-labeled" id="btn_get" style="margin-bottom: 10px;" ><i class="btn-label demo-pli-information icon-lg icon-fw"></i> SAME AS CUSTOMER INFO</button>

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
        var address = $("#customerprofile-address").val();
        $("#customerprofile-billing_address").val(address);
        var city = $("#customerprofile-id_city").val();
        $("#customerprofile-id_billing_city").val(city).trigger("change");
        var country = $("#customerprofile-id_country").val();
        $("#customerprofile-id_billing_country").val(country).trigger("change"); 
    });
    $("#btn_copy").click(function(){
        var address = $("#customerprofile-billing_address").val();
        $("#customerprofile-shipping_address").val(address);
        var city = $("#customerprofile-id_billing_city").val();
        $("#customerprofile-id_shipping_city").val(city).trigger("change");
        var country = $("#customerprofile-id_billing_country").val();
        $("#customerprofile-id_shipping_country").val(country).trigger("change");
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
