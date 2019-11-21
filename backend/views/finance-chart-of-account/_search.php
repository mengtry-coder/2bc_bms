<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\AccountType; 
use backend\models\ChartAccount; 
use yii\helpers\Url;

    $base_url =  Yii::getAlias('@web');

    $date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];
 
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

    $chart_of_account = [];
    
    if (!empty($model->account_type)){
        $sql = "SELECT * FROM chart_account WHERE id_is_parent = $model->account_type AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_is_parent = $model->account_type)";
        $chart_of_account = Yii::$app->db->createCommand($sql)->queryAll();
        $chart_of_account = ArrayHelper::map($chart_of_account, 'id', 'names');
    }

    $account_type_slq = "    
        SELECT  acct.`names` as `names`,
                fca.account_type as id
        FROM finance_chart_of_account fca
        INNER JOIN account_type acct on acct.id = fca.account_type
        GROUP BY account_type
        ORDER BY acct.`names` ASC
    ";
    $account_type = Yii::$app->db->createCommand($account_type_slq)->queryAll();
    $account_type = ArrayHelper::map($account_type, 'id', 'names');
if ($model->account_type =='') {
     $account_type_id = 0;
}else{
    $account_type_id = $model->account_type;
   
}
 
    $sql = "
        SELECT CONCAT(coalesce(chart_account.number_code,''),' ',chart_account.`names`) as `names`,
            chart_account.id as id
        FROM finance_chart_of_account
        INNER JOIN chart_account on chart_account.id = finance_chart_of_account.chart_of_account
        WHERE finance_chart_of_account.account_type =  $account_type_id
        GROUP BY finance_chart_of_account.chart_of_account
        ORDER BY chart_account.number_code ASC
        ";
    $chart_of_account = Yii::$app->db->createCommand($sql)->queryAll();
    $chart_of_account = ArrayHelper::map($chart_of_account, 'id', 'names');

    $transaction_type_sql = "
        SELECT transaction_type as names
        FROM finance_chart_of_account
        GROUP BY transaction_type
    ";
    $transaction_type = Yii::$app->db->createCommand($transaction_type_sql)->queryAll();
    $transaction_type = ArrayHelper::map($transaction_type,'names','names');

    $customer_data =Yii::$app->db->createCommand("
    SELECT customer_profile.id as id, CONCAT(customer_profile.customer_name,' (', customer_profile.company_name, ')') as `names` 
    FROM customer_profile
    ORDER BY `names`")->queryAll();

$customer = ArrayHelper::map($customer_data,'id','names');

$date_template = '{label}</br><div class="input-group" style="margin-top: -7px; max-width: 140px;">
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
<div class="finance-chart-of-account-search">
    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'chart_account'
    ]); ?>

     
    <div class="row" style="margin-bottom: 10px;">
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-4">
                    <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
                </div>
                <div class="col-md-4">
                    <?= $form->field($model, 'from_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date*', 'readonly'=>true])->label(false) ?>
                </div>
                <div class="col-md-4">
                    <?= $form->field($model, 'to_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date*', 'readonly'=>true])->label(false) ?>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'account_type')->dropDownList($account_type, ['prompt'=>'All', 'class'=>'form-control popover_content', "data-html"=>true, 'data-content'=>'Account Type', "data-placement"=>"bottom", "data-trigger"=>"hover","style"=>"margin-top:10px;"])->label(false) ?> 
        </div>
        
        <div class="col-md-1" style="margin-top: 10px;">
            <div class="btn-group dropdown" style="opacity: 1;">
                <button class="btn btn-default dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button" aria-pressed="false" aria-expanded="true">
                    More condition <i class="dropdown-caret"></i>
                </button>
                <div class="pad-all dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <div class="row"> 
                        <div class="col-md-12">
                            <?= $form->field($model, 'chart_of_account')->dropDownList($chart_of_account, ['prompt'=>'All'])?> 
                        </div>   
                        <div class="col-md-12">   
                            <?= $form->field($model, 'transaction_type')->dropDownList($transaction_type, ['prompt'=>'All'])?> 
                        </div>
                        <div class="col-md-12">
                            <?= $form->field($model, 'name')->dropDownList($customer, ['prompt'=>'All'])?> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3"> 
            <div class="text-right" style="padding: 10px;">  
                <!-- <button type="button" id="btn_excel" class="btn btn-info btn-rounded">
                    <i class="fa fa-file-excel-o" style="font-size: large;"></i>
                </button>  -->
                <!-- <button type="button" id="btn_pdf" class="btn btn-danger btn-rounded">
                    <i class="fa fa-file-pdf-o" style="font-size: large;"></i>
                </button> -->
                <!-- <div hidden="hidden">
                    <?php
                        $is_print = 0; 
                    ?>
                    <input type="text" name="is_print" id="is_print" hidden="hidden" value = "<?=$is_print?>">
                </div> 
                <button type="button" id="btn_print" class="btn btn-warning btn-rounded">
                    <i class="fa fa-print" style="font-size: large;"></i>
                </button>  -->
                <button type="submit" class="btn btn-success btn-rounded" id="btn_search"> Search <i class="fa fa-search go-right"></i>
                </button>  
            </div> 
        </div>
    </div> 

    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS
base_url = "$base_url";
//====== Start Catch date by date range ======//

    $('#financechartofaccountsearch-from_date, #financechartofaccountsearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#financechartofaccountsearch-from_date").change(function(){

        $('#financechartofaccountsearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#financechartofaccountsearch-to_date').val())){
            $('#financechartofaccountsearch-to_date').datepicker('setDate', $(this).val());
        }

    });

    
    $("#financechartofaccountsearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#financechartofaccountsearch-from_date").val("$today");
            $("#financechartofaccountsearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#financechartofaccountsearch-from_date").val("$week_start");
            $("#financechartofaccountsearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#financechartofaccountsearch-from_date").val("$month_start");
            $("#financechartofaccountsearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#financechartofaccountsearch-from_date").val("$year_start");
            $("#financechartofaccountsearch-to_date").val("$year_end");
        }else {
            $("#financechartofaccountsearch-from_date").val("");
            $("#financechartofaccountsearch-to_date").val("");
        }
    });
//====== End date by date range ======//

    $('#financechartofaccountsearch-account_type').change(function(){
      var id = $(this).val();
      $.ajax({
          url: base_url+'/finance-chart-of-account/depend',
          type: 'post',
          data: {
              id: id,
              action: 'get_chart_account'
          },
          success: function(response){
                var data = JSON.parse(response);
              var str = '<option value="">All</option>';
              $.each(data,function(key,value){
                  str = str + '<option value="'+value.id+'">'+value.names+'</option>';
              });
              $('#financechartofaccountsearch-chart_of_account').html(str);
          }
      });

    });

    $('.popover_content').popover();

    $('.dropdown-menu').on('click', function(event) {
        event.stopPropagation();
    });
JS;

$this->registerJs($script);

?>

