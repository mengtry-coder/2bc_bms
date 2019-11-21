<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;

use yii\widgets\ActiveForm;
use kartik\select2\Select2;

$base_url = Yii::getAlias('@web');
$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
$approver = ArrayHelper::map(\backend\models\EmployeeProfile::find()->where(['id_position'=>1])
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
$leave_type = ArrayHelper::map(\backend\models\LeaveTypeName::find()
    ->all(), 'id', function($model){return $model->names;});
$leave_status = ArrayHelper::map(\backend\models\LeaveStatus::find()
    ->all(), 'id', function($model){return $model->approve_status_name;});
$userid  = Yii::$app->user->getId();

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
    $img_url = $base_url."/".$img_url;

    if(!$model->isNewRecord){
        $canApprove = $is_approval['is_appoval'];
    }else{
        $canApprove = 0;
    }
?>
<style media="screen">
.modal-dialog.modal-lg {
  width: 80%;
}
</style>
<div class="leave-application-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
    <?php
        if($canApprove == 0){
    ?>
hello can not approve
    <?php
        }else{
    ?>
hello can approve
    <?php 
        }
    ?>
        <div class="col-md-12">
          <div class="col-md-4">
            <div style="display: inline">
                <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
            </div>
            <div class="wr_img">
                <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                    <label for = 'leaveapplication-file'>
                        <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                    </label>
                <?php } else {?>
                    <label for="leaveapplication-file">
                        <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                    </label>
                <?php } ?>
            </div>
          </div>
          <div class="col-md-4">

            <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                    'data' => $employee_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>
              <?= $form->field($model, 'id_approver')->widget(Select2::classname(), [
                    'data' => $approver,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);?>
                <?= $form->field($model, 'start_date')->textInput(['readOnly'=>true]) ?>

                <?= $form->field($model, 'end_date')->textInput(['readOnly'=>true]) ?>
                <?= $form->field($model, 'is_half_day')->checkbox() ?>

          </div>
          <div class="col-md-4">
            <?= $form->field($model, 'id_leave_type_name')->widget(Select2::classname(), [
                  'data' => $leave_type,
                  'theme' => Select2::THEME_DEFAULT,
                  'language' => 'eg',
                  'options' => ['placeholder' => 'Select'],
                  'pluginOptions' => [
                      'allowClear' => true
                  ],
              ]);
              ?>

            <?= $form->field($model, 'leave_reason')->textInput(['maxlength' => true]) ?>


            <?php
             $id_position = \backend\models\EmployeeProfile::findOne($userid)->id_position;
             if($id_position == 1){
               echo $form->field($model, 'id_leave_status')->widget(Select2::classname(), [
                     'data' => $leave_status,
                     'theme' => Select2::THEME_DEFAULT,
                     'language' => 'eg',
                     'options' => ['placeholder' => 'Select'],
                     'pluginOptions' => [
                         'allowClear' => true
                     ],
                 ]);

             }
             ?>
             <?= $form->field($model, 'reject_reason')->textInput(['maxlength' => true]) ?>

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

// ========upload =====
$(function () {
    $("#leaveapplication-file").change(function () {
      readURL(this);
    });
    $("#leaveapplication-file").hide();
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

// =======
$('#leaveapplication-start_date, #leaveapplication-end_date').datepicker({
    format: 'yyyy-mm-dd',
    changeMonth: true,
    changeYear: true,
    autoclose: true,
});
JS;



$this->registerJs($script);

?>
