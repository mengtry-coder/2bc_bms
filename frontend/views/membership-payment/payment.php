<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\MembershipProfile;
use yii\widgets\ActiveForm; 
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
$paymentURL = URL::toRoute(['/membership-payment/index']);
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

$membership_url = Url::toRoute(['membership-profile/index']);
$membership_name = ArrayHelper::map(\backend\models\MembershipProfile::find()
->where(['status' => 1])
->all(), 'id', 'company_name');

$this->title = 'Payment'; 
$this->params['breadcrumbs'][] = 'Payment'; 

?>
<style>
    .modal-lg{
        width: 90%;
    }
    #overlay {
    position: fixed;
    display: none;
    width: auto;
    height: auto;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #00000050;
    z-index: 999999 !important;
    cursor: progress;
    }
    #text{
        position: absolute;
        top: 50%;
        left: 50%;
        font-size: 50px;
        color: white;
        transform: translate(-50%,-50%);
        -ms-transform: translate(-50%,-50%);
    }
</style>
<div class="membership-payment-index"> 
    <div id="overlay">
        <div id="text">Processing <span class="fa fa-user fa-pulse"></span></div>
    </div>
    <div class="panel"> 
        <div class="panel-body">  
            <?php $form = ActiveForm::begin([
                'action' => ['payment'],
                'method' => 'post',
                'id' => 'date_report',
            ]); ?>
            <div class="row">
                <div class="col-md-10">
                    
                    <div class="row"> 
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-4 col-xs-4">
                                    <?php $date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year','custom'=>'Custom'] ?>
                                    <?= $form->field($model, 'date_range')->widget(Select2::classname(), [
                                        'data' => $date_range,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => [
                                            'placeholder'=>'All'
                                        ],
                                        'pluginOptions' => [
                                            'allowClear' => false
                                        ]]);
                                    ?> 
                                </div>
                                <div class="col-md-4 col-xs-4">
                                    <?= $form->field($model, 'from_date')->textInput(['readonly'=>true]) ?>
                                </div>
                                <div class="col-md-4 col-xs-4">
                                    <?= $form->field($model, 'to_date')->textInput(['readonly'=>true]) ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-8 col-xs-8">  
                                    <?= $form->field($model, 'id_membership_profile')->widget(Select2::classname(), [
                                        'data' => $membership_name,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => [
                                            'placeholder'=>'All'
                                        ], 
                                        'pluginOptions' => [
                                            'allowClear' => true 
                                        ]]);
                                    ?>  
                                </div>
                                <div class="col-md-4 col-xs-4"> 
                                    <?php $search_by = [1 => "Paid", 2 => "Pending"]; ?>
                                    <?= $form->field($model, 'status')->widget(Select2::classname(), [
                                        'data' => $search_by,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => [
                                            'placeholder'=>'All'
                                        ], 
                                        'pluginOptions' => [
                                            'allowClear' => true 
                                        ]]);
                                    ?>  
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="col-md-2 col-sm-12 col-xs-12">
                    <div class="btn-action pull-right">
                        <div class="row"> 
                            <div hidden="hidden">
                                <?php
                                    $is_print = 0;
                                ?>
                                <input type="text" name="is_print" hidden="hidden" value = "<?=$is_print?>">
                            </div> 
                            <div class="col-md-12 col-xs-12">
                                <!-- <button type="button" id="btn_excel" class="btn btn-warning btn-rounded">
                                    <i class="fa fa-file-excel-o" style="font-size: large;"></i>
                                </button> 
                                <button type="button" id="btn_pdf" class="btn btn-warning btn-rounded">
                                    <i class="fa fa-file-pdf-o" style="font-size: large;"></i>
                                </button>
                                <button type="button"  id="btn_print" class="btn btn-warning btn-rounded">
                                    <i class="fa fa-print" style="font-size: large;"></i>
                                </button> -->
                                <!-- <button type="submit" class="btn btn-warning btn-rounded"> Search <i class="fa fa-search go-right"></i>
                                </button> -->
                                <button type="submit" class="btn btn-success btn-rounded" style="margin-right: 0px;">
                                    Search <i class="fa fa-search go-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            <br/>
            <?php ActiveForm::end();?> 
            <div class="table-responsive"> 
                
                <div id="w1" class="grid-view">
                    <table  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <?php
                        if(count($data_member_payment) > 0){
                    ?>     
                    <thead>
                            <tr>
                                <th>#</th>
                                <th class="text-center">Valid Date</th> 
                                <th class="min-tablet">Member Name</th>
                                <th class="min-tablet">Payment Method</th>
                                <th class="min-desktop">Note</th>
                                <th class="text-center">Status</th>
                                <th class="text-right">Amount</th>
                            </tr>
                        </thead>
                        <?php 
                        } 
                        ?>
                        <tbody> 
                            <?php
                            $paymentRange = 1;
                            foreach($data_member_payment as $key => $value)
                            {
                                echo "
                                <tr>
                                    <td>".$paymentRange++."</td>
                                    <td style='text-align: center;'>".$value["from_date"]." To ".$value["to_date"]."</td>
                                    <td><a href='".$paymentURL."?id_membership_profile=".$value['id_membership_profile']."' target='_blank'>".$value["company_name"]."</a></td>
                                    <td>".$value["payment_method"]."</td>
                                    <td>".$value["description"]."</td>
                                    <td style='text-align:center;'>
                                ";
                                    if ($value["status"] == 1) {
                                        $status = '<div class="text-center"><span class="label label-info">Paid</span></div>';
                                    } else if ($value["status"] == 2){
                                        $status = '<div class="text-center"><span class="label label-warning">Pending</span></div>';
                                    }else if ($value["status"] == 3){
                                        $status = '<div class="text-center"><span class="label label-warning">Overdue</span></div>';
                                    }else{
                                        $status = '<div class="text-center"><span class="label label-danger">Expired</span></div>';
                                    }
                                    echo $status;
                                echo "</td>
                                    <td style='text-align: right;'>$ ".$value["amount"]."</td>
                                </tr>
                                ";
                            }
                            ?> 
                        </tbody>
                    </table> 
                </div>   
            </div>
        </div>
    </div>
