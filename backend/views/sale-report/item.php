<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

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


?>
<style>
.panel-eo {
    border-color: #f87232;
}
.breadcrumb>.active{
    text-transform: capitalize;
}  
</style> 
<div class="marital-status-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-body" style="padding: 8px 20px 2px;"> 
                <div class="row"> 
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">
                                <?= $form->field($model, 'date_range')->dropDownList($date_range, ['prompt'=>'Select Range', 'style'=>'margin-top: 10px;'])->label(false) ?>
                            </div>
                            <div class="col-md-4">
                                <?= $form->field($model, 'from_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'From Date', 'readonly'=>true])->label(false) ?>
                            </div>
                            <div class="col-md-4">
                                <?= $form->field($model, 'to_date')->textInput(['class'=>'form-control pull-right', 'style'=>'background: #fff;', 'placeholder'=>'To Date', 'readonly'=>true])->label(false) ?>
                            </div>
                        </div>
                    </div> 
                    <div class="cold-md-7">
                        <div class="text-right" style="padding: 10px;"> 
                            <?= Html::submitButton('Search', ['class' => 'btn btn-success btn-rounded']) ?>
                        </div> 
                    </div>
                </div>  
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

    <div class="row"> 
        <div class="col-md-2 col-sm-3">
            <?= $this->render("//sale-report/_sale_report_menu");?>
        </div>
        <div class="col-md-10 col-sm-9"> 
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-control">
                        <button class="btn btn-default" data-panel="fullscreen">
                            <i class="icon-max demo-psi-maximize-3"></i>
                            <i class="icon-min demo-psi-minimize-3"></i>
                        </button>
                    </div>
                    <h3 class="panel-title" style="font-weight: 500; text-transform: capitalize;"><?=$this->title;?></h3>
                </div>

                <div class="panel-body">
                <div class="text-2x text-center unselectable">Craig's Design and Landscaping Services</div>
                <div class="text-2x text-center unselectable">Invoice List by Date</div>
                <div class="text-semibold text-center unselectable">July 1-30, 2019</div>
                <?php print_r($invoiceData); ?>    
                <table class="table  table-condensed">
                        <thead>
                            <tr>
                                <th>Invoice</th>
                                <th>User</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53451</a></td>
                                <td>Scott S. Calabrese</td>
                                <td>$24.98</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53452</a></td>
                                <td>Teresa L. Doe</td>
                                <td>$564.00</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53453</a></td>
                                <td>Steve N. Horton</td>
                                <td>$58.87</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53454</a></td>
                                <td>Charles S Boyle</td>
                                <td>$97.50</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53455</a></td>
                                <td>Lucy Doe</td>
                                <td>$12.79</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53456</a></td>
                                <td>Michael Bunr</td>
                                <td>$249.99</td>
                            </tr>
                            <tr>
                                <td><a href="#fakelink" class="btn-link">Order #53451</a></td>
                                <td>Scott S. Calabrese</td>
                                <td>$24.98</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>   
        </div>
    </div> 
</div>

<?php
$script = <<<JS

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

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>
