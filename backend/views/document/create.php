<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = 'Create Membership Document';
$this->params['breadcrumbs'][] = ['label' => 'Membership Documents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="membership-document-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
