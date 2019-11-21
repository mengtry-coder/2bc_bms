<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ProjectTimesheet */

$this->title = 'Update Project Timesheet: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Project Timesheets', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="project-timesheet-update">
    <?= $this->render('_form', [
        'model' => $model,
        'source_id'=>$source_id,
        'type'=>$type,
        'model_item' => $model_item
    ]) ?>
</div>
