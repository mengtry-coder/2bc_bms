<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\StandardOperationProcedureArticle */

$this->title = 'Create Standard Operation Procedure Article';
$this->params['breadcrumbs'][] = ['label' => 'Standard Operation Procedure Articles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="standard-operation-procedure-article-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
