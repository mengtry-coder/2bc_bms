<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\DataOptionPhoneNumberCountryCode */

$this->title = 'Update Data Option Phone Number Country Code: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Data Option Phone Number Country Codes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="data-option-phone-number-country-code-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
