<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\UploadedFile;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');

$type = ArrayHelper::map(\backend\models\SupplierProfileType::find()
    ->all(), 'id', 'name');

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
$img_url = $base_url . '/' . $img_url;

?>

<style type="text/css">
    .select2-container--open {
        z-index: 9999999
    }
</style>

<div class="supplier-profile-form">

    <?php 

    // $validationUrl = ['task/validation'];
    // if (!$model->isNewRecord){
    //     $validationUrl['id'] = $model->id;
    // }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        // 'options' => ['autocomplete' => 'off'],
        // 'validationUrl' => $validationUrl
    ]); 
    ?>
    <div class="row"> 
        <div class="col-md-3">
            <div style="display: none">
                <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
            </div>   
            <div class="wr_img">
                <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                    <label for = 'supplierprofile-file'>
                        <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                    </label>
                <?php } else {?>
                    <label for="supplierprofile-file">
                        <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                    </label>
                <?php } ?>
            </div> 
        </div>
        <div class="col-md-9">

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'supplier_name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'id_supplier_profile_type')->widget(Select2::classname(), [
                            'data' => $type,
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

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
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
    
    $(function () {
      $("#supplierprofile-file").change(function () {
        readURL(this);
      });
      $("#supplierprofile-file").hide();
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

JS;

  $this->registerJs($script);
?>
