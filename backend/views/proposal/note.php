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
$base_url = Yii::getAlias('@web');

$this->title = 'Note';
$this->params['breadcrumbs'][] = ['label' => 'Proposal', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name];
$this->params['breadcrumbs'][] = $this->title;

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>

<div class="proposal-profile">
    <?= $this->render('//proposal/_top_tab'); ?>

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

                <?= $form->field($model_note, 'note')->textArea(['class'=>"editor_area"])->label(false) ?>

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


    var base_url = "$base_url";

    $('.editor_area').each(function(e){
        CKEDITOR.replace( this.id, { customConfig: base_url + '/plugins/ckeditor/config.js' });
    });

JS;

$this->registerJs($script);

?>
