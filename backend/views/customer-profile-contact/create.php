<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerProfileContact */

$this->title = 'Create Customer Profile Contact';
$this->params['breadcrumbs'][] = ['label' => 'Customer Profile Contacts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-profile-contact-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
