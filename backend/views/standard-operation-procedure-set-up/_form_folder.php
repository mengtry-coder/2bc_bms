<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
@$id_standard_operation_procedure_set_up = $_GET['id_standard_operation_procedure_set_up'];

$base_url = Yii::getAlias('@web');

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */
/* @var $form yii\widgets\ActiveForm */ 
?>

<div class="event-list-form-folder">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12"> 
        <?= $form->field($model, 'folder_name')->textInput() ?>
        <?= $form->field($model, 'id_standard_operation_procedure_set_up')->hiddenInput(['value'=>$id_standard_operation_procedure_set_up ])->label(false)?>
        <?= $form->field($model, 'status')->hiddenInput(['value'=>1 ])->label(false)?>
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
