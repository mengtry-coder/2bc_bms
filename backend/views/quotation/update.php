<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Quotation */

$this->title = 'Update Quotation: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Quotations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quotation-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
        
    ]) ?>
</div>
