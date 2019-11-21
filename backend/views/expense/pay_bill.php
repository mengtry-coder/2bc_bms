<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use backend\models\UploadedFile;

$base_url =  Yii::getAlias('@web');

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span> {input} </div>{error}{hint}';

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()->where(['status'=>1])
    ->all(), 'id', 'names');

$related_to = ArrayHelper::map(\backend\models\ExpenseRelatedTo::find()
    ->all(), 'id', 'name'); 

$realted_to_profile = [];

if($model->id_related_to == 1){ //Supplier
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(supplier_name, ' (', company_name,')') as profile_name
        FROM supplier_profile
    ")->queryAll();
    $realted_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
}  
if($model->id_related_to == 2){ //Customer
    $response = Yii::$app->db->createCommand("
        SELECT id, CONCAT(customer_name, ' (', company_name,')') as profile_name
        FROM customer_profile
    ")->queryAll();
    $realted_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
}
if($model->id_related_to == 3){
    $response = Yii::$app->db->createCommand("
        SELECT id, project_name as profile_name
        FROM project
    ")->queryAll();
    $realted_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
}

$sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

$available_amount = 0;
if(!$model->isNewRecord){
    $chart_of_account_bank = \backend\models\FinanceChartOfAccount::find()
        ->select(['COALESCE(balance, 0) as balance'])
        ->where(['account_type'=>3, 'chart_of_account'=>$model->id_chart_of_account, 'status'=>1])
        ->orderBy(['date'=>SORT_DESC, 'id'=>SORT_DESC])
        ->limit(1)
        ->one();
    if(empty($chart_of_account_bank)){
        $chart_of_account_bank_amount = 0;
    }else{
        $chart_of_account_bank_amount = $chart_of_account_bank->balance;
    }
    if($model->status <>5){
    	$available_amount = $chart_of_account_bank_amount + $model->amount;
    } else {
    	$available_amount = $chart_of_account_bank_amount;
    }
}
$available_amount = number_format($available_amount, 2, '.', '');

$max_date = '';

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

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
    .cus-first_row {
        padding-left: 30px !important; 
        padding-right: 25px !important;
    }
    /*.calculate_item, 
    .calculate_item .col-md-1,
    .calculate_item .col-md-2,
    .calculate_item .col-md-3,
    .calculate_item .col-md-4,
    .calculate_item .col-md-5,
    .calculate_item .col-md-6,
    .calculate_item .col-md-7,
    .calculate_item .col-md-8,
    .calculate_item .col-md-9,
    .calculate_item .col-md-10,
    .calculate_item .col-md-11,
    .calculate_item .col-md-12,
    .calculate_item input {
        padding: 5px;
    }*/
    .checkbox_serial_column{
        margin-top: 8px !important;
        margin-left: 15px !important;
    }
    .pull-right-data .text-right input[type='number'] {
        text-align: right !important;
    }
    #supplier {
        border-radius: 0px;
        border: none !important;
        box-shadow: none !important;
        border-bottom: 1px solid gainsboro !important;
    }
    .select2-container--open {
        z-index: 9999999
    }
</style>

<?php 

    $validationUrl = ['expense/validation-bill'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
    ]); 
