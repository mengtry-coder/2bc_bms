<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web');
$parent_account_type = ArrayHelper::map(\backend\models\AccountType::find()
    ->where(['is_parent' => 0])
    ->all(), 'id', 'names');
?>
<div class="row">
    <div class="col-sm-12">
        <div class="account-type-form">

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'names')->textInput(['maxlength' => true]) ?>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'detail_type')->textarea(['rows' => 4]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'is_parent')->dropDownList($parent_account_type,
                        ['prompt' => "None"])
                    ?>
                    <?php $model->isNewRecord ? $model->status = 1 : $model->status = $model->status; ?>
                    <?php if ($model->status != 1) {
                        $model->status = 0;
                    } ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                </div>
            </div>

            <?php echo $form->field($model, 'updated_by')->hiddenInput(['value' => $model->isNewRecord ? Yii::$app->user->id : $model->updated_by])->label(false) ?>

            <?php echo $form->field($model, 'updated_date')->hiddenInput(['value' => $model->isNewRecord ? date('Y-m-d') : $model->updated_date])->label(false) ?>

            <?php echo $form->field($model, 'created_by')->hiddenInput(['value' => $model->isNewRecord ? Yii::$app->user->id : $model->created_by])->label(false) ?>

            <?php echo $form->field($model, 'created_date')->hiddenInput(['value' => $model->isNewRecord ? date('Y-m-d') : $model->created_date])->label(false) ?>


            <div class="form-group pull-right">
                <?= Html::submitButton('Save', ['class' => 'btn btn-primary cus-button']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>

   
