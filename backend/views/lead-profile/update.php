<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeadProfile */

$this->title = 'Update Lead Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Lead Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="lead-profile-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
