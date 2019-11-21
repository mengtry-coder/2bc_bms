<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\DataOptionPrefix */

$this->title = 'Update Data Option Prefix: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Data Option Prefixes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="data-option-prefix-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
