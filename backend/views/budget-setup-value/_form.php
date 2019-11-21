<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetupValue */
/* @var $form yii\widgets\ActiveForm */
if (isset($_GET['source_id'])) {
  $budget_setup_id = $_GET['source_id'];
}else{
  $budget_setup_id = $model->id_budget_set_up;
}
?>

<div class="budget-setup-value-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">

                <?= $form->field($model, 'id_budget_set_up')->hiddenInput(['value'=> $budget_setup_id])->label(false);?>

    <?= $form->field($model, 'for_month')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'daily_budget')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'weekly_budget')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'monthly_budget')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'created_date')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

    <?= $form->field($model, 'updated_date')->textInput() ?>


        </div>
    </div>

    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>
