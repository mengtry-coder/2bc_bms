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

$date_type = ['start_date' => 'Start Date', 'end_date' => 'End Date','created_date'=>'Created Date'];

$search_content = "Bank Info, Customer Info, Item Info, Contract Type";

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

<div class="contract-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index','id_customer_profile'=>$id_customer_profile,'smMenu'=>$smMenu],
        'method' => 'get',
    ]); ?>
 
    <div class="row" style="margin-bottom:10px;">
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'date_type')->dropDownList($date_type, ['style'=>'margin-top: 10px;','class'=>'form-control','prompt'=>'Select Date Type'])->label(false) ?>
                </div>
                <div class="col-md-2"> 
                    <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range','class'=>'form-control','style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-2"> 
                    <?= $form->field($model, 'from_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?>
                </div>
                <div class="col-md-2"> 
                    <?= $form->field($model, 'to_date', ['template'=>$date_template])->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?>
                </div>    
                <div class="col-md-3"> 
                    <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control popover_content',  "data-html"=>true, "data-original-title"=>"Filter likes:", 'data-content'=>$search_content, "data-placement"=>"bottom", "data-trigger"=>"hover", 'placeholder'=>'Search...', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
            </div>
        </div> 
        <div class="col-md-3">
            <div class="pull-right" style="margin-top: 10px;">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>

                <button type="button" data-title="New Contract" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['create']) ?>"> New Contract <i class="fa fa-plus-square go-right"></i> 
                </button>
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php

$script = <<<JS

    $('#contractsearch-from_date, #contractsearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#contractsearch-from_date").change(function(){

        $('#contractsearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#contractsearch-to_date').val())){
            $('#contractsearch-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#contractsearch-from_date,#contractsearch-to_date").change(function(){
        $('#customerinvoicesearch-date_range').val('custom').trigger('change');
    });

    $("#contractsearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#contractsearch-from_date").val("$today");
            $("#contractsearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#contractsearch-from_date").val("$week_start");
            $("#contractsearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#contractsearch-from_date").val("$month_start");
            $("#contractsearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#contractsearch-from_date").val("$year_start");
            $("#contractsearch-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>
