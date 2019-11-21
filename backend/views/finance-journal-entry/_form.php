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


$sql = "SELECT * FROM chart_account WHERE id NOT IN( SELECT is_parent FROM chart_account) ORDER BY names ASC";

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span> {input} </div>{error}{hint}';

$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

$available_amount_from_account = 0;
if(!$model->isNewRecord){

    $from_account_type = \backend\models\ChartAccount::find()
        ->where(['id'=> $model->from_account])
        ->one();

    $chart_of_account_bank = \backend\models\FinanceChartOfAccount::find()
        ->select(['COALESCE(balance, 0) as balance'])
        ->where(['account_type'=>$from_account_type->id_account_type, 'chart_of_account'=>$model->from_account, 'status'=>1])
        ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
        ->limit(1)
        ->one();
    if(empty($chart_of_account_bank)){
        $chart_of_account_bank_amount = 0;
    }else{
        $chart_of_account_bank_amount = $chart_of_account_bank->balance;
    }

    $available_amount_from_account = $chart_of_account_bank_amount;
}
$available_amount_from_account = number_format($available_amount_from_account, 2, '.', '');

$available_amount_to_account = 0;
if(!$model->isNewRecord){

    $to_account_type = \backend\models\ChartAccount::find()
        ->where(['id'=> $model->from_account])
        ->one();

    $chart_of_account_bank = \backend\models\FinanceChartOfAccount::find()
        ->select(['COALESCE(balance, 0) as balance'])
        ->where(['account_type'=>$to_account_type->id_account_type, 'chart_of_account'=>$model->to_account, 'status'=>1])
        ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
        ->limit(1)
        ->one();
    if(empty($chart_of_account_bank)){
        $chart_of_account_bank_amount = 0;
    }else{
        $chart_of_account_bank_amount = $chart_of_account_bank->balance;
    }

    $available_amount_to_account = $chart_of_account_bank_amount;
}
$available_amount_to_account = number_format($available_amount_to_account, 2, '.', '');

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
    .number_field input[type=number] {
        text-align: right;
    }
</style>
<div class="finance-journal-entry-form">

    <?php 
        $form = ActiveForm::begin([
            'id' => $model->formName(),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
        ]); 
    ?>
    <div class="row">             
        <div class="col-md-12">
            <?= $form->field($model, 'date',['template'=>$date_template])->textInput(['value' => $model->isNewRecord?date('Y-m-d'):$model->date, 'readonly'=>true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>

    <div class="panel panel-bordered panel-mint">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8">
                    <h3 class="panel-title">Account</h3>
                </div>
                <div class="col-sm-2">
                    <h3 class="panel-title text-right">Credit</h3>
                </div>
                <div class="col-sm-2">
                    <h3 class="panel-title text-right">Debit</h3>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-12">
                            <?= $form->field($model, 'from_account')->widget(Select2::classname(), [
                                'data' => $account_type,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'addon' => [
                                    'append' => [
                                        'content' => Html::button('$<span id="from_chart_of_account_amount">'.$available_amount_from_account.'<span>', [
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
                                ]])->label(false);
                            ?>          
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <?= $form->field($model, 'to_account')->widget(Select2::classname(), [
                                'data' => !$model->isNewRecord? $account_type : [],
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'addon' => [
                                    'append' => [
                                        'content' => Html::button('$<span id="to_chart_of_account_amount">'.$available_amount_to_account.'<span>', [
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
                                ]])->label(false);
                            ?>          
                        </div>
                    </div>   
                </div>             
                <div class="col-sm-2">
                    <div class="row">
                        <div class="col-sm-12 number_field">
                            <?= $form->field($model, 'amount')->textInput(['type' => 'number', 'step'=>0.01, 'value'=>$model->isNewRecord ? 0 : $model->amount])->label(false) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 number_field">
                            <input type="number" name="amount_x1" class="form-control" value=<?= number_format(0,2) ?> readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="row">
                        <div class="col-sm-12 number_field">
                            <input type="number" name="amount_x2" class="form-control" value=<?= number_format(0,2) ?> readonly >
                        </div>
                    </div>
                    <div class="pad-btm"></div>
                    <div class="row">
                        <div class="col-sm-12 number_field">
                            <input type="number" name="amount_x3" id="amount_x3" class="form-control" style="background: transparent !important;" value=<?= number_format(0,2) ?> readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textArea(['rows' => 3]) ?>
        </div>
    </div>

    <div class="text-right"> 
        <?php if(!$model->isNewRecord){ if($model->status == 1) { ?>
            <a class="btn btn-rounded btn-danger button-void" data-value="<?= \yii\helpers\Url::to(['finance-journal-entry/void', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">VOID</a>
        <?php } } ?>
        <?php if($model->status == 1){ ?>
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded', 'id' => 'pay-button']) ?>
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

    $('#financejournalentry-date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

    $("#financejournalentry-from_account").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/finance-journal-entry/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'chart_of_account_from'
            },
            success: function(response){
                var data = JSON.parse(response);
                $('#from_chart_of_account_amount').text(parseFloat(data['amount']).toFixed(2));

                var str = "<option value=''></option>";
                $.each(data['chart_of_account'],function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.names+'</option>';
                });
                $('#financejournalentry-to_account').html(str);

                CheckBeforeSave();
            },
            error:function(response){
                console.log(response);
            }
        });

    });

    $("#financejournalentry-to_account").change(function(){
        var id = $(this).val();

        $.ajax({
            url: base_url+'/finance-journal-entry/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'chart_of_account_to'
            },
            success: function(response){
                var data = JSON.parse(response);
                $('#to_chart_of_account_amount').text(parseFloat(data).toFixed(2));
            },
            error:function(response){
                console.log(response);
            }
        });

    });

    function CheckBeforeSave() {
        var total_amount = $("#financejournalentry-amount").val();
        total_amount = parseFloat(total_amount);

        var chart_account_balance = $("#from_chart_of_account_amount").text();
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

    $("#financejournalentry-amount").on("keyup mouseup",function(){

        var amount = $(this).val();
        amount = parseFloat(amount);

        $("#amount_x3").val(amount);
        
        CheckBeforeSave();
    });

JS;

$this->registerJs($script);

?>