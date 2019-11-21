<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\QuotationTemplate */

$this->title = 'Create Quotation Template';
$this->params['breadcrumbs'][] = ['label' => 'Quotation Templates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quotation-template-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
