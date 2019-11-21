<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SupplierProfileType */

$this->title = 'Create Supplier Profile Type';
$this->params['breadcrumbs'][] = ['label' => 'Supplier Profile Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-profile-type-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
