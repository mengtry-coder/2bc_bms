<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerProfileNote */

$this->title = 'Create Customer Profile Note';
$this->params['breadcrumbs'][] = ['label' => 'Customer Profile Notes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-profile-note-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
