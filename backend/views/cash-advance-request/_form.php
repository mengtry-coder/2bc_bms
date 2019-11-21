<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;

$base_url = Yii::getAlias('@web');

$pay_type_name = ArrayHelper::map($pay_type_name, 'id', 'name');

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

$available_amount = 0;
if(!$model->isNewRecord){

    $chart_of_account_bank = \backend\models\FinanceChartOfAccount::find()
        ->select(['COALESCE(balance, 0) as balance'])
        ->where(['account_type'=>3, 'chart_of_account'=>$model->chart_of_account])
        ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
        ->limit(1)
        ->one();
    if(empty($chart_of_account_bank)){
        $chart_of_account_bank_amount = 0;
    }else{
        $chart_of_account_bank_amount = $chart_of_account_bank->balance;
    }

    $available_amount = $chart_of_account_bank_amount + $model->amount;
}
$available_amount = number_format($available_amount, 2, '.', '');

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$base_url =  Yii::getAlias('@web');

$id_employee = Yii::$app->user->identity->id_employee;
if(!$model->isNewRecord){
        $canApprove = $is_approval['is_appoval'];
    }else{
        if($is_approval['is_appoval'] == 0){
            $canApprove = 0; 
        }else{
            $canApprove = $is_approval['is_appoval'];
        }
    }  
    if($canApprove == 0){
        $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
        ->where(['id' => $id_employee])
        ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
    }else{
        $employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
        ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
    }

?>

<style type="text/css">
    .label-input input[type='text']{
        border-radius: 0px;
        border: none !important;
        box-shadow: none !important;
        border-bottom: 1px solid gainsboro !important;
        }
        .form-control:focus, .has-error .form-control, .has-error .form-control:focus {
        box-shadow: none;
    }
    .label-input .form-control[readonly] {
        background: #fff !important;
        cursor: text !important;
        border-bottom: 1px solid gainsboro !important;
    }
    textarea {
        resize: none;
    }
    .field-cashadvancerequest-chart_of_account .input-group-btn button{
        min-width: 100px !important;
    }
</style>

<div class="cash-advance-request-form">

    <?php

        $validationUrl = ['cash-advance-request/validation'];
        if (!$model->isNewRecord){
            $validationUrl['id'] = $model->id;
        }

        $form = ActiveForm::begin([
            'id' => $model->formName(),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'options' => ['autocomplete' => 'off'],
            'validationUrl' => $validationUrl
        ]);
    ?>
        <div class="row"> 
            
            <div class="col-md-6">
                <?= $form->field($model, 'date', ['template'=>$date_template])->textInput(['value'=>$model->isNewRecord?date('Y-m-d'):$model->date, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'id_employee')->widget(Select2::classname(), [
                    'data' => $employee_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'options' => ['placeholder' => 'Select'],
                    'language' => 'eg',
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]); ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
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
        
        </div>

        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'amount', ['template'=>$dollar_template])->textInput(['type' => 'number', 'step'=>0.01]) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'amount_in_word')->textInput(['maxlength' => true, 'readonly'=>true, 'style'=>'letter-spacing: 2px; background: #fff4f4; font-weight: bolder;']) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'reason')->textArea(['rows' => 4]) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'id_pay_type')->widget(Select2::classname(), [
                    'data' => $pay_type_name,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]); ?>
            </div>
        
            <div class="col-md-6">
                <?= $form->field($model, 'approved_by')->widget(Select2::classname(), [
                    'data' => $employee_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'options' => ['placeholder' => 'Select'],
                    'language' => 'eg',
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]); ?>
            </div>
        </div>


    <div class="text-right <?= $model->isNewRecord? '' : $model->status == 0 ? 'hide' : '' ?>"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded', 'id'=>'pay-button']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS

    var base_url = "$base_url";
    
    $('#cashadvancerequest-date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        todayBtn: "linked",
    });

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    $("#cashadvancerequest-chart_of_account").change(function(){
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

                CheckBeforeSave();
            },
            error:function(response){
                console.log(response);
            }
        });

    });


    function CheckBeforeSave() {
        var total_amount = $("#cashadvancerequest-amount").val();
        total_amount = parseFloat(total_amount);

        var chart_account_balance = $("#chart_of_account_amount").text();
        chart_account_balance = parseFloat(chart_account_balance);

        if(total_amount <= 0){
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }

        if(total_amount > chart_account_balance){
            $("#pay-button").prop('disabled', true);
            swal(
                "Warning", 
                "You cannot apply an amount greater than the bank amount, please check your balance.", 
                "warning"
            );
        }else{
            $("#pay-button").removeAttr('disabled');
        }

    }


    $("#cashadvancerequest-amount").on("keyup mouseup",function(){
        if($(this).val() > 0 && $(this).val() != ''){
            var word_amt = toWords($(this).val());
            word_amt = word_amt.toUpperCase() + 'DOLLAR';
            $("#cashadvancerequest-amount_in_word").val(word_amt);
        }else {
            $("#cashadvancerequest-amount_in_word").val('');
        }
        CheckBeforeSave();
    });

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
