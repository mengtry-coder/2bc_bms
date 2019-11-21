<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');
$department = ArrayHelper::map(\backend\models\Department::find()
->where(['status' => 1])
->all(), 'id', 'name');    

?>

<style type="text/css">
    .select2-container { 
        z-index: 1;
    }
</style>

<div class="employee-profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'name')->textInput(['placeholder' => 'Search'])->label(false) ?>
    </div> 
  
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_department')->widget(Select2::classname(), [
                'data' => $department,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Department'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_position')->widget(Select2::classname(), [
                'data' => $position,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Position'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'sex')->widget(Select2::classname(), [
                'data' => (["0" => "Female","1" => "Male"]),
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Gender'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
    <?= $form->field($model, 'status')->widget(Select2::classname(), [
                'data' => (["1" => "Active","0" => "Inactive"]),
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Status'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>


    <div class="form-group">
        <?= Html::submitButton('Search <i class="fa fa-search go-right"></i>', ['class' => 'btn btn-success btn-rounded margin-top-23']) ?>
        <!-- <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?> -->
        <div class="pull-right" style="margin-top: 23px;">
            <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['employee-profile/create']) ?>">                            Add New <i class="fa fa-plus-square go-right"></i>
            </button> 
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<style>
.margin-top-23{
    margin-top: 23px;
}
</style>