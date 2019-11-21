<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile; 
$base_url = Yii::getAlias('@web/backend'); 

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->img_url;
    $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
    $command->bindParam(':id', $img_id);
    $my_id = $command->queryOne();
    if ($my_id == '') {
        $my_id = 1;
    }
    if($img_id == ''){
        $img_id = 1;
        $my_id = $img_id;
    }  
    $img_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;
 
}
// $img_url = $base_url.'/'.$img_url;
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);
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
$this->registerJsFile(
    '@web/js/bootstrap.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

// $validationUrl = ['membership-profile/validation'];
// if (!$model->isNewRecord){
//     $validationUrl['id'] = $model->id;
// } 

// $this->title = 'Profile'; 
// $this->params['breadcrumbs'][] = $this->title;

$this->title = 'Update Profile';
$this->params['breadcrumbs'][] = ['label' => 'Profile', 'url' => 'profile']; 
$this->params['breadcrumbs'][] = "Update: "." ".$model->company_name;


?> 

<div class="membership-profile-form">
 
    <?php $form = ActiveForm::begin([
        'id' => 'form-membership-profile',
        // 'enableAjaxValidation' => true,
        // 'enableClientValidation' => true,
        // 'validationUrl' => $validationUrl,
        // 'options' => ['autocomplete' => 'off']
    ]); ?> 
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-2">  
                    <div class="row">
                        <div class="col-md-12"> 
                            <div style="display: none">
                                <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                            </div>   
                            <div class="wr_img">
                                <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                                    <label for = 'membershipprofile-file'>
                                        <img id ='feature_images' src="<?= $base_url."/web/backend/uploads/NoPicAvailable.jpg";?>" class='img-responsive img-thumbnail'>
                                    </label>

                                <?php } else {?>

                                    <label for="membershipprofile-file">
                                        <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                                    </label>
                                <?php } ?>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row">
                    <div class="col-md-12">
                        <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
                    </div>

                    <div class="col-md-3">
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

                    <div class="col-md-3">
                        <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
                    </div>

                    <div class="col-md-3">
                        <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
                    </div>

                    <div class="col-md-3">
                        <?= $form->field($model, 'passport_no')->textInput(['maxlength' => true]) ?>
                    </div> 

                    <div class="col-md-3">
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

                    <div class="col-md-3">
                        <?= $form->field($model, 'date_of_birth')->textInput(['readonly'=>true]) ?>
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
                    <div class="row">
                        <div class="col-md-6">
                            <?php
                                $membership_type = ['1'=>'Membership','2'=>'Subscriber'];
                                echo $form->field($model, 'membership_type')->widget(Select2::classname(), [
                                    'data' => $membership_type,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    // 'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        // 'allowClear' => true
                                    ],
                                ]);
                            ?>   
                        </div>
                        <div class="col-md-6"> 
                            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                            <?php if ($model->status != 1) { $model->status = 0;} ?>
                            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                        </div>
                    </div>   
                </div>
            </div> 
             
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'description')->textarea(['rows' => '6']) ?>
                </div>
            </div>
            <div class="text-right"> 
                <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded','id'=>'demo-state-btn','data-loading-text' => 'Loading...']) ?>
            </div> 
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS

$('#modal').on('shown.bs.modal', function() {
          var d_height = $("#detail-height").outerHeight();
          $("#logo-height").css("height",d_height);
      });
$(function () {
      $("#membershipprofile-file").change(function () {
        readURL(this);
      });
      $("#membershipprofile-file").hide();
  });

   function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            x= e.target.result;
              $('#feature_images').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }

  $("#membershipprofile-date_of_birth").datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

JS;
$this->registerJs($script);
?>
