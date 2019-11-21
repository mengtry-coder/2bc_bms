<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = 'Update Membership Document: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Documents', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="membership-document-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
