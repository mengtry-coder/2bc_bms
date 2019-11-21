<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\KnowledgeBase */

$this->title = 'Update Knowledge Base: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Knowledge Bases', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="knowledge-base-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
