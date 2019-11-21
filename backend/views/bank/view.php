<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;


$this->title = $model->bank_name;
$this->params['breadcrumbs'][] = ['label' => 'Banks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bank-view">

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
    <div class="row">
        <div class="col-md-12">

            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
                    'bank_name',
                    'accountType.names',
                    'bank_address',
                    'account_name',
                    'account_number',
                    'remark:html',
                    [
                        'attribute' => 'userCreated.username',
                        'label' => 'Created By'
                    ],
                    [
                        'attribute' => 'created_date',
                    ],
                    [
                        'attribute' => 'userUpdated.username',
                        'label' => 'Updated By'
                    ],
                    [
                        'attribute' => 'updated_date',
                    ],

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
    </div>
</div>
<?php $this->registerJs("
    $(document).on('click','#modalButtonViewUpdate',function () {
        $('#modal').modal('show')
            .find('#modalContent')
            .load($(this).attr('value'));
    });
");
?>
