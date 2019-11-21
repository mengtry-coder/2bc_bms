<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()
    ->all(), 'id', function($model){return $model->names;});

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$time_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-clock"></i></span> {input} </div>{error}{hint}';

$sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

?>
<div class="payment-form">

    <?php 

    $validationUrl = ['customer-invoice/validation-payment'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => true,
        'enableClientValidation' => true,
        'options' => ['autocomplete' => 'off'],
        'validationUrl' => $validationUrl
    ]); 
    ?>

    <div class="row"> 
        <div class="col-md-6">
            <?= $form->field($model, 'invoice_no')->textInput(['value' => $model_invoice->doc_id, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'receive_amount', ['template'=>$dollar_template])->textInput(['type' => 'number', 'min'=>0, 'step'=>0.01,'value'=>$model_invoice->balance_amount, 'max'=>$model_invoice->balance_amount]) ?>
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
                        'content' => Html::button('$<span id="chart_of_account_amount">'.number_format(0,2).'<span>', [
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
        <div class="col-md-6">
            <?= $form->field($model, 'date', ['template'=>$date_template])->textInput(['readonly' => true, 'value'=>date('Y-m-d'), 'style'=>'background: #fff !important;']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                    'data' => $payment_method,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    // 'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>  
        </div>
    </div>
    
    <div class="row row_cheuqe_method hide">
        <div class="col-md-6">
            <?= $form->field($model, 'cheque_number')->textInput(['type'=>'number', 'min'=>0, 'maxlength'=>20]) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'clearing_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>

    <?= $form->field($model, 'note')->textArea(['rows' => 4]) ?>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
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

    $("#customerpayment-date").change(function(){

        $('#customerpayment-clearing_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#customerpayment-clearing_date').val())){
            $('#customerpayment-clearing_date').datepicker('setDate', $(this).val());
        }

    });

    $('#customerpayment-date, #customerpayment-clearing_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
        startDate: "$model_invoice->date"
    });

    $("#customerpayment-id_payment_method").change(function(){
        var id = $(this).val();
        
        if (id ==3 ){
            $(".row_cheuqe_method").removeClass('hide');
            $(".row_cheuqe_method").hide();
            $(".row_cheuqe_method").slideDown();
        }else{
            $(".row_cheuqe_method").slideUp();
        }

    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });

    $("#customerpayment-chart_of_account").change(function(){
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


JS;

$this->registerJs($script);

?>
