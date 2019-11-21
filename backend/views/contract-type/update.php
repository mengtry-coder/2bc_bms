<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ContractType */

$this->title = 'Update Contract Type: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Contract Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="contract-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
