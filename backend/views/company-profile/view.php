<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\CompanyProfile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Company Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="company-profile-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'logo',
            'names',
            'email:email',
            'tel',
            'website',
            'address',
            'description:ntext',
            'created_date',
            'created_by',
            'updated_date',
            'quotation_term_and_condition:ntext',
            'updated_by',
            'status',
            'vattin',
            'bill_and_payment:ntext',
            'what_we_do:ntext',
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
