<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeProfile */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Employee Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="employee-profile-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [ 
            'id_prefix',
            'first_name',
            'last_name',
            'date_of_birth',
            'place_of_birth',
            'sex',
            'nationality',
            'address',
            'id_country',
            'id_city',
            'marital_status',
            'phone_number',
            'email:email',
            'id_position',
            'username',
            'password',
            'confirm_password',
            'description',
            'created_date',
            'created_by',
            'updated_date',
            'updated_by',
            'status',
            'img_url:url',
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