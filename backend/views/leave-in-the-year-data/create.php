<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeaveInTheYearData */

$this->title = 'Create Leave In The Year Data';
$this->params['breadcrumbs'][] = ['label' => 'Leave In The Year Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="leave-in-the-year-data-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
