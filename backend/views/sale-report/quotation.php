<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use yii\helpers\Url;

$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();

$controllerName = Yii::$app->controller->id;
$actionName = Yii::$app->controller->action->id;  
$string = str_replace("-", " ", $actionName);
$this->title = 'Sale Report'." ".$string;
$this->params['breadcrumbs'][] = $this->title;

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


$customer = ArrayHelper::map(\backend\models\CustomerProfile::find()
    ->all(),'id', function($model)
    {
        return $model->customer_name . ' ('.$model->company_name . ')';
    });
    
?>
<style>
.panel-eo {
    border-color: #f87232;
}
.breadcrumb>.active{
    text-transform: capitalize;
}  
.field-salereport-id_customer{
    margin-top: 10px;
}
@media print 
    {
        @page {
          size: A4; /* DIN A4 standard, Europe */
          margin:0;
        }
        html, body {
            width: 210mm;
            /* height: 297mm; */
            height: 282mm;
            font-size: 11px;
            background: #FFF;
            overflow:visible;
            color: black !important;
        }
        
        #content-container {
            padding-top: 0px;
        }
    }
#print-content {
    color: black !important;
}
#print-content a[href]:after { display:none; } 
.fullscreen{
    overflow: scroll;
}
</style> 
<div class="quotation-form">
    <div class="report">
        <?php $form = ActiveForm::begin([
                'action' => ['quotation','smMenu'=>1],
                'method' => 'post',
                'id' => 'idQuotation',
        ]); ?>
        <div class="row no-print">
            <div class="col-md-12">
                <div class="panel panel-body" style="padding: 8px 20px 2px;"> 
                    <div class="row"> 
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
                            <?= $form->field($model, 'id_customer')->widget(Select2::classname(), [
                                'data' => $customer,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg', 
                                'options' => ['placeholder' => 'Customer'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])->label(false); ?>
                        </div> 
                        <div class="col-md-4"> 
                            <div class="text-right" style="padding: 10px;">  
                                <button type="button" id="btn_excel" class="btn btn-info btn-rounded">
                                    <i class="fa fa-file-excel-o" style="font-size: large;"></i>
                                </button> 
                                <!-- <button type="button" id="btn_pdf" class="btn btn-danger btn-rounded">
                                    <i class="fa fa-file-pdf-o" style="font-size: large;"></i>
                                </button> -->
                                <div hidden="hidden">
                                    <?php
                                        $is_print = 0; 
                                    ?>
                                    <input type="text" name="is_print" id="is_print" hidden="hidden" value = "<?=$is_print?>">
                                </div> 
                                <button type="button" id="btn_print" class="btn btn-warning btn-rounded">
                                    <i class="fa fa-print" style="font-size: large;"></i>
                                </button> 
                                <button type="submit" class="btn btn-success btn-rounded" id="btn_search"> Search <i class="fa fa-search go-right"></i>
                                </button>  
                            </div> 
                        </div>
                    </div>  
                </div>
            </div>
        </div>
        <?php ActiveForm::end(); ?>

        <div class="row"> 
            <div class="col-md-2 col-sm-3 no-print">
                <?= $this->render("//sale-report/_sale_report_menu");?>
            </div>
            <div class="col-md-10 col-sm-9"> 
                <div class="panel">
                    <div class="panel-heading panel-eo no-print">
                        <div class="panel-control">
                            <button class="btn btn-default" data-panel="fullscreen">
                                <i class="icon-max demo-psi-maximize-3"></i>
                                <i class="icon-min demo-psi-minimize-3"></i>
                            </button>
                        </div>
                        <h3 class="panel-title" style="font-weight: 500; text-transform: capitalize;"><?=$this->title;?></h3>
                    </div>

                    <div class="panel-body" id="print-content"> 
                    <!-- <div class="text-2x text-center">Craig's Design and Landscaping Services</div> -->
                    <div class="text-2x text-center">SALE REPORT by QUOTATION</div>
                    <?php 
                        if($invoiceData == "" || count($invoiceData) <= 0){
                            if($model->from_date !=""){
                                echo '<div class="text-lg text-center">From '.$model->from_date.' To '.$model->to_date.'</div>';
                                echo "<br><div class='text-lg text-center' style='color: #f87233;'>This report does not contain any data.</div>";
                            }else{
                                echo "<br><div class='text-lg text-center text-info'>Please, Complete <span class='text-danger'>required*</span> field(s) to search.</div>";
                            }
                            
                        }else{
                    ?>
                    <div class="text-lg text-center">From <?= $model->from_date;?> To <?= $model->to_date;?></div>
                    <br> 
                    
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Code</th>
                                    <th>Customer</th>  
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Open Till</th>
                                    <th class="text-center">Is Converted</th> 
                                    <th class="text-center">Status</th> 
                                    <th class="text-right">Total</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <?php  
                                    $total = 0; 
                                    $rang_no = 1;
                                    foreach($invoiceData as $key => $value){
                                        $total += $value['total']; 
                                ?>  
                                <tr>
                                    <td><?=$rang_no++;?></td>
                                    <td><a target="_blank" href="<?=URL::toRoute(['quotation/overview','id'=>$value['id'], 'smMenu'=>1])?>" class="text-info" ><?=$value['code'];?></a></td>
                                    <td><a target="_blank" href="<?=URL::toRoute(['customer-profile/profile','id'=>$value['id_customer'], 'smMenu'=>1])?>" class="text-info" ><?=$value['customer_name'];?></a></td>
                                   
                                    <td class="text-center"><?=$value['date'];?></td>
                                    <td class="text-center"><?=$value['open_till'];?></td>
                                    <td class="text-center"><?=$value['is_converted'];?></td>
                                    <td class="text-center"><?=$value['status'];?></td>
                                    <td class="text-right"><?='$ '.number_format($value['total'],2);?></td> 
                                </tr>
                                <?php }?>
                                <tr>
                                    <td colspan="7">
                                        <div class="text-bold text-right">Total</div>
                                    </td>
                                    <td colspan="1">
                                        <div class="text-bold text-right"><?='$ '.number_format($total,2);?></div>
                                    </td>  
                                </tr>
                            </tbody>
                        </table>
                    <?php 
                    $timezone = date("D M j Y G:i:s"); 
                    echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
                    }?>
                    </div>
                </div>   
            </div>
        </div> 
    </div>
</div>

<?php
$script = <<<JS
    $("#print_content").click(function(){
        var printContents = document.getElementById("page-content").innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    });

    $('#salereport-from_date, #salereport-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#salereport-from_date").change(function(){

        $('#salereport-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#salereport-to_date').val())){
            $('#salereport-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#salereport-from_date,#salereport-to_date").change(function(){
        $('#salereport-date_range').val('custom').trigger('change');
    });

    $("#salereport-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#salereport-from_date").val("$today");
            $("#salereport-to_date").val("$today");
        }else if(name == 'week'){
            $("#salereport-from_date").val("$week_start");
            $("#salereport-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#salereport-from_date").val("$month_start");
            $("#salereport-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#salereport-from_date").val("$year_start");
            $("#salereport-to_date").val("$year_end");
        }
    }); 

    // start check submit type
    $('#btn_search').on('click',function(){
        $('input[name=is_print]').val(1);
        $('#idQuotation').submit();
        return false;
    });

    $('#btn_excel').on('click',function(){
        $('input[name=is_print]').val(2);
        $('#idQuotation').submit(); 
        return false;  
    });

    $('#btn_pdf').on('click',function(){
        $('input[name=is_print]').val(3);
        $('#idQuotation').submit();
        return false;
    });
    // end check submit type
    $('#btn_print').click(function(){
        window.print();
    });
JS;

$this->registerJs($script);

?>
