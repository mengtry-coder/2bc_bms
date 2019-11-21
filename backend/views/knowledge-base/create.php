<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\KnowledgeBase */

$this->title = 'Create Knowledge Base';
$this->params['breadcrumbs'][] = ['label' => 'Knowledge Bases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="knowledge-base-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
