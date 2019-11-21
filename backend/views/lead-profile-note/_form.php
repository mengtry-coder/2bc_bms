<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
$request = Yii::$app->request; 
$id_lead_profile = $request->get('id_lead_profile',0); 
?>

<div class="lead-profile-note-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'note')->textarea(['rows' => '4']) ?>
            <?= $form->field($model, 'id_lead_profile')->hiddenInput()->label(false)?>
        </div>
    </div>  

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
