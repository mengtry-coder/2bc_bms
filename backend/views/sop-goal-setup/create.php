<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SopGoalSetup */

$this->title = 'Create Sop Goal Setup';
$this->params['breadcrumbs'][] = ['label' => 'Sop Goal Setups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sop-goal-setup-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