?>

	<div class="row">
        <div class="col-md-2">
            <?= $form->field($model, 'date',['template'=>$date_template])->textInput(['readonly'=>true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>

        <div class="col-md-2">
            <?= $form->field($model, 'id_related_to')->widget(Select2::classname(), [
                    'data' => $related_to,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true,
                        'disabled' => $model->isNewRecord ? false : true,
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'id_related_profile')->widget(Select2::classname(), [
                    'data' => $realted_to_profile,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true,
                        'disabled' => $model->isNewRecord ? false : true,
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-5">
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
        <div class="col-md-2">
            <?= $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                'data' => $payment_method,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'pluginOptions' => [
                    'allowClear' => false
                ]]);
            ?>          
        </div>

        <div class="col-md-2 row_cheuqe_method <?= $model->id_payment_method ==3?'':'hide' ?>">
            <?= $form->field($model, 'cheque_number')->textInput(['type'=>'number', 'min'=>0, 'maxlength'=>10]) ?>
        </div>

        <div class="col-md-2 row_cheuqe_method <?= $model->id_payment_method ==3?'':'hide' ?>">
            <?= $form->field($model, 'clearing_date',['template'=>$date_template])->textInput(['readonly' => true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
        </div>
    </div>

    <div class="panel panel-info panel-bordered">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-1 text-center">
                    <div class="checkbox">
                        <input id="check_all" class="magic-checkbox" checked type="checkbox">
                        <label for="check_all">All</label>
                    </div>
                </div>
                <div class="col-md-2 text-left">
                    <label class="panel-title">Bill No.</label>
                </div>
                <div class="col-md-5 text-left">
                    <label class="panel-title">Description</label>
                </div>
                <div class="col-md-2 text-right">
                    <label class="panel-title">Amount</label>
                </div>
                <div class="col-md-2 text-right">
                    <label class="panel-title">Pay Amount</label>
                </div>
            </div>
        </div>
        <div class="panel-body calculate_item">
        	<?php if($model->isNewRecord){ ?>
            <div class="row">
                <div style="height: 80px;">
                    <h3 class="text-center text-thin text-info">Will Generate When Selected Name</h3>
                </div>
            </div>
            <?php }else{ 

                $i = 0;
                $model_item = \backend\models\FinancePayBillData::findAll(['pay_bill_id'=>$model->id]);
                
                if(!empty($model_item)){
                    $max_date = max(array_column($model_item, 'bill_date'));
                }

                foreach ($model_item as $key => $value) {
                    $i++;
            ?>
        
            <div class="row row_line" data-id="<?= $i ?>" id="row_line_<?= $i ?>">
                <div class="col-md-1 text-center">
                    <div class="checkbox">
                        <input id="checkbox_serial_column_<?= $i ?>" name="checkbox_serial_column[]" data-id="<?= $i ?>" class="magic-checkbox checkbox_serial_column" value="<?= $i ?>" checked type="checkbox">
                        <label for="checkbox_serial_column_<?= $i ?>"><?= $i ?></label>
                    </div>
                </div>
                <div class="col-md-2 text-left">
                    <input type="text" name="doc_id[]" value="<?= $value->doc_id ?>" class="form-control doc_id" data-id="<?= $i ?>" id="doc_id_<?= $i ?>" />
                    <input type="hidden" name="bill_id[]" value="<?= $value->bill_id ?>" class="form-control bill_id" data-id="<?= $i ?>" id="bill_id_<?= $i ?>" />
                    <input type="hidden" name="bill_date[]" value="<?= $value->bill_date ?>" class="form-control bill_date" data-id="<?= $i ?>" id="bill_date_<?= $i ?>" />
                </div>
                <div class="col-md-5 text-left">
                    <input type="text" name="description[]" value="<?= $value->description ?>" placeholder="Description…" class="form-control description" data-id="<?= $i ?>" id="description_<?= $i ?>" />
                </div>
                <div class="col-md-2 text-right">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                        <input type="number" min=0 id="total_amount_<?= $i ?>" data-id="<?= $i ?>" step=0.01 name="total_amount[]" readonly value="<?= $value->total_amount ?>" class="form-control total_amount"/>
                    </div>
                </div>
                <div class="col-md-2 text-right amount">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                        <input type="number" min=0 id="pay_amount_<?= $i ?>" data-id="<?= $i ?>" step=0.01 name="paid_amount[]" value="<?= $value->paid_amount ?>" class="form-control pay_amount"/>
                    </div>
                </div>
            </div>

            <?php }} ?>
        </div>
    </div>

    <div class="clearfix">
        <div class="row">
            <div class="col-md-8">
                <?= $form->field($model, 'remark')->textArea(['rows' => 3]) ?>
            </div>
            <div class="col-md-4">
                <table class="table invoice-total">
                    <tbody>
                        <tr>
                            <td><strong>TOTAL :</strong> 
                                <div class="hide">
                                    <?= $form->field($model, 'amount')->hiddenInput(['min'=>0,'type'=>'number', 'step'=>0.01]) ?>  
                                </div>
                            </td>
                            <td class="text-bold h4" id="paid_amount"><?= number_format($model->isNewRecord?0:$model->amount,2, '.', '') ?> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="line15"></div>
    <div class="form-group pull-right">
        <?php if(!$model->isNewRecord){ if($model->status <> 5) { ?>
            <a class="btn btn-rounded btn-danger button-void" data-value="<?= \yii\helpers\Url::to(['expense/void-pay-bill', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">VOID</a>
        <?php } } ?>
        <?php if($model->status <> 5){ ?>
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded', 'id'=>'pay-button']) ?>
        <?php } ?>
    </div>
    <div class="clearfix"></div>
<?php ActiveForm::end(); ?>


<?php 

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$isNewRecord = $model->isNewRecord ? 1 : 0;

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
    var isNewRecord = parseInt("$isNewRecord");

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    $('#financepaybill-clearing_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

    if($("#financepaybill-id_payment_method").val() == 3){
        $('#financepaybill-clearing_date').datepicker('setStartDate', $("#financepaybill-date").val());
    }


    $("#financepaybill-id_payment_method").change(function(){
        var id = $(this).val();
        if (id ==3 ){
            $(".row_cheuqe_method").removeClass('hide');
            $(".row_cheuqe_method").hide();
            $(".row_cheuqe_method").slideDown();
            $('#financepaybill-clearing_date').datepicker('setStartDate', $("#financepaybill-date").val());
        }else{
            $(".row_cheuqe_method").slideUp();
        }
    });

    $("#financepaybill-id_chart_of_account").change(function(){
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
                var id = $("#financepaybill-id_chart_of_account").val();
                var current_id = parseInt("$model->id_chart_of_account");
                if(isNewRecord == 0){
                	if(id == current_id){
                		var add_amount = parseFloat("$model->amount");
                		data = parseFloat(data) + add_amount;
                	}
                }
                $('#chart_of_account_amount').text(parseFloat(data).toFixed(2));

                CheckBeforeSave();
            },
            error:function(response){
                console.log(response);
            }
        });

    });

    $("#financepaybill-id_related_to").change(function(){
        var text = $(this).select2('data')[0]['text'];
        $(".field-expense-id_related_profile label").text(text);
        var id = $(this).val();

        $.ajax({
            url: base_url+'/expense/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_profile'
            },
            success: function(response){
                var data = JSON.parse(response);

                var str = "<option></option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.profile_name+'</option>';
                });
                $('#financepaybill-id_related_profile').html(str);
            }
        });

    });


    if(isNewRecord == 0){
        var max_date = "$max_date";
                    
        $('#financepaybill-date').datepicker({
            format: 'yyyy-mm-dd',
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            setDate: max_date,
            setStartDate: max_date,
            todayBtn: "linked",
            todayHighlight: true
        });

        $('#financepaybill-date').datepicker(
            'setStartDate', max_date
        );
    }

    $("#check_all").click(function(){
        $('.checkbox_serial_column').not(this).prop('checked', this.checked);
        if($(this).is(':checked')){
            $(".calculate_item input:text").prop('disabled', false);
            $(".calculate_item input:hidden").prop('disabled', false);
            $(".calculate_item select").prop('disabled', false);
            $(".calculate_item input[type='number']").prop('disabled', false);
        }else {
            $(".calculate_item input:text").prop('disabled', true);
            $(".calculate_item input:hidden").prop('disabled', true);
            $(".calculate_item select").prop('disabled', true);
            $(".calculate_item input[type='number']").prop('disabled', true);
        }

        var sum = 0;
        $(".checkbox_serial_column").each(function(){
            var id = $(this).data('id');
            var paid = 0;
            if($(this).is(':checked')){
                paid += parseFloat($("#pay_amount_"+id).val());
            }
            sum += parseFloat(paid);
        });
        
        $("#financepaybill-amount").val(parseFloat(sum).toFixed(2));
        $("#paid_amount").html(parseFloat(sum).toFixed(2));

    });

    $(".calculate_item :input[type=number]").change(function(){
        var pay_amount = $(this).val();
        var id = $(this).data('id');
        var amount = $("#total_amount_"+id).val();

        var debit_note = $("#financepaybill-debit_note").val();

        if (parseFloat(pay_amount) > parseFloat(amount)) {
            $("#pay_amount_"+id).val(parseFloat(amount).toFixed(2));
        }

        if(pay_amount == '') {pay_amount = 0;}

        if(parseFloat(pay_amount) <= parseFloat(0)) {
            $("#checkbox_serial_column_"+id).prop('checked', false);
            $("#bill_id_"+id).attr('disabled',true);
            $("#description_"+id).attr('disabled',true);
            $("#bill_date_"+id).attr('disabled',true);
            $("#total_amount_"+id).attr('disabled',true);
            $("#pay_amount_"+id).attr('disabled',true);
        }

        var sum = 0;

        $(".checkbox_serial_column").each(function(){
            var id = $(this).data('id');
            var paid = 0;
            if($(this).is(':checked')){
                paid += parseFloat($("#pay_amount_"+id).val());
            }
            sum += parseFloat(paid);
        }); 

        $("#financepaybill-amount").val(parseFloat(sum).toFixed(2));
        $("#paid_amount").html(parseFloat(sum).toFixed(2));

        CheckBeforeSave();

    });

    $(".checkbox_serial_column").click(function(){
        var id = $(this).data('id');
        var chart_of_account_amount = $("#financepaybill-chart_of_account_amount").val();

        var sum_string_date = [];
        $(".checkbox_serial_column").each(function(){
            var active_id = $(this).data('id');
            var string_date = '';
            if($(this).is(':checked')){
                var bill_date = $("#bill_date_"+active_id).val();
                string_date += bill_date;
            }
            sum_string_date.push(string_date);
        });    
        sum_string_date = jQuery.grep(sum_string_date, function(n, i){
            return (n !== "" && n != null);
        });

        $('#financepaybill-date').val('');
        $('#financepaybill-date').removeClass('hasDatepicker');
        $('#financepaybill-date').datepicker(
            'setStartDate', get_max_date(sum_string_date)
        );

        if($(this).is(':checked')){
            var paid_amount = $("#financepaybill-amount").val();
            
            var total_amount = $("#total_amount_"+id).val();
            $("#pay_amount_"+id).val(parseFloat(total_amount).toFixed(2));

            var amount = $("#pay_amount_"+id).val();
            var total = parseFloat(paid_amount) + parseFloat(amount);

            $("#bill_id_"+id).attr('disabled',false);
            $("#doc_id_"+id).attr('disabled',false);
            $("#description_"+id).attr('disabled',false);
            $("#bill_date_"+id).attr('disabled',false);
            $("#total_amount_"+id).attr('disabled',false);
            $("#pay_amount_"+id).attr('disabled',false);
            
            $("#financepaybill-amount").val(parseFloat(total).toFixed(2));
            $("#paid_amount").html(parseFloat(total).toFixed(2));
        }else{
            var paid_amount = $("#financepaybill-amount").val();
            var amount = $("#pay_amount_"+id).val();
            var total = parseFloat(paid_amount) - parseFloat(amount);

            $("#bill_id_"+id).attr('disabled',true);
            $("#doc_id_"+id).attr('disabled',true);
            $("#description_"+id).attr('disabled',true);
            $("#bill_date_"+id).attr('disabled',true);
            $("#total_amount_"+id).attr('disabled',true);
            $("#pay_amount_"+id).attr('disabled',true);

            $("#financepaybill-amount").val(parseFloat(total).toFixed(2));
            $("#paid_amount").html(parseFloat(total).toFixed(2));
        }

        CheckBeforeSave();

    });

    $('#financepaybill-id_related_profile').change(function(){

        var id = $(this).val();
        
        $.ajax({
            url: base_url+'/expense/dependent',
            type: 'post',
            data: {
                id: id,
                action: 'get_bill_data'
            },
            success: function(response){

                var data = JSON.parse(response);

                var string = '';
                var i = 0;
                var total_amount = 0;
                var description = '';
                $("#check_all").prop('checked', true);
                
                $.each(data['data'], function(key,value){
                    if(value.balance_to_pay != 0){
                        i++;
                        total_amount = parseFloat(total_amount) + parseFloat(value.balance_amount);
                        description = value.description;
                        string = string + 
                                "<div class='row'>"+

                                    "<div class='col-md-1 text-center'>" +
                                        "<div class='checkbox'>"+
                                            "<input id='checkbox_serial_column_"+i+"' name='checkbox_serial_column[]' data-id="+i+" class='magic-checkbox checkbox_serial_column' value=1 checked type='checkbox'>"+
                                            "<label for='checkbox_serial_column_"+i+"'>"+i+"</label>"+
                                        "</div>"+
                                    "</div>" +

                                    "<div class='col-md-2 text-center'>"+
                                        "<input type='hidden' data-id="+i+" name='bill_date[]' readonly id='bill_date_"+i+"' value='"+ value.date +"' class='form-control'/>"+
                                        "<input type='hidden' data-id="+i+" name='bill_id[]' readonly id='bill_id_"+i+"' value='"+ value.id +"' class='form-control'/>"+
                                        "<input type='text' data-id="+i+" name='doc_id[]' readonly id='doc_id_"+i+"' value='"+ value.doc_id +"' class='form-control'/>"+
                                    "</div>"+

                                    "<div class='col-md-5 text-center'>"+
                                        "<input type='text' data-id="+i+" name='description[]' id='description_"+i+"' value='' class='form-control'/>"+
                                    "</div>"+
                                    
                                    "<div class='col-md-2 text-center'>"+
                                        "<div class='input-group'>" +
                                            "<span class='input-group-addon'><i class='fa fa-dollar'></i></span>" +
                                            "<input type='number' data-id="+i+" min=0 id='total_amount_"+i+"' readonly step=0.01 name='total_amount[]' value='"+ parseFloat(value.balance_amount).toFixed(2) + "' class='form-control total_amount'/>"+
                                        "</div>" +
                                    "</div>"+

                                    "<div class='col-md-2 text-center'>"+
                                        "<div class='input-group'>" +
                                            "<span class='input-group-addon'><i class='fa fa-dollar'></i></span>" +
                                            "<input type='number' data-id="+i+" min=0 id='pay_amount_"+i+"' step=0.01 name='paid_amount[]' value='"+ parseFloat(value.balance_amount).toFixed(2) + "' class='form-control pay_amount'/>"+
                                        "</div>" +
                                    "</div>"+

                                "</div>"+
                                "<div class='pad-btm'></div>";
                    }
                
                });

                if(string == ''){
                    string = "<div class='row'>"+
                                    "<div style='height: 80px;'>"+
                                        "<h3 class='text-center text-thin text-danger'>No Record Found !</h3>"+
                                    "</div>"+
                                "</div>";
                }
                $(".calculate_item").html(string);

                CheckBeforeSave();

                var max_date = data['max_date'];
                
                $('#financepaybill-date').datepicker({
                    format: 'yyyy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    autoclose: true,
                    setDate: max_date,
                    setStartDate: max_date,
                    todayBtn: "linked",
                    todayHighlight: true
                });

                $('#financepaybill-date').datepicker(
                    'setStartDate', max_date
                );


                $("#financepaybill-amount").val(parseFloat(total_amount).toFixed(2));
                $("#paid_amount").html(parseFloat(total_amount).toFixed(2));
                
                $("#check_all").click(function(){
                    $('.checkbox_serial_column').not(this).prop('checked', this.checked);
                    if($(this).is(':checked')){
                        $(".calculate_item input:text").prop('disabled', false);
                        $(".calculate_item input:hidden").prop('disabled', false);
                        $(".calculate_item select").prop('disabled', false);
                        $(".calculate_item input[type='number']").prop('disabled', false);
                    }else {
                        $(".calculate_item input:text").prop('disabled', true);
                        $(".calculate_item input:hidden").prop('disabled', true);
                        $(".calculate_item select").prop('disabled', true);
                        $(".calculate_item input[type='number']").prop('disabled', true);
                    }

                    var sum = 0;
                    $(".checkbox_serial_column").each(function(){
                        var id = $(this).data('id');
                        var paid = 0;
                        if($(this).is(':checked')){
                            paid += parseFloat($("#pay_amount_"+id).val());
                        }
                        sum += parseFloat(paid);
                    });
                    
                    $("#financepaybill-amount").val(parseFloat(sum).toFixed(2));
                    $("#paid_amount").html(parseFloat(sum).toFixed(2));

                });

                $(".calculate_item :input[type=number]").change(function(){
                    var pay_amount = $(this).val();
                    var id = $(this).data('id');
                    var amount = $("#total_amount_"+id).val();

                    var debit_note = $("#financepaybill-debit_note").val();

                    if (parseFloat(pay_amount) > parseFloat(amount)) {
                        $("#pay_amount_"+id).val(parseFloat(amount).toFixed(2));
                    }

                    if(pay_amount == '') {pay_amount = 0;}

                    if(parseFloat(pay_amount) <= parseFloat(0)) {
                        $("#checkbox_serial_column_"+id).prop('checked', false);
                        $("#bill_id_"+id).attr('disabled',true);
                        $("#description_"+id).attr('disabled',true);
                        $("#bill_date_"+id).attr('disabled',true);
                        $("#total_amount_"+id).attr('disabled',true);
                        $("#pay_amount_"+id).attr('disabled',true);
                    }

                    var sum = 0;

                    $(".checkbox_serial_column").each(function(){
                        var id = $(this).data('id');
                        var paid = 0;
                        if($(this).is(':checked')){
                            paid += parseFloat($("#pay_amount_"+id).val());
                        }
                        sum += parseFloat(paid);
                    }); 

                    $("#financepaybill-amount").val(parseFloat(sum).toFixed(2));
                    $("#paid_amount").html(parseFloat(sum).toFixed(2));

                    CheckBeforeSave();

                });

                $(".checkbox_serial_column").click(function(){
                    var id = $(this).data('id');
                    var chart_of_account_amount = $("#financepaybill-chart_of_account_amount").val();

                    var sum_string_date = [];
                    $(".checkbox_serial_column").each(function(){
                        var active_id = $(this).data('id');
                        var string_date = '';
                        if($(this).is(':checked')){
                            var bill_date = $("#bill_date_"+active_id).val();
                            string_date += bill_date;
                        }
                        sum_string_date.push(string_date);
                    });    
                    sum_string_date = jQuery.grep(sum_string_date, function(n, i){
                        return (n !== "" && n != null);
                    });

                    $('#financepaybill-date').val('');
                    $('#financepaybill-date').removeClass('hasDatepicker');
                    $('#financepaybill-date').datepicker(
                        'setStartDate', get_max_date(sum_string_date)
                    );

                    if($(this).is(':checked')){
                        var paid_amount = $("#financepaybill-amount").val();
                        
                        var total_amount = $("#total_amount_"+id).val();
                        $("#pay_amount_"+id).val(parseFloat(total_amount).toFixed(2));

                        var amount = $("#pay_amount_"+id).val();
                        var total = parseFloat(paid_amount) + parseFloat(amount);

                        $("#bill_id_"+id).attr('disabled',false);
                        $("#doc_id_"+id).attr('disabled',false);
                        $("#description_"+id).attr('disabled',false);
                        $("#bill_date_"+id).attr('disabled',false);
                        $("#total_amount_"+id).attr('disabled',false);
                        $("#pay_amount_"+id).attr('disabled',false);
                        
                        $("#financepaybill-amount").val(parseFloat(total).toFixed(2));
                        $("#paid_amount").html(parseFloat(total).toFixed(2));
                    }else{
                        var paid_amount = $("#financepaybill-amount").val();
                        var amount = $("#pay_amount_"+id).val();
                        var total = parseFloat(paid_amount) - parseFloat(amount);

                        $("#bill_id_"+id).attr('disabled',true);
                        $("#doc_id_"+id).attr('disabled',true);
                        $("#description_"+id).attr('disabled',true);
                        $("#bill_date_"+id).attr('disabled',true);
                        $("#total_amount_"+id).attr('disabled',true);
                        $("#pay_amount_"+id).attr('disabled',true);

                        $("#financepaybill-amount").val(parseFloat(total).toFixed(2));
                        $("#paid_amount").html(parseFloat(total).toFixed(2));
                    }

                    CheckBeforeSave();

                });

            },
            error:function(response){
                console.log(response);
            }
        });
    
    });

    function CheckBeforeSave() {
        var total_amount = $("#financepaybill-amount").val();
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

    function get_max_date(all_dates) {
        var max_date = all_dates[0],
        max_dateObj = new Date(all_dates[0]);
        all_dates.forEach(function(date, index){
            if ( new Date( date ) > max_dateObj){
                max_date = date;
                max_dateObj = new Date(date);
            }
        });
        return max_date;
    }


JS;

$this->registerJs($script);

?>