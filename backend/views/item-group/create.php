<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroup */

$this->title = 'Create Item Group';
$this->params['breadcrumbs'][] = ['label' => 'Item Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-group-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
