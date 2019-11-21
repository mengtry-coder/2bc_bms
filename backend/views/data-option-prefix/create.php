<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\DataOptionPrefix */

$this->title = 'Create Data Option Prefix';
$this->params['breadcrumbs'][] = ['label' => 'Data Option Prefixes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="data-option-prefix-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
