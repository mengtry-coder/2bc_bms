<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\WorkingGroup */

$this->title = 'Create Working Group';
$this->params['breadcrumbs'][] = ['label' => 'Working Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="working-group-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
