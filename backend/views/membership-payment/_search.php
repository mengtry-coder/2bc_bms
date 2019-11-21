<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

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



<div class="form-inline">

    <?php $form = ActiveForm::begin([
        'action' => ['membership-payment/index', 'id_membership_profile'=>$id_membership_profile],
        'method' => 'get'
    ]); ?>

    <div class="row">

        <div class="col-md-9">
            <div class="row">
                <div class="col-md-2">
                    <?php $date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom']; ?>
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

                <div class="col-md-2">
                    <?= $form->field($model, 'from_date')->textInput(['readonly'=>true]) ?>
                </div>

                <div class="col-md-2">
                    <?= $form->field($model, 'to_date')->textInput(['readonly'=>true]) ?>
                </div> 

                <div class="col-md-3">
                    <?= $form->field($model, 'globalSearch')->textInput()->label('Global Search') ?>
                </div>
                    
                <div class="col-md-3">
                    <?= $form->field($model, 'status')->widget(Select2::classname(), [
                        'data' => [0=>'All', 1=>'Paid', 2=>'Pending', 3=>'Overdue', 4=>'Expired'],
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
            </div>
        </div>
  
        
        <div class="col-md-3">
            <div class="pull-right">
                <button type="submit" class="btn btn-success btn-rounded" style="margin-right: 0px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>
                <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['membership-payment/create','id_membership_profile'=>$id_membership_profile]) ?>">
                    Add New <i class="fa fa-plus-square go-right"></i>
                </button>
            </div>
        </div>
                
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 

$script = <<<JS
    
    var checkInElem = $('#membershippaymentsearch-from_date');
    var checkOutElem = $('#membershippaymentsearch-to_date');
    
    if(checkInElem.val() === null || checkInElem.val() === ''){
        checkOutElem.attr('disabled',true);
    }

    checkInElem.datepicker({dateFormat: 'yy-mm-dd', showButtonPanel: true});

    checkOutElem.datepicker({minDate: checkInElem.val(), dateFormat: 'yy-mm-dd', showButtonPanel: true});

    checkInElem.on("change", onCheckin);
    function onCheckin(){
        var checkInElem = $('#membershippaymentsearch-from_date');
        if(checkInElem.val() !== null) {
            checkOutElem.attr('disabled',false);
            var checkInDate = checkInElem.datepicker("getDate");
            var minDate = new Date(checkInDate.getFullYear(), checkInDate.getMonth(), checkInDate.getDate());
            checkOutElem.datepicker('option', 'minDate', new Date(minDate));
        }
    }  

    $(document).on('change','#membershippaymentsearch-date_range',function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#membershippaymentsearch-from_date").val("$today");
            $("#membershippaymentsearch-to_date").val("$today");
        }else if(name == 'this_week'){
            $("#membershippaymentsearch-from_date").val("$week_start");
            $("#membershippaymentsearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#membershippaymentsearch-from_date").val("$month_start");
            $("#membershippaymentsearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#membershippaymentsearch-from_date").val("$year_start");
            $("#membershippaymentsearch-to_date").val("$year_end");
        }

        var checkInElem = $('#membershippaymentsearch-from_date');
        if(checkInElem.val() === null || checkInElem.val() === '') {
            $("#membershippaymentsearch-from_date").val("$today");    
        }
        onCheckin();
        
    });

    $("#membershippaymentsearch-from_date,#membershippaymentsearch-to_date").change(function(){

        $('#membershippaymentsearch-date_range').val('custom').trigger('change');             
    
    });

JS;

$this->registerJs($script);

?>
