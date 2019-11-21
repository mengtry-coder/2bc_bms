<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Country */

$this->title = 'Update Country: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Countries', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="country-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
