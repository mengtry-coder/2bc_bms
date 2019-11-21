<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = 'Rename Folder';
$this->params['breadcrumbs'][] = ['label' => 'Folder', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Rename';
?>
<div class="contract-rename-folder">
    <?= $this->render('_form_folder', [
        'model' => $model,
    ]) ?>
</div>
