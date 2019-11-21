<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\DataOptionPhoneNumberCountryCode */

$this->title = 'Create Phone Number Country Code';
$this->params['breadcrumbs'][] = ['label' => 'Phone Number Country Codes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="data-option-phone-number-country-code-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
