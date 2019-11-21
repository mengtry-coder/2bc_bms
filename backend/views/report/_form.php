<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\UploadedFile;
$base_url = Yii::getAlias('@web');

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->logo;
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
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);

?>

<div class="company-profile-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-3">
            <div style="display: none">
                <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
            </div>
            <div class="wr_img">
                <?php if ($model->logo == "" || $model->isNewRecord ){ ?>
                    <label for = 'companyprofile-file'>
                        <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                    </label>
                <?php } else {?>
                    <label for="companyprofile-file">
                        <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                    </label>
                <?php } ?>
            </div>
        </div>
        <div class="col-md-9">

            <?= $form->field($model, 'names')->textInput(['maxlength' => true]) ?>

            <div class="row">
                <div class="col-md-6">
                     <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                     <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <?= $form->field($model, 'website')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>
            <?= $form->field($model, 'what_we_do')->textarea(['rows' => 6]) ?>
            <?= $form->field($model, 'bill_and_payment')->textarea(['rows' => 6]) ?>
            <?= $form->field($model, 'quotation_term_and_condition')->textarea(['rows' => 6]) ?>

            <?= $form->field($model, 'vattin')->textInput(['maxlength' => true]) ?>


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
      $("#companyprofile-file").change(function () {
        readURL(this);
      });
      $("#companyprofile-file").hide();
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
