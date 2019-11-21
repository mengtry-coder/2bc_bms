<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierPosition */

$this->title = 'Create Supplier Position';
$this->params['breadcrumbs'][] = ['label' => 'Supplier Positions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-position-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
