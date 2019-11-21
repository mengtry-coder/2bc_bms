<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ChartAccount */

$this->title = 'Create Chart Account';
$this->params['breadcrumbs'][] = ['label' => 'Chart Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="chart-account-create">



    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
