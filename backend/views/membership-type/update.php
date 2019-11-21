<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipType */

$this->title = 'Update Membership Type: ' . $model->membership_type;
$this->params['breadcrumbs'][] = ['label' => 'Membership Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
$this->params['breadcrumbs'][] = ['label' => $model->membership_type, 'url' => ['view', 'id' => $model->id]];
?>
<div class="membership-type-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?> 
</div>
