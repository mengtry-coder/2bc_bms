<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web');

$month_list = ArrayHelper::map(\backend\models\MonthList::find()
    ->all(), 'id', 'name'); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

$available_amount = 0;
$available_amount = number_format($available_amount, 2, '.', '');

?>

<div class="payroll-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row"> 
        <div class="col-sm-4 col-md-4">
            <?= $form->field($model, 'date', ['template' => $date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-sm-4 col-md-4">
            <?= $form->field($model, 'pay_for', ['template' => $date_template])->dropDownList($month_list,['disabled'=>true]) ?>
        </div>
        <div class="col-sm-4 col-md-4">
            <?= $form->field($model, 'total_net_pay', ['template' => $dollar_template])->textInput(['type'=>'number', 'step'=>0.01, 'readonly'=>'true', 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-6 col-md-6">
            <?= $form->field($model, 'chart_of_account')->widget(Select2::classname(), [
                'data' => $account_type,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'addon' => [
                    'append' => [
                        'content' => Html::button('$<span id="chart_of_account_amount">'.$available_amount.'<span>', [
                            'class' => 'btn btn-primary', 
                            'title' => 'Available Amount', 
                            'type' => 'button',
                            'data-toggle' => 'tooltip',
                        ]),
                        'asButton' => true
                    ]
                ],
                'options' => 
                   ['placeholder' => 'Select']
                ,
                'pluginOptions' => [
                    'allowClear' => false
                ]]);
            ?>
        </div>
        <div class="col-sm-6 col-md-6">
            <?= $form->field($model, 'amount', ['template' => $dollar_template])->textInput(['value'=>number_format(0,2), 'type'=>'number', 'step'=>0.01]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-12">
            <?= $form->field($model, 'amount_in_word')->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>

    <div class="row hide">
        <div class="col-sm-6 col-md-6">
            <?= $form->field($model, 'chart_of_account_option')->widget(Select2::classname(), [
                'data' => $account_type,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'addon' => [
                    'append' => [
                        'content' => Html::button('$<span id="chart_of_account_amount_option">'.$available_amount.'<span>', [
                            'class' => 'btn btn-primary', 
                            'title' => 'Available Amount', 
                            'type' => 'button',
                            'data-toggle' => 'tooltip',
                        ]),
                        'asButton' => true
                    ]
                ],
                'options' => 
                   ['placeholder' => 'Select']
                ,
                'pluginOptions' => [
                    'allowClear' => false
                ]]);
            ?>
        </div>
        <div class="col-sm-6 col-md-6">
            <?= $form->field($model, 'amount_option', ['template' => $dollar_template])->textInput(['type'=>'number', 'step'=>0.01]) ?>
        </div>
    </div>

    <div class="row hide">
        <div class="col-sm-12 col-md-12">
            <?= $form->field($model, 'amount_in_word_option')->textInput(['value'=>number_format(0,2), 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>    

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded', 'id' => 'pay-button']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php
$script = <<<JS

    var base_url = "$base_url";

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    $('#payroll-date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
    });

    $("#payroll-chart_of_account").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/customer-payment/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'chart_of_account_amount'
            },
            success: function(response){
                var data = JSON.parse(response);
                $('#chart_of_account_amount').text(parseFloat(data).toFixed(2));

                $("#payroll-amount").attr('max', parseFloat(data).toFixed(2));
                $("#payroll-amount").val(0);
                $("#payroll-amount_in_word").val("");

                // CheckBeforeSave();
            },
            error:function(response){
                console.log(response);
            }
        });

    });

    $("#payroll-amount").on("change",function(){
        if($(this).val() > 0 && $(this).val() != ''){
            var word_amt = toWords($(this).val());
            word_amt = word_amt.toUpperCase() + 'DOLLAR';
            $("#payroll-amount_in_word").val(word_amt);
        }else {
            $("#payroll-amount_in_word").val('');
        }
        CheckBeforeSave();
    });

    function CheckBeforeSave() {
        var total_net_pay = $("#payroll-total_net_pay").val();
        total_net_pay = parseFloat(total_net_pay);

        var total_amount = $("#payroll-amount").val();
        total_amount = parseFloat(total_amount);

        var chart_account_balance = $("#chart_of_account_amount").text();
        chart_account_balance = parseFloat(chart_account_balance);

        if(total_amount <= 0){
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }


        if(total_amount > chart_account_balance){
            swal(
                "Warning", 
                "You cannot apply an amount greater than the bank amount, please check your balance.", 
                "warning"
            );
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }

        if( total_amount != total_net_pay ){
            swal(
                "Warning", 
                "You can only apply an amount must be equal to net pay amount, please check your balance.", 
                "warning"
            );
            $("#pay-button").prop('disabled', true);
        } else {
            $("#pay-button").prop('disabled', false);
        }


    }


// American Numbering System
var th = ['','thousand','million', 'billion','trillion'];
// uncomment this line for English Number System
// var th = ['','thousand','million', 'milliard','billion'];

var dg = ['zero','one','two','three','four', 'five','six','seven','eight','nine']; 
var tn = ['ten','eleven','twelve','thirteen', 'fourteen','fifteen','sixteen', 'seventeen','eighteen','nineteen']; 
var tw = ['twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety']; 

function toWords(s) {
    s = s.toString();
    s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s))
        return 'not a number';
    var x = s.indexOf('.');
    if (x == -1) x = s.length;
    if (x > 15) return 'too big';
    var n = s.split('');
    var str = '';
    var sk = 0;
    for (var i = 0; i < x; i++) {
        if ((x - i) % 3 == 2) {
            if (n[i] == '1') {
                str += tn[Number(n[i + 1])] + ' ';
                i++;
                sk = 1;
            } else if (n[i] != 0) {
                str += tw[n[i] - 2] + ' ';
                sk = 1;
            }
        } else if (n[i] != 0) {
            str += dg[n[i]] + ' ';
            if ((x - i) % 3 == 0) str += 'hundred ';
            sk = 1;
        }
        if ((x - i) % 3 == 1) {
            if (sk) str += th[(x - i - 1) / 3] + ' ';
            sk = 0;
        }
    }
    if (x != s.length) {
        var y = s.length;
        str += 'point ';
        for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' ';
    }
    return str.replace(/\s+/g, ' ');
}
    

JS;
$this->registerJs($script);
?>