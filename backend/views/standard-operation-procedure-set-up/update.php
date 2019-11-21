<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationProcedureSetUp */
$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->title = 'S.O.P Detail';
$this->params['breadcrumbs'][] = ['label' => 'S.O.P Procedures', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name];
// $this->params['breadcrumbs'][] = ['label' => $model->position->position_type];
$this->params['breadcrumbs'][] = 'S.O.P Detail';
?>
<div class="standard-operation-procedure-set-up-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
