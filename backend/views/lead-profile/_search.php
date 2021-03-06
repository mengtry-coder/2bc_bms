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
$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$search_content = "Lead Name, Company Name, City, Phone Number, Email";

$today = date('Y-m-d');

$monday = strtotime("last monday");
$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;
$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
$week_start = date("Y-m-d",$monday);
$week_end = date("Y-m-d",$sunday);

$day = date('Y-m-d');
$month_start = date('Y-m-01');
$month_end = date("Y-m-t", strtotime($day));

$year_start = date('Y-m-d', strtotime('01/01'));
$year_end = date('Y-m-d', strtotime('12/31'));

$date_template = '{label}</br><div class="input-group" style="margin-top: -7px;">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

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
<div class="lead-profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="row" style="margin-bottom:10px;">

        <div class="col-md-2"> 
            <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range','class'=>'form-control','style'=>'margin-top: 10px;'])->label(false) ?>
        </div>
        <div class="col-md-2"> 
            <?= $form->field($model, 'from_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?>
        </div>
        <div class="col-md-2"> 
            <?= $form->field($model, 'to_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?>
        </div>    
        <div class="col-md-2"> 
            <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control popover_content',  "data-html"=>true, "data-original-title"=>"Filter likes:", 'data-content'=>$search_content, "data-placement"=>"bottom", "data-trigger"=>"hover", 'placeholder'=>'Search...', 'style'=>'margin-top: 10px;'])->label(false) ?>
        </div>

        <div class="col-md-4">
            <div class="pull-right" style="margin-top: 10px;">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search"></i>
                </button> 
                <a data-target="#demo-default-modal" data-toggle="modal" class="btn btn-mint btn-rounded" id="modalButtonImport" value="<?= Url::toRoute(['lead-profile/import-csv']) ?>">Import CSV <i class="demo-psi-file-csv go-right"></i>
                </a> 
                <a data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['lead-profile/create']) ?>">Add New <i class="fa fa-plus-square go-right"></i>
                </a>  
            </div>
        </div>

    </div>
    
    <?php ActiveForm::end(); ?>

</div>
<?php

$script = <<<JS

    $('#leadprofilesearch-from_date, #leadprofilesearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#leadprofilesearch-from_date").change(function(){

        $('#leadprofilesearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#leadprofilesearch-to_date').val())){
            $('#leadprofilesearch-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#leadprofilesearch-from_date,#leadprofilesearch-to_date").change(function(){
        $('#leadprofilesearch-date_range').val('custom').trigger('change');
    });

    $("#leadprofilesearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#leadprofilesearch-from_date").val("$today");
            $("#leadprofilesearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#leadprofilesearch-from_date").val("$week_start");
            $("#leadprofilesearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#leadprofilesearch-from_date").val("$month_start");
            $("#leadprofilesearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#leadprofilesearch-from_date").val("$year_start");
            $("#leadprofilesearch-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>