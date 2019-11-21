<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$this->registerCssFile(
    "@web/plugins/summernote/summernote.min.css",
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/summernote/summernote.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
?>
<style media="screen">
.note-editor.note-frame{
  border: 1px solid #d6d6d6;
}
.note-toolbar.panel-heading {
    background: #f1f1f1;
}
</style>
<div class="standard-operation-procedure-article-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-8"> 
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?> 
        </div>
        <div class="col-md-4"> 
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
        <div class="col-md-12"> 
             
            <?= $form->field($model, 'short_description')->textArea(); ?>
            <?= $form->field($model, 'description')->textArea(['id'=>"demo-summernote"])->label(false) ?>
        </div>
    </div>
    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS
    $('#demo-summernote, #demo-summernote-full-width').summernote({
        height : '350px',
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
        ]
    });
JS;
$this->registerJs($script);
?>
