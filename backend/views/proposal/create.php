<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Proposal */

$this->title = 'Create Proposal';
$this->params['breadcrumbs'][] = ['label' => 'Proposals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="proposal-create">
    <?= $this->render('_form', [
        'model' => $model, 
    ]) ?>
</div>
