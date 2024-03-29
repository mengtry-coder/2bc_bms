<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
if($id_employee_profile !=0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}
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

.button-hover-print {
    background-color: #039BE5 !important;
    color: #fff !important;
    border-color: #039BE5 !important;
    display: inline-block;
    width: 50px !important;
    padding: 5px 5px;
}
.button-hover-print:hover{
    background: #f17f2f;
    border: 1px solid #f17f2f;
    color: #fff;
}

/*End Search Form Button*/
</style>
<div class="form-inline">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id'=> 'chart_account_search'
    ]); ?>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="pull-right">

                <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>

                <button type="button" data-title="New Chart of Account" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['create']) ?>"> Add New <i class="fa fa-plus-square go-right"></i>
                </button> 

                <button class="btn btn-info btn-rounded" id="btn_print" type="button" style="margin-left: 5px;">
                   <i class="fa fa-print" style="font-size: large;"></i>
                </button>
                
            </div>
            <div hidden="hidden">
                <?php
                    $type = "btn";
                ?>
                <input type="text" name="btn_doc" hidden="hidden" value = "<?=$type?>">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
