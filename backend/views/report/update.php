<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CompanyProfile */

$this->title = 'Update Company Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Company Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id, 'names' => $model->names]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="company-profile-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
