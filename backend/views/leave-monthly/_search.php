<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

$employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()
->where(['status' => 1])
->all(), 'id', function($model){
    return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;
});    

$month_list = ArrayHelper::map(\backend\models\MonthList::find()->all(), 'id', 'name'); 
$year_list = ArrayHelper::map(\backend\models\YearList::find()->all(), 'id', 'name');
?>

<div class="employee-profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
  
    <div class="col-md-4" style="margin-top: 23px;">
        <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                'data' => $employee,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Employee'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_year')->widget(Select2::classname(), [
                'data' => $year_list,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Year'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?>
    </div>
    <div class="col-md-2" style="margin-top: 23px;">
        <?= $form->field($model, 'id_month')->widget(Select2::classname(), [
                'data' => $month_list,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Month'],
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
        <div class="pull-right" style="margin-top: 23px;">
            <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['leave-monthly/create']) ?>">                           
             Add New <i class="fa fa-plus-square go-right"></i>
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