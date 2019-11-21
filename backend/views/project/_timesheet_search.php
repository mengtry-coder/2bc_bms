<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
?>


<style>
    /*Search Form Button*/
button:focus {
    box-shadow: none !important;
    outline: none !important;
}
.search-button{
    display: block;
    width: 95px;
    padding: 4px;
    border: 1px solid #333;
    border-radius: 2px;
}
.button-hover-search{
    background: #337ab7;
    border: 1px solid #337ab7;
    color: #fff;
    display: inline-block;
}
.button-hover-add_new{
    background: #ef6200;
    border: 1px solid #ef6200;
    color: #fff;
    display: inline-block;
}
.button-hover-search:hover{
    background: #3c6d98;
    border: 1px solid #3c6d98;
    color: #fff;
}
.button-hover-add_new:hover{
    background: #f17f2f;
    border: 1px solid #f17f2f;
    color: #fff;
}
.search-button .search-main-button{
    background: transparent;
    padding: 5px;
    color: #333;
    border: 1px solid;
    cursor: pointer;
    font-size: 13px;
    border-radius: 0px 5px 0px 0px;
    width: 100% !important;
}
.search-button .fa {
    font-size: 1em;
    line-height: 20px;
}

/*End Search Form Button*/
</style>
<div class="form-inline">

    <?php $form = ActiveForm::begin([
        'action' => ['timesheet', 'id_project'=> $_GET['id_project']],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="pull-right">

                <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>

                <button type="button" data-title="Timesheet" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButtonInvoice" value="<?= Url::toRoute(['project-timesheet/create','source_id'=>$_GET['id_project'], 'type'=>1]) ?>"> Add New <i class="fa fa-plus-square go-right"></i>
                </button> 
                
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
