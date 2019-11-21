<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipType */

$this->title = 'Create Membership Type';
$this->params['breadcrumbs'][] = ['label' => 'Membership Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="membership-type-create"> 
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?> 
</div>
