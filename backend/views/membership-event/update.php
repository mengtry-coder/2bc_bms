<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipEvent */

$this->title = 'Update Membership Event: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="membership-event-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
