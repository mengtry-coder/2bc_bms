<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\MembershipDocument */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Membership Documents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="membership-document-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'id_membership_profile',
            'document_name',
            'document_type',
            'document_size',
            'uploaded_date',
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
