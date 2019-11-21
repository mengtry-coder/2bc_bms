<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveSetup */

$this->title = 'Update Leave Setup: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Leave Setups', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="leave-setup-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_data' => $model_data
    ]) ?>
</div>
