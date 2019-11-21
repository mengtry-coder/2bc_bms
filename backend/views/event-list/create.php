<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\EventList */

$this->title = 'Create Event List';
$this->params['breadcrumbs'][] = ['label' => 'Event Lists', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-list-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
