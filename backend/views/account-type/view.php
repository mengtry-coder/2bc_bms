<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\account-type */

$this->title = $model->names;
$this->params['breadcrumbs'][] = ['label' => 'Account Type', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="account-type-view">
    <div class="header-title">
        <div class="title">
            <h2><?= Html::encode($this->title) ?></h2>
        </div>
        <div class="pull-right">
                <?= Html::button('Update', ['id' =>'modalButtonUpdate' ,'class' => 'btn btn-primary', 'value' => Url::to(['update' , 'id' => $model->id])]) ?>
                <?= Html::a('Delete', ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Are you sure you want to delete this item?',
                        'method' => 'post',
                    ],
                ]) ?>
        </div>
    </div>

    <?= DetailView::widget([
        'model' => $model,
        'formatter' => [
        'class' => 'yii\i18n\Formatter',
        'nullDisplay' => '(None)',
        ],
        'attributes' => [
            'names',
            [
                'attribute'=>'parentAccount.names',
                'label'=>'Sub Account of Type'
            ],
            'detail_type',
            [
                'attribute'=>'userCreated.username',
                'label' => 'Created by'
            ],
            'created_date',
            [
                'attribute'=>'userUpdated.username',
                'label' => 'Updated by'
            ],
            'updated_date',
            [
                'attribute' => 'status',
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->status == 1) {
                        return '<span class="label label-info">Active</span>';
                    } else {
                        return '<span class="label label-warning">Inactive</span>';
                    }
                },
            ],
        ],
    ]) ?>

</div>
<script type="text/javascript">
    $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));

        });
</script>
