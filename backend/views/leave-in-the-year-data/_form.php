<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\arrayhelper;
use kartik\select2\Select2;
$year_list = ArrayHelper::map(\backend\models\YearList::find()->all(), 'id', 'name');
$month_list = ArrayHelper::map(\backend\models\MonthList::find()->all(), 'id', 'name');
$leave_type_list = ArrayHelper::map(\backend\models\LeaveTypeName::find()->all(), 'id', 'names');

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYearData */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="leave-in-the-year-data-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
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
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>
                <div class="col-md-2">
                  <?=
                      $form->field($model, 'id_leave_type')->widget(Select2::classname(), [
                          'data' => $leave_type_list,
                          'theme' => Select2::THEME_DEFAULT,
                          'language' => 'eg',
                          'options' => ['placeholder' => 'Select'],
                          'pluginOptions' => [
                              'allowClear' => true
                          ],
                      ]);
                  ?>
                  <?= $form->field($model, 'leave_type_value')->textInput() ?>
                </div>





        </div>
    </div>

    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>
