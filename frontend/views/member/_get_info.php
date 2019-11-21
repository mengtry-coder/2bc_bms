<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = $model->folder_name;
$this->params['breadcrumbs'][] = ['label' => 'Folder', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="membership-document-get-info">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [ 
            'folder_name',
            'created_date',
            [
                'attribute' => 'createdBy.username',
                'label' => 'Created By'
            ], 
            'updated_date',
            [
                'attribute' => 'updatedBy.username',
                'label' => 'Updated By'
            ], 
        ],
    ]) ?>
 
</div>
 
