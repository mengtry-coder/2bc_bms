<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperation */

$this->title = 'Create Standard Operation';
$this->params['breadcrumbs'][] = ['label' => 'Standard Operations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="standard-operation-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
