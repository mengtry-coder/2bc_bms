<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use backend\models\UploadedFile;

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$base_url =  Yii::getAlias('@web');

if($model->isNewRecord){
    $sql = "SELECT * FROM chart_account 
            WHERE id_account_type =3 
            AND id NOT IN( SELECT id_chart_of_account FROM finance_opening_balance WHERE status = 1)
            AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
} else {
    $sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
}

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span> {input} </div>{error}{hint}';

$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

$available_amount = 0;
if(!$model->isNewRecord){

    $chart_of_account_bank = \backend\models\FinanceChartOfAccount::find()
        ->select(['COALESCE(balance, 0) as balance'])
        ->where(['account_type'=>3, 'chart_of_account'=>$model->id_chart_of_account])
        ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
        ->limit(1)
        ->one();
    if(empty($chart_of_account_bank)){
        $chart_of_account_bank_amount = 0;
    }else{
        $chart_of_account_bank_amount = $chart_of_account_bank->balance;
    }

    $available_amount = $chart_of_account_bank_amount;
}
$available_amount = number_format($available_amount, 2, '.', '');
?>
<style type="text/css">
    textarea {
        resize: none;
    }
    .modal {
        overflow-x: hidden;
        overflow-y: auto;
    }
    #ui-datepicker-div {
        z-index: 9999 !important;
    }
    .select2-container--open {
        z-index: 9999999
    }
</style>
<div class="finance-opening-balance-form">

    <?php 
        $form = ActiveForm::begin([
            'id' => $model->formName(),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
        ]); 
    ?>
    <div class="row">             
        <div class="col-md-4">
            <?= $form->field($model, 'date',['template'=>$date_template])->textInput(['value' => $model->isNewRecord?date('Y-m-d'):$model->date, 'readonly'=>true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-8">
            <?= $form->field($model, 'id_chart_of_account')->widget(Select2::classname(), [
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
            <?= $form->field($model, 'description')->textArea(['rows' => 3]) ?>
        </div>
    </div>

    <div class="text-right"> 
        <?php if(!$model->isNewRecord){ if($model->status == 1) { ?>
            <a class="btn btn-rounded btn-danger button-void" data-value="<?= \yii\helpers\Url::to(['finance-opening-balance/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">VOID</a>
        <?php } } ?>
        <?php if($model->status == 1){ ?>
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
        <?php } ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php 

$script = <<<JS

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-void')){
            swal({
                text: "Your submit will be cancelled this bill, do you want to continue?",
                icon: "warning",
                buttons: true,
                confirmButtonClass: "btn-warning",
                buttons: [
                    'Cancel!',
                    'VOID!'
                ],
                dangerMode: true
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
    };

    var base_url = "$base_url";

    $('#financeopeningbalance-date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

    $("#financeopeningbalance-id_chart_of_account").change(function(){
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
            },
            error:function(response){
                console.log(response);
            }
        });

    });

    $("#financeopeningbalance-amount").on("keyup mouseup",function(){
        if($(this).val() > 0 && $(this).val() != ''){
            var word_amt = toWords($(this).val());
            word_amt = word_amt.toUpperCase() + 'DOLLAR';
            $("#financeopeningbalance-amount_in_word").val(word_amt);
        }else {
            $("#financeopeningbalance-amount_in_word").val('');
        }
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