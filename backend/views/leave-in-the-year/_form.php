<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\arrayhelper;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYear */
/* @var $form yii\widgets\ActiveForm */

$year_list = ArrayHelper::map(\backend\models\YearList::find()->all(), 'id', 'name');
$month_list = ArrayHelper::map(\backend\models\monthList::find()->all(), 'id', 'name');
?>
<style media="screen">
label {
    font-weight: bold;
}
.modal-dialog.modal-lg {
  width: 90%;
}
.list-item {
    width: 19%;
    float: left;
    margin-right: 5px;
    padding-bottom: 20px;
}
.clear{clear: both;}
</style>
<div class="leave-in-the-year-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
          <div class="col-md-6">
            <?= $form->field($model, 'name')->textInput() ?>
            <?=
                $form->field($model, 'id_year_list')->widget(Select2::classname(), [
                    'data' => $year_list,
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
                $form->field($model, 'id_month_list')->widget(Select2::classname(), [
                    'data' => $month_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>

            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>

          </div>
        </div>
        <div class="col-md-12">
          <div class="panel panel-bordered panel-primary">
              <div class="panel-heading">
                  <h3 class="panel-title">Leave Type Value</h3>
              </div>
              <div class="panel-body calculate_item">
                <!-- start if new record======== -->
                  <?php
                      $leave_type = \backend\models\LeaveTypeName::find()->all();
                      if($model->isNewRecord){
                          foreach ($leave_type as $key => $value) {
                  ?>
                  <div class="list-item">
                      <select name="leave_type[]" class="hidden form-control month_list" data-id="<?= $value->id ?>" id="leave_type_<?= $value->id ?>">
                          <option value="<?= $value->id ?>"> <?= $value->names ?></option>
                      </select>
                      <label for="<?= $value->names ?>"><?= $value->names ?></label>
                      <div class="input-group">
                          <span class="input-group-addon">#</span>
                          <input type="number" name="leave_type_value[]" value="0" min="0" step="1" class="form-control daily" data-id="<?= $value->id; ?>" id="daily_<?= $value->id; ?>" />
                      </div>
                  </div>
                  <?php }?>
                <?php }else{ ?>
                <!-- end if new record======== -->
                <!-- start update form========== -->
                <?php
                        $i = 1;
                        foreach ($model_item as $key => $value) {
                          $i++;
                ?>
                <div class="list-item">
                  <select name="leave_type[]" class="hidden form-control leave_type" data-id="<?= $value->id_leave_type ?>" id="leave_type_<?= $value->id ?>">
                      <option value="<?= $value->id_leave_type ?>"> <?= $value->leaveType->names ?></option>
                  </select>
                    <label><?= $value->leaveType->names ?></label>
                    <div class="input-group">
                        <span class="input-group-addon">#</span>
                        <input type="number" name="leave_type_value[]" value="<?= $value->leave_type_value ?>" min="0" step="0.01" class="form-control monthly" data-id="<?= $value->leave_type_value ?>" id="monthly_<?= $value->leave_type_value ?>" />
                    </div>
                </div>
                <?php }?>
                <!-- end update form========== -->
                <?php } ?>
              </div>
          </div>

        </div>
    </div>

    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
