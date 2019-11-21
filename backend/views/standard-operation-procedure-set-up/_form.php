<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use bakcend\models\SopSetUpAssignPosition;
$base_url = Yii::getAlias('@web');
$position_list = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status'=>1])
    ->all(), 'id', function($model){return $model->position_type;});

?>
<style media="screen">
.note-editor.note-frame{
  border: 1px solid #d6d6d6;
}
.note-toolbar.panel-heading {
    background: #f1f1f1;
}
</style>
<div class="standard-operation-procedure-set-up-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-md-6">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-3"> 
            <?php 
                if(!$model->isNewRecord){
                    $member_arr = \backend\models\SopSetUpAssignPosition::find()
                        ->select('id_position')
                        ->where(['sop_set_up_id'=>$model->id])
                        ->asArray()
                        ->all();
                    $row = [];
                    if(!empty($member_arr)){
                        foreach($member_arr as $d){
                            $row[]=$d['id_position'];
                        }
                    }
                }else{
                    $row = [];
                }
                     
            ?>
            <label>Position</label>
            <?= Select2::widget([
                    'name' => 'id_position[]',
                    'data' => $position_list,
                    'value'=>$row,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => ' Position', 'multiple' => true, 'id'=>'id_position'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>
            <div class="line15"></div>
        </div>
        <div class="col-md-3">
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
        <div class="col-md-12"> 
        <?= $form->field($model, 'description')->textArea(['class'=>"editor_area"])->label(false) ?> 
        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS
    
    var base_url = "$base_url";

    $('.editor_area').each(function(e){
        CKEDITOR.replace( this.id, { customConfig: base_url + '/plugins/ckeditor/config.js', height: '400px' });
    });
JS;
$this->registerJs($script);
?>
