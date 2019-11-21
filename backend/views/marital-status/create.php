<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MaritalStatus */

$this->title = 'Create Marital Status';
$this->params['breadcrumbs'][] = ['label' => 'Marital Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="marital-status-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
