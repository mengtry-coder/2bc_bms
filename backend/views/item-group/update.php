<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroup */

$this->title = 'Update Item Group: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Item Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="item-group-update">
    <?= $this->render('_form', [
        'model' => $model,
        'model_feature' => $model_feature
    ]) ?>
</div>
