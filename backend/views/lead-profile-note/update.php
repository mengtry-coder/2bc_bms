<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeadProfileNote */

$this->title = 'Update Lead Profile Note: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Lead Profile Notes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="lead-profile-note-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
