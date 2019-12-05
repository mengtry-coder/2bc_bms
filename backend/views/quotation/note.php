<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

$class_id = Yii::$app->controller->action->id;

$this->registerCssFile(
    "@web/plugins/summernote/summernote.min.css",
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/summernote/summernote.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Note';
$this->params['breadcrumbs'][] = ['label' => 'Proposal', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name];
$this->params['breadcrumbs'][] = $this->title;


?>

<div class="proposal-profile">
    <?= $this->render('//quotation/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
            <p class="text-main text-bold"><?= $this->title; ?></p>
            <hr>
            <div class="row task-overview">

                <div class="proposal-timesheet-form">

                    <?php

                $validationUrl = ['proposal/validation'];
                if (!$model->isNewRecord){
                    $validationUrl['id'] = $model->id;
                }

                $form = ActiveForm::begin([
                    'id' => $model_note->formName(),
                    'enableAjaxValidation' => false,
                    'enableClientValidation' => true,
                    'options' => ['autocomplete' => 'off'],
                    // 'validationUrl' => $validationUrl
                ]);
                ?>

                    <?= $form->field($model_note, 'note')->textArea(['id'=>"demo-summernote"])->label(false) ?>

                    <div class="text-right">
                        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>

            </div>
        </div>
    </div>

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