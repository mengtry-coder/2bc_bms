<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\LeadProfile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Lead Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="lead-profile-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'lead_name',
            'company_name',
            'phone_number',
            'email_address:email',
            'latitute',
            'longitute',
            'address',
            'id_country',
            'id_city',
            'group_names',
            'billing_address',
            'id_billing_city',
            'id_billing_country',
            'shipping_address',
            'id_shipping_city',
            'id_shipping_country',
            'status',
            'created_by',
            'created_date',
            'img_url:url',
            'updated_date',
            'updated_by',
            'zip_code',
            'customer_status',
            'assigned_to',
            'id_source',
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
