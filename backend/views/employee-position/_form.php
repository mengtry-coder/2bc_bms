<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web');

$department = ArrayHelper::map(\backend\models\Department::find()
    ->all(), 'id', 'name');
?>

<div class="employee-position-form">

    <?php

        $validationUrl = ['employee-position/validation'];
        if (!$model->isNewRecord){
            $validationUrl['id'] = $model->id;
        }

        $form = ActiveForm::begin([
            'id' => $model->formName(),
            'enableAjaxValidation' => true,
            'enableClientValidation' => true,
            'validationUrl' => $validationUrl
        ]);
    ?>
        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'position_type')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-12">
              <?= $form->field($model, 'id_department')->widget(Select2::classname(), [
                      'data' => $department,
                      'theme' => Select2::THEME_DEFAULT,
                      'language' => 'eg',
                      'options' => ['placeholder' => 'Select'],
                      'pluginOptions' => [
                          'allowClear' => true
                      ],
                  ]);
              ?>
            </div>
            <div class="col-md-12">
                <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                <?php if ($model->status != 1) { $model->status = 0;} ?>
                <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
            </div>
            <div class="col-md-12">
                <?= $form->field($model, 'description')->textarea(['class' => 'editor_area']) ?>
            </div>
        </div>
        <div class="text-right">
            <?=
                Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']);
            ?>
        </div>
    <?php ActiveForm::end(); ?>

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
