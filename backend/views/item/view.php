<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\Item */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="item-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'description',
            'long_description',
            'rate',
            'id_tax',
            'id_group',
            'unit',
            'status',
            'updated_by',
            'updated_date',
            'created_by',
            'created_date',
        ],
    ]) ?>

    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <?= Html::button('Update', ['id' =>'modalButtonUpdate' ,'class' => 'btn btn-primary btn-rounded', 'value' => Url::to(['update' , 'id' => $model->id])]) ?>
            
            </div>
        </div>
    </div> 
</div>
<script type="text/javascript">
    $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));

        });
</script>
