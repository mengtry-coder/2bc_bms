<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemGroupType */

$this->title = 'Create Item Group Type';
$this->params['breadcrumbs'][] = ['label' => 'Item Group Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-group-type-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
