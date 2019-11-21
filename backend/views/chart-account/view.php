<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\chart-account */

$this->title = $model->names;
$this->params['breadcrumbs'][] = ['label' => 'Chart Account', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="chart-account-view">
    <div class="header-title">
        <div class="title">
            <h2><?= Html::encode($this->title) ?></h2>
        </div>
        <div class="pull-right">
                <?= Html::button('Update', ['id' =>'modalButtonViewUpdate' ,'class' => 'btn btn-primary', 'value' => Url::to(['update' , 'id' => $model->id])]) ?>
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
                'attribute'=>'parentChartAccount.names',
                'label'=>'Sub Chart of Account'
            ],
            [
                'attribute'=>'accountType.names',
                'label'=>'Account Type'
            ],
            [
                'attribute'=>'parentAccountType.names',
                'label'=>'Sub Account Type'
            ],
            [
                'attribute'=>'bank.bank_name',
                'label' => 'Bank'
            ],
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
        ],
    ]) ?>

</div>
<script type="text/javascript">
    $(document).on("click","#modalButtonViewUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));

        });
</script>
