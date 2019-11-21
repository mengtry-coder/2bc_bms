<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
$position_list = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->all(), 'id', function($model){return $model->position_type;});
/* @var $this yii\web\View */
/* @var $model backend\models\KnowledgeBase */
/* @var $form yii\widgets\ActiveForm */
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
<div class="knowledge-base-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">

                <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <!-- <?= $form->field($model, 'slug')->textInput() ?> -->

    <div class="position">
        <?php
            if(!$model->isNewRecord){
                $position_arr = \backend\models\KnowledgeBasePosition::find()
                    ->select('id_position')
                    ->where(['id_knowledge_base'=>$model->id])
                    ->asArray()
                    ->all();
                $row = [];
                if(!empty($position_arr)){
                    foreach($position_arr as $d){
                        $row[]=$d['id_position'];
                    }
                }
            }else{
                $row = [];
            }

        ?>
        <label>Position</label>
        <?= Select2::widget([
                'name' => 'id_knowledge_base[]',
                'data' => $position_list,
                'value'=>$row,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'task_tag'],
                'pluginOptions' => [
                    'tags' => true,
                    'tokenSeparators' => [',', ' '],
                    'maximumInputLength' => 10,
                    'allowClear' => true
                ],
            ]);
        ?>
        <div class="line15"></div>
    </div>

    <?= $form->field($model, 'internal_article')->checkbox(); ?>

    <?= $form->field($model, 'disabled')->checkbox(); ?>
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
