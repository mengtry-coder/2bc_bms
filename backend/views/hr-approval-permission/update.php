<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\HrApprovalPermission */

$this->title = 'Update HR Approval Permission: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'HR Approval Permissions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="hr-approval-permission-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
