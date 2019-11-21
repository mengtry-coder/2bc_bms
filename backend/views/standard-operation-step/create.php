<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationStep */

$this->title = 'Create Standard Operation Step';
$this->params['breadcrumbs'][] = ['label' => 'Standard Operation Steps', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="standard-operation-step-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
