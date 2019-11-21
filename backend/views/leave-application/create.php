<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveApplication */

$this->title = 'Create Leave Application';
$this->params['breadcrumbs'][] = ['label' => 'Leave Applications', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-application-create">
    <?= $this->render('_form', [
        'model' => $model,
        'is_approval' => $is_approval
    ]) ?>
</div>
