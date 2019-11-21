<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\QuotationTemplate */

$this->title = 'Update Quotation Template: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Quotation Templates', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quotation-template-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item,
        'model_feature' => $model_feature
    ]) ?>
</div>
