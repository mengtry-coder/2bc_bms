<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\BudgetSetupValue */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Budget Setup Values', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="budget-setup-value-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'id_budget_set_up',
            'for_month',
            'daily_budget',
            'weekly_budget',
            'monthly_budget',
            'created_by',
            'created_date',
            'updated_by',
            'updated_date',
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
