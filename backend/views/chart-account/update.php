<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ChartAccount */

$this->title = 'Update Chart Account: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Chart Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="chart-account-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
