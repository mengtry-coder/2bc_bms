<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
$userList = ArrayHelper::map(\backend\models\EmployeeProfile::find()
        ->all(), 'id', function($model){return $model->first_name . ' ' . $model->last_name;}); 
?>

<div class="hr-approval-permission-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-12">
            
        <?= $form->field($model, 'approver_id')->widget(Select2::classname(), [
                'data' => $userList,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Select'],
                'pluginOptions' => [
                    // 'allowClear' => true
                ],
            ]);
        ?> 

        <?php 
            if(!$model->isNewRecord){
                $tag_arr = \backend\models\HrApprovalPermissionDepartment::find()
                    ->select('department_id')
                    ->where(['hr_approval_permission_id'=>$model->id])
                    ->asArray()
                    ->all();
                $row_department = [];
                if(!empty($tag_arr)){
                    foreach($tag_arr as $d){
                        $row_department[]=$d['department_id'];
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
