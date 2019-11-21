<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipEvent */
// @$id_event_list = $_GET['id_event_list'];
$this->title = 'Add Participation';
$this->params['breadcrumbs'][] = ['label' => 'Add Participation', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-list-create-participation">
    <?= $this->render('_form_participation', [
        'model' => $model,
        // 'id_event_list' => $id_event_list,
    ]) ?>
</div>
