<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\HrApprovalPermission */

$this->title = 'Create HR Approval Permission';
$this->params['breadcrumbs'][] = ['label' => 'HR Approval Permissions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="hr-approval-permission-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
