<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipProfile */

$this->title = 'Create Membership Profile';
$this->params['breadcrumbs'][] = ['label' => 'Membership Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="membership-profile-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
