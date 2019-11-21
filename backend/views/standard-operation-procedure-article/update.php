<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationProcedureArticle */

$this->title = 'Update Standard Operation Procedure Article: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Standard Operation Procedure Articles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="standard-operation-procedure-article-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
