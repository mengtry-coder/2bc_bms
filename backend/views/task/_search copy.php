<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 

$department = ArrayHelper::map(\backend\models\Department::find()
    ->all(), 'id', 'name');

$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['id_department' => $model->department])
    ->all(), 'id', 'position_type');

$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
$id_customer_profile = $request->get('id_customer_profile',0);
$id_lead_profile = $request->get('id_lead_profile',0);
$id_contract = $request->get('id_contract',0);
if($id_employee_profile !=0 || $id_customer_profile !=0 || $id_contract !=0 || $id_lead_profile !=0){
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

/*End Search Form Button*/
</style>
<div class="task-search">
    <?php $form = ActiveForm::begin([
        'action' => ['index','id_employee_profile'=>$id_employee_profile,'id_customer_profile'=>$id_customer_profile,'id_lead_profile'=>$id_lead_profile,'id_contract'=>$id_contract,'smMenu'=>$smMenu],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'department')->dropDownList($department, ['prompt'=>'Select Department', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-3"> 
                    <?= $form->field($model, 'position')->dropDownList($position, ['prompt'=>'Select Position', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-3"> 
                    <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                </div>
                <div class="col-md-3"> 
                    <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                </div>
                <div class="col-md-3"> 
                    <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                </div>
            </div> 
        </div>
        <div class="col-md-4" style="margin-top: 10px;">
            <div class="pull-right">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>
                <button class="btn btn-mint btn-rounded" style="margin-left: 5px;" id="switch_to_milestone">
                Switch to milestone
                <i class="fa fa-history go-right"></i>
                </button> 
                <button type="button" data-title="New Task" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['create', 'source_id'=>0,'type'=>0]) ?>"> Add New <i class="fa fa-plus-square go-right"></i>
                </button> 
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php 

$base_url = Yii::getAlias('@web'); 

$script = <<<JS

    var base_url = "$base_url";

    $("#tasksearch-department").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/task/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_position'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option>Select Position</option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.position_type+'</option>';
                });
                $('#tasksearch-position').html(str);
            }
        });

    });

JS;

$this->registerJs($script);
?>