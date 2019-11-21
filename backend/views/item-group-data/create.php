<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroupData */

$this->title = 'Create Item Group Data';
$this->params['breadcrumbs'][] = ['label' => 'Item Group Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-group-data-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
