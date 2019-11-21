<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;
use kartik\select2\Select2;
use backend\models\User;
use backend\models\UserType;

$base_url = Yii::getAlias('@web/backend'); 

$current_user_id = Yii::$app->user->getId();
        $user = User::findOne($current_user_id);
        $user_type_id = $user->user_type_id;
if (!$model->isNewRecord) { 
    if ($current_user_id !=1) {
        $user_type = ArrayHelper::map(\backend\models\UserType::find()
        ->where(['status' =>1])
        ->andWhere(['id'=>$model->user_type_id])
        ->all(), 'id', 'user_type_name');
    }else{
        $user_type = ArrayHelper::map(\backend\models\UserType::find()
        ->where(['status' =>1])
        ->all(), 'id', 'user_type_name');
    }
}else{
    $user_type = ArrayHelper::map(\backend\models\UserType::find()
    ->where(['status' =>1])
    ->all(), 'id', 'user_type_name');
}

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
echo $img_url;
// exit();
$validationUrl = ['user/validation-username'];
if (!$model->isNewRecord){
$validationUrl['id'] = $model->id;
}
$this->registerJsFile(
    '@web/js/bootstrap.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->title = 'Update user profile';
$this->params['breadcrumbs'][] = ['label' => 'Update user profile'];
?>

<div class="user-form">

   <?php $form = ActiveForm::begin([
    // 'id' => $model->formName(),
    // 'enableAjaxValidation' => true,
    // 'enableClientValidation' => true,
    // 'options' => ['autocomplete' => 'off'],
    // 'validationUrl' => $validationUrl
]); ?>

    <div class="row"> 
        <div class="col-md-2">
            <div class="row"> 
                <div class="col-md-12"> 
                    <div style="display: none">
                        <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                    </div>   
                    <div class="wr_img">
                        <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                            <label for = 'user-file'>
                                <img id ='feature_images' src="<?= $base_url."/web/backend/uploads/NoPicAvailable.jpg";?>" class='img-responsive img-thumbnail'>
                            </label>

                        <?php } else {?>

                            <label for="user-file">
                                <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                            </label>
                        <?php } ?>
                    </div> 
                </div>
            </div>
        </div>

        <div class="10">
            <div class="row">
                <div class="col-md-3">  
                    <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3">  
                    <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3">  
                    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3"> 
                    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3">  
                    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true,'name'=>'password'])->label($model->isNewRecord?'Password':'New Password') ?>  
                </div>
                <div class="col-md-3">  
                    <?= $form->field($model, 'confirm_password')->passwordInput(['maxlength' => true,'name'=>'confirm_password']) ?>  
                </div>

                <div class="col-md-3"> 
                    <?= $form->field($model, 'telephone')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3"> 
                    <?= 
                        $form->field($model, 'user_type_id')->widget(Select2::classname(), [
                            'data' => $user_type,
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
                    <div class="row">
                        <div class="col-md-6">
                            <?php
                            $gender = ['Male'=>'Male','Female'=>'Female','Other'=>'Other']; 
                            echo $form->field($model, 'gender')->widget(Select2::classname(), [
                                    'data' => $gender,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => false
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
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php 
 
$script = <<< JS
// start check password
     $("#user-password").change(function(){
        $("#user-confirm_password").val("");
     });
// end check password
// start check unique username
    //  (function($) {
    //     $.fn.donetyping = function(callback) {
    //         var _this = $(this);
    //         var x_timer;
    //         _this.keyup(function() {
    //         clearTimeout(x_timer);
    //         x_timer = setTimeout(clear_timer, 1000);
    //         });

    //         function clear_timer() {
    //         clearTimeout(x_timer);
    //         callback.call(_this);
    //         }
    //     }
    // })(jQuery);
    // $("#user-username").donetyping(function(callback){
    //     alert(1);
    // });
// end check unique username
    $(function () {
        $("#user-file").change(function () {
            readURL(this);
        });
        $("#user-file").hide();
    });

        function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                x= e.target.result;
                $("#feature_images").attr("src", e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    } 

JS;

$this->registerJS($script);
?>
