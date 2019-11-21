<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\LeadProfile */

$this->title = 'Create Lead Profile';
$this->params['breadcrumbs'][] = ['label' => 'Lead Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lead-profile-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
