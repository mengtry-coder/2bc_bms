<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerProfileNote */

$this->title = 'Update Customer Profile Note: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer Profile Notes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-profile-note-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
