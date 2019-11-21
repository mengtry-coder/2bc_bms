<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerProfile */

$this->title = 'Create Customer Profile';
$this->params['breadcrumbs'][] = ['label' => 'Customer Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-profile-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
