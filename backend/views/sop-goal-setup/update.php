<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SopGoalSetup */

$this->title = 'Update Sop Goal Setup: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Sop Goal Setups', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="sop-goal-setup-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
    ]) ?>
</div>
