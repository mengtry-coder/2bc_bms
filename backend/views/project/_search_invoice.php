<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\select2\Select2; 
$request = Yii::$app->request;
$id_customer_profile = $request->get('id_customer_profile',0);
if($id_customer_profile !=0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}
$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$search_content = "Invoice Number, Customer, Project, Amount";

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
        'action' => ['sale', 'id_project'=> $_GET['id_project']],
        'method' => 'get',
    ]); ?>

    <div class="row text-right">
        <div class="col-md-12 text-right">
            <?php /* $form->field($model, 'date_range')->widget(Select2::classname(), [
                'data' => $date_range,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Select Range'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false); */ ?>  

            <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>  
        
            <?= $form->field($model, 'from_date')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px; background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?> 
      
            <?= $form->field($model, 'to_date')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px; background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?> 
        
            <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right popover_content',  "data-html"=>true, "data-original-title"=>"Filter likes:", 'data-content'=>$search_content, "data-placement"=>"bottom", "data-trigger"=>"hover", 'style'=>'margin-top: -1px;', 'placeholder'=>'Search...'])->label(false) ?> 
            
            <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                Search <i class="fa fa-search go-right"></i>
            </button>

            <button type="button" data-title="New Invoice" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButtonInvoice" value="<?= Url::toRoute(['customer-invoice/create', 'project_id'=>$_GET['id_project']]) ?>"> New Invoice <i class="fa fa-plus-square go-right"></i>
            </button> 
                
        </div>
    </div>
    <!-- <div class="clearfix"></div> -->

    <?php ActiveForm::end(); ?>

</div>

<?php 

$script = <<<JS

    $('#customerinvoicesearch-from_date, #customerinvoicesearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#customerinvoicesearch-from_date").change(function(){

        $('#customerinvoicesearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#customerinvoicesearch-to_date').val())){
            $('#customerinvoicesearch-to_date').datepicker('setDate', $(this).val());
        }

    });
    
    $("#customerinvoicesearch-from_date,#customerinvoicesearch-to_date").change(function(){
        $('#customerinvoicesearch-date_range').val('custom').trigger('change');   
    });
    
    $("#customerinvoicesearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#customerinvoicesearch-from_date").val("$today");
            $("#customerinvoicesearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#customerinvoicesearch-from_date").val("$week_start");
            $("#customerinvoicesearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#customerinvoicesearch-from_date").val("$month_start");
            $("#customerinvoicesearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#customerinvoicesearch-from_date").val("$year_start");
            $("#customerinvoicesearch-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>
