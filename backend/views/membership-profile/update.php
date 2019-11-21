<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipProfile */

$this->title = 'Update Membership Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="membership-profile-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
