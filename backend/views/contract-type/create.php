<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ContractType */

$this->title = 'Create Contract Type';
$this->params['breadcrumbs'][] = ['label' => 'Contract Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="contract-type-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
