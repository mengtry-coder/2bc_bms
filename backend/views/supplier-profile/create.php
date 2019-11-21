<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierProfile */

$this->title = 'Create Supplier Profile';
$this->params['breadcrumbs'][] = ['label' => 'Supplier Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-profile-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
