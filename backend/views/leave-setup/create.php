<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveSetup */

$this->title = 'Create Leave Setup';
$this->params['breadcrumbs'][] = ['label' => 'Leave Setups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-setup-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
