<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EventList */

$this->title = 'Update Participation: Name';
$this->params['breadcrumbs'][] = ['label' => 'Event Lists', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="participation-update">
    <?= $this->render('_form_participation', [
        'model' => $model,
    ]) ?>
</div>
