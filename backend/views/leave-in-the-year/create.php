<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYear */

$this->title = 'Create Leave In The Year';
$this->params['breadcrumbs'][] = ['label' => 'Leave In The Years', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-in-the-year-create">
    <?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
    ]) ?>
</div>
