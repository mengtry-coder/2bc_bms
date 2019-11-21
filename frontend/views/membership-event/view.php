<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipEvent */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="membership-event-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [ 
            'id_membership_profile',
            'id_event_list',
            'number_of_audient',
            'address',
            'address_line_2',
            'id_country',
            'id_city',
            'id_province',
            'postal_code',
            'prefix_phone_code',
            'phone_number',
            'prefix_phone_code_line_2',
            'phone_number_line_2',
            'email:email',
            'description',
            'created_date',
            'created_by',
            'updated_date',
            'updated_by',
            'status',
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
