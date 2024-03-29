<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\UserType */

$this->title = 'Update User Type: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'User Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="user-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
