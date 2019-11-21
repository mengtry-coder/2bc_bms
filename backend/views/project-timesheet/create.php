<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ProjectTimesheet */

$this->title = 'Create Project Timesheet';
$this->params['breadcrumbs'][] = ['label' => 'Project Timesheets', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-timesheet-create">
    <?= $this->render('_form', [
        'model' => $model,
        'source_id'=>$source_id,
        'type'=>$type
    ]) ?>
</div>
