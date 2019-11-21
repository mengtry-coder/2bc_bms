<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = 'New Folder';
$this->params['breadcrumbs'][] = ['label' => 'New Folder', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lead-profile-create-folder">
    <?= $this->render('_form_folder', [
        'model' => $model,
    ]) ?>
</div>
