<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bank */

$this->title = 'Update Bank: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Banks', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="bank-update">

   

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
