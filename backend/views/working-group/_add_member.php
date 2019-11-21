<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
?>

<div class="working-group-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            <?php 
                $data_employee = ArrayHelper::map(\backend\models\EmployeeProfile::find()->where(['id_working_group'=>null])->andWhere(['status'=>1])->all(), 'id', function($model){
                    return $model->id_prefix . ' ' . $model->first_name . ' ' . $model->last_name;
                }); 
            ?>
            <label>Member Name</label>
            <?= Select2::widget([
                    'name' => 'employee[]',
                    'data' => $data_employee,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'employee'],
                    'pluginOptions' => [
                        'tags' => false,
                        'allowClear' => true
                    ],
                ]);
            ?>  
            
        </div>
    </div>
    <div class="pad-btm"></div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
