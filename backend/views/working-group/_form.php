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
            
        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

        <?php 
            if(!$model->isNewRecord){
                $tag_arr = \backend\models\WorkingGroupDepartment::find()
                    ->select('id_department')
                    ->where(['id_working_group'=>$model->id])
                    ->asArray()
                    ->all();
                $row_department = [];
                if(!empty($tag_arr)){
                    foreach($tag_arr as $d){
                        $row_department[]=$d['id_department'];
                    }
                }
            }else{
                $row_department = [];
            }

            $data_department = ArrayHelper::map(\backend\models\Department::find()->all(), 'id', 'name'); 

        ?>
        <label>Department</label>
        <?= Select2::widget([
                'name' => 'department[]',
                'value'=> $row_department,
                'data' => $data_department,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'department_data'],
                'pluginOptions' => [
                    'tags' => false,
                    'allowClear' => true
                ],
            ]);
        ?>  
        <div class="pad-btm"></div>
        <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>
        
        <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
        <?php if ($model->status != 1) { $model->status = 0;} ?>
        <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
