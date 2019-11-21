<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationProcedureSetUp */

$this->title = 'Create Standard Operation Procedure Set Up';
$this->params['breadcrumbs'][] = ['label' => 'Standard Operation Procedure Set Ups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="standard-operation-procedure-set-up-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
