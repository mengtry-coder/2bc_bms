<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerProfileContact */

$this->title = 'Update Customer Profile Contact: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer Profile Contacts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer-profile-contact-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
