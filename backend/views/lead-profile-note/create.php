<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeadProfileNote */

$this->title = 'Create Lead Profile Note';
$this->params['breadcrumbs'][] = ['label' => 'Lead Profile Notes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lead-profile-note-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
