<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipEvent */

$this->title = 'Create Membership Event';
$this->params['breadcrumbs'][] = ['label' => 'Membership Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="membership-event-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