</div>
<?php
$this->registerJs('
        var controller_id = "membership-payment";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/payment&page_size="+page_size); 
        });


        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click",".btn_submit",function(){
            var date_range = $("#membershippayment-date_range").val(); 
            var from_date = $("#membershippayment-from_date").val();
            var to_date = $("#membershippayment-to_date").val();
            if(from_date == "" || to_date == "" || date_range == ""){
                alert("Please select Date Range and note that Form Date or To Date can\'t be blank.");
                return false;
            }
            $("#overlay").css({"display":"block","z-index":"9999"});
        });

        $(document).bind("ready",function(){
            $("#overlay").css({"display":"none","z-index":"9999999"});
        });
     
        $("#membershippayment-date_range").change(function(){
            var name = $(this).val();
    
            if(name == "today"){
                $("#membershippayment-from_date").val("'.$today.'");
                $("#membershippayment-to_date").val("'.$today.'");
            }else if(name == "week"){
                $("#membershippayment-from_date").val("'.$week_start.'");
                $("#membershippayment-to_date").val("'.$week_end.'");
            }else if(name == "month"){
                $("#membershippayment-from_date").val("'.$month_start.'");
                $("#membershippayment-to_date").val("'.$month_end.'");
            }else if(name == "year"){
                $("#membershippayment-from_date").val("'.$year_start.'");
                $("#membershippayment-to_date").val("'.$year_end.'");
            }
     
        });
        
        $("#membershippayment-from_date,#membershippayment-to_date").change(function(){
    
            $("#membershippayment-date_range").val("custom").trigger("change");   
    
        });
        $("#membershippayment-from_date,#membershippayment-to_date").datepicker({ 
            format: "yyyy-mm-dd",
            todayBtn: "linked",
            autoclose: true,
            todayHighlight: true 
        });
    ');
?>
