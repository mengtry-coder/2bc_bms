<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
$this->registerJsFile(
    '@web/js/bootstrap.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$base_url = Yii::getAlias('@web');
$prefix_name = ArrayHelper::map(\backend\models\DataOptionPrefix::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$marital_status = ArrayHelper::map(\backend\models\MaritalStatus::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');  
$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
 
$sql = "
    SELECT CONCAT('(','+',phone_code.code,')',' ',phone_code.short_name) as phone_prefix_code,
    phone_code.id as id
    FROM data_option_phone_number_country_code as phone_code 
    WHERE phone_code.status = 1 
    ";
$prefix_phone_code = Yii::$app->db->createCommand($sql)->queryAll();
$prefix_phone_code = ArrayHelper::map($prefix_phone_code, 'id', 'phone_prefix_code');

?>

<div class="membership-profile-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-4">
                    <?= 
                        $form->field($model, 'id_prefix')->widget(Select2::classname(), [
                            'data' => $prefix_name,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                    ?>   
                </div>
                <div class="col-md-7">
                    <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'passport_no')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-6">
                    <?php
                        $sex = ['male'=>'Male','female'=>'Female','other'=>'Other'];
                        echo $form->field($model, 'sex')->widget(Select2::classname(), [
                            'data' => $sex,
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
                        $form->field($model, 'marital_status')->widget(Select2::classname(), [
                            'data' => $marital_status,
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
        <div class="col-md-3">
            <?= $form->field($model, 'date_of_birth')->textInput() ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'place_of_birth')->textInput(['maxlength' => true]) ?>
        </div> 
        <div class="col-md-3">
            <?= 
                $form->field($model, 'nationality')->widget(Select2::classname(), [
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
    
    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'address_line_2')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <?= 
                        $form->field($model, 'prefix_phone_code')->widget(Select2::classname(), [
                            'data' => $prefix_phone_code,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                    ?>     
                </div>
                <div class="col-md-7">
                    <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <?= 
                        $form->field($model, 'prefix_phone_code_line_2')->widget(Select2::classname(), [
                            'data' => $prefix_phone_code,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-7">
                    <?= $form->field($model, 'phone_number_line_2')->textInput(['maxlength' => true]) ?>
                </div>
            </div>
        </div>   
    </div> 

    <div class="row"> 
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
        <div class="col-md-3">
            <?= $form->field($model, 'id_province')->textInput() ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'postal_code')->textInput(['maxlength' => true]) ?>
        </div>
    </div>
 
    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
        </div> 

        <div class="col-md-3">
            <?= $form->field($model, 'website')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'contact_person')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>
        </div> 
    </div>  

    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'mot_licence_no')->textInput(['maxlength' => true]) ?>
        </div>

        <div class="col-md-3">
            <?= $form->field($model, 'year_of_establishment')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'type_of_business')->textInput(['maxlength' => true]) ?>
        </div>
         
       <div class="col-md-3"> 
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div> 
    
    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>
        </div>

        <div class="col-md-3">
            <?= $form->field($model, 'confirm_password')->textInput(['maxlength' => true]) ?>
        </div> 
    </div>  
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textarea(['rows' => '6']) ?>
        </div>
    </div>
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS

var textarea = document.querySelector('textarea');

textarea.addEventListener('keydown', autosize);
                
function autosize(){
    var el = this;
    setTimeout(function(){
        el.style.cssText = 'height:auto;';
        el.style.cssText = 'height:' + el.scrollHeight + 'px';

    },0);
} 

$('#membershipprofile-date_of_birth').datepicker({
    format: 'yyyy-mm-dd',
    changeMonth: true,
    changeYear: true,
    autoclose: true
});

JS;
$this->registerJs($script);
?>
