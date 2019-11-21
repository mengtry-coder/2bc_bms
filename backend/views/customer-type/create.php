<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerType */

$this->title = 'Create Customer Type';
$this->params['breadcrumbs'][] = ['label' => 'Customer Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-type-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
