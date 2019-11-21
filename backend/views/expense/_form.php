<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use backend\models\UploadedFile;

$base_url =  Yii::getAlias('@web');

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->img_url;
    $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
    $command->bindParam(':id', $img_id);
    $my_id = $command->queryOne();
    if ($my_id == '') {
        $my_id = 1;
    }
    if($img_id == ''){
        $img_id = 1;
        $my_id = $img_id;
    }  
    $img_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;
 
}
// $img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);
$img_url = $base_url . '/' . $img_url;

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span> {input} </div>{error}{hint}';

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()->where(['status'=>1])
    ->all(), 'id', 'names');

$related_to = ArrayHelper::map(\backend\models\ExpenseRelatedTo::find()
    ->all(), 'id', 'name'); 

$project = ArrayHelper::map(\backend\models\Project::find()
    ->all(), 'id', 'project_name'); 

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

if(!$model->isNewRecord ){
    $project_id = 0;
}
if($model->isNewRecord == true){
    if($model->id_related_to == 3 || $project_id > 0 ){ //Project
        $response = Yii::$app->db->createCommand("
            SELECT id, project_name as profile_name
            FROM project
        ")->queryAll();
        $realted_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
    }
}else{
    if($model->id_related_to == 3){
        $response = Yii::$app->db->createCommand("
            SELECT id, project_name as profile_name
            FROM project
        ")->queryAll();
        $realted_to_profile = ArrayHelper::map($response, 'id', 'profile_name'); 
    }
}


$sql = "SELECT * FROM chart_account WHERE id_account_type =3 AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type =3)";
$chart_of_account = \backend\models\ChartAccount::findBySql($sql)->all();

$account_type = ArrayHelper::map($chart_of_account, 'id', 'names');

/*
    Other Expense Account Type:
    - 2  Expense               +Debit
    - 5  Other Expense         +Debit  
    - 7  Equity                +Debit    
    - 8  Current Liabilities   +Debit
    - 9  Current Asset         +Debit
    - 46 Fixed Asset           +Debit
*/

$sql = "SELECT id, CONCAT(names, ' | ', number_code) as names
        FROM chart_account 
        WHERE id_account_type in (2,5,7,8,9,46)
        AND id NOT IN( SELECT is_parent FROM chart_account WHERE id_account_type in (2,5,7,8,9,46))
        ORDER BY names ASC";
$command = Yii::$app->db->createCommand($sql);
$chart_of_account_name = $command->queryAll();

$available_amount = 0;
if(!$model->isNewRecord){
    if($model->is_bill == 0){
        $available_amount = $chart_of_account_bank_amount + $model->total_amount;
    }else{
        $available_amount = $chart_of_account_bank_amount;
    }
}
$available_amount = number_format($available_amount, 2, '.', '');

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
    .calculate_item, 
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
    }
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

    $validationUrl = ['expense/validation'];
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
        <div class="col-md-3">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Attachment Image</h3>
                </div>
                <div class="panel-body">
                    <div style="display: none">
                        <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                    </div>   
                    <div class="wr_img">
                        <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                            <label for = 'expense-file'>
                                <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                            </label>
                        <?php } else {?>
                            <label for="expense-file">
                                <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                            </label>
                        <?php } ?>
                    </div> 
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Detail</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'date',['template'=>$date_template])->textInput(['value' => $model->isNewRecord?date('Y-m-d'):$model->date, 'readonly'=>true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                        </div>

                        <div class="col-md-4">
                            <?= $form->field($model, 'id_related_to')->widget(Select2::classname(), [
                                    'data' => $related_to,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_related_profile')->widget(Select2::classname(), [
                                    'data' => $realted_to_profile,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>  
                        </div>
                        
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'is_bill')->widget(Select2::classname(), [
                                'data' => [0=>'Cash', 1=>'Bill'],
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'pluginOptions' => [
                                    'allowClear' => false,
                                    'disabled' => $model->isNewRecord ? false : true ,
                                ]]);
                            ?>          
                        </div>
                        <div class="col-md-8">
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
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                                'data' => $payment_method,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'pluginOptions' => [
                                    'allowClear' => false
                                ]]);
                            ?>          
                        </div>

                        <div class="col-md-4 row_cheuqe_method <?= $model->id_payment_method ==3?'':'hide' ?>">
                            <?= $form->field($model, 'cheque_number')->textInput(['type'=>'number', 'min'=>0, 'maxlength'=>10]) ?>
                        </div>

                        <div class="col-md-4 row_cheuqe_method <?= $model->id_payment_method ==3?'':'hide' ?>">
                            <?= $form->field($model, 'clearing_date',['template'=>$date_template])->textInput(['readonly' => true, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="pull-right-data">

        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-3 text-left">
                        <label class="panel-title">Chart of Account</label>
                    </div>
                    <div class="col-md-6 text-left">
                        <label class="panel-title">Description</label>
                    </div>
                    <div class="col-md-2 text-right">
                        <label class="panel-title">Amount</label>
                    </div>
                    <div class="col-md-1 text-center">
                        <label class="panel-title">#</label>
                    </div>
                </div>
            </div>
            <?php 
                if($model->isNewRecord){
            ?>
            <div class="panel-body calculate_item">
                <div class="row row_line" data-id=1 id="row_line_1">
                    <div class="col-md-3 text-left">
                        <select class="form-control chart_of_account_name" name="chart_of_account_name[]" data-id=1 id="chart_of_account_name_1">
                        <?php 
                            foreach ($chart_of_account_name as $key => $value) {
                                echo "<option value=".$value['id'].">". $value['names'] ."</option>";
                            }
                        ?>
                        </select>
                    </div>
                    <div class="col-md-6 text-left">
                        <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" />
                    </div>
                    <div class="col-md-2 text-right amount">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                            <input type="number" min=0.01 id="amount_1" data-id=1 step=0.01 name="amount[]" required value="0" class="form-control amount"/>
                        </div>
                    </div>
                    <div class="col-md-1 text-center">
                        <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle action_button" id="add_more"><i class="fa fa-plus"></i></button>
                    </div>
                </div>
            </div>
            <?php }else{ ?>
                <div class="panel-body calculate_item">
                <?php 
                    $other_income_data = \backend\models\ExpenseData::find()
                        ->where(['id_expense'=>$model->id])
                        ->asArray()
                        ->all();

                    if(!empty($other_income_data)){
                        $i = 0;
                        foreach ($other_income_data as $key => $value) {
                            $i++;
                ?>
                    <div class="row row_line" data-id="<?= $i ?>" id="row_line_<?= $i ?>">
                        <div class="col-md-3 text-left">
                            <select class="form-control chart_of_account_name" name="chart_of_account_name[]" data-id=1 id="chart_of_account_name_<?= $i ?>">
                            <?php 
                                $chart_of_account = \backend\models\ChartAccount::find()
                                ->where(['status'=>1])
                                ->andWhere(['in', 'id_account_type', [2,5,8,9,46]])
                                ->orderBy(['names'=>SORT_ASC])
                                ->all();

                                foreach ($chart_of_account as $key => $val) {
                                    if($value['chart_of_account'] == $val->id){
                                        $selected = 'selected';
                                    }else{
                                        $selected = '';
                                    }
                                    echo "<option ".$selected." value=".$val->id.">".$val->names . ' | ' . $val->number_code."</option>";
                                }
                            ?>
                            </select>
                        </div>
                        <div class="col-md-6 text-left">
                            <input type="text" name="description[]" placeholder="Description…" class="form-control description" value="<?= $value['description'] ?>" data-id="<?= $i ?>" id="description_<?= $i ?>" />
                        </div>
                        <div class="col-md-2 text-right amount">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                <input type="number" min=0.01 id="amount_<?= $i ?>" data-id="<?= $i ?>" step=0.01 name="amount[]" required value="<?= $value['amount'] ?>" class="form-control amount"/>
                            </div>
                        </div>
                        <div class="col-md-1 text-center">
                            <?php if($i == 1){ ?>
                            <button type="button" class="btn btn-sm btn-icon btn-circle btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                            <?php }else{ ?>
                            <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                            <?php } ?>
                        </div>
                    </div>
                <?php } } ?>
            </div>
            <?php } ?>
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
                                    <?= $form->field($model, 'total_amount')->hiddenInput(['min'=>0,'type'=>'number', 'step'=>0.01]) ?>  
                                </div>
                            </td>
                            <td class="text-bold h4" id="total_amount"><?= number_format($model->isNewRecord?0:$model->total_amount,2, '.', '') ?> </td>
                        </tr>
                        <?php 
                            if(!$model->isNewRecord){
                                if($model->is_bill == 1){
                        ?>
                                <tr>
                                    <td class="text-info"><strong>Bill has paid :</strong></td>
                                    <td class="text-info text-bold h5"><?= number_format($model->paid_amount,2, '.', '') ?> </td>
                                </tr>
                        <?php
                                }
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="line15"></div>
    <div class="form-group pull-right">
        <?php 
            if(!$model->isNewRecord){ 
                if($model->status <> 5) { 
                    if($model->is_bill == 1 && $model->paid_amount == 0){
        ?>
                        <a class="btn btn-rounded btn-danger button-void" data-value="<?= \yii\helpers\Url::to(['expense/void-expense', 'id' => $model->doc_id]); ?>" title="VOID" data-confirm="Are you sure want to void this file?" data-method="post">VOID</a>
        <?php 
                    }
                } 
            } 
        ?>
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

$chart_of_account_json = json_encode($chart_of_account_name);

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

    var isNewRecord = parseInt("$isNewRecord");

    var dataToString = JSON.stringify($chart_of_account_json);
    var stringReplaced = dataToString.replace(/'/g, "&#39;");
    var misc_data = JSON.parse(stringReplaced);

    var string_misc_data = "";
    $.each(misc_data,function(key,value){
        string_misc_data = string_misc_data + "<option value="+value.id+">"+value.names+"</option>";
    });

    var base_url = "$base_url";

    var project_id = "$project_id";
    
    if(project_id > 0){
        $("#expense-id_related_to").val(3).trigger("change");
        $("#expense-id_related_profile").val(project_id).trigger("change");
    }

    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    $("#expense-date").change(function(){

        $('#expense-clearing_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#expense-clearing_date').val())){
            $('#expense-clearing_date').datepicker('setDate', $(this).val());
        }

    });

    $('#expense-date, #expense-clearing_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

    if($("#expense-id_payment_method").val() == 3){
        $('#expense-clearing_date').datepicker('setStartDate', $("#expense-date").val());
    }


    $("#expense-id_payment_method").change(function(){
        var id = $(this).val();
        if (id ==3 ){
            $(".row_cheuqe_method").removeClass('hide');
            $(".row_cheuqe_method").hide();
            $(".row_cheuqe_method").slideDown();
            $('#expense-clearing_date').datepicker('setStartDate', $("#expense-date").val());
        }else{
            $(".row_cheuqe_method").slideUp();
        }
    });

    $("#expense-chart_of_account").change(function(){
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
                var id = $("#financepaybill-chart_of_account").val();
                var current_id = parseInt("$model->chart_of_account");
                if(isNewRecord == 0){
                    if(id == current_id){
                        var add_amount = parseFloat("$model->total_amount");
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

    $("#expense-id_related_to").change(function(){
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

                console.log(data);

                var str = "<option></option>";
                $.each(data,function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.profile_name+'</option>';
                });
                $('#expense-id_related_profile').html(str);
            }
        });

    });


    $(".calculate_item :input[type=number]").change(function(){        
        var sum = 0;

        $(".amount :input[type=number]").each(function(){
            sum += +$(this).val();
        });

        $("#expense-total_amount").val(parseFloat(sum).toFixed(2));
        $("#total_amount").text(parseFloat(sum).toFixed(2));

        CheckBeforeSave();

    });

    var data_i = $(document).find('.description[data-id]:last').attr('data-id'); 
    var i = parseInt(data_i);

    $('#add_more').unbind('click');
    $('#add_more').bind('click', function (e){
        e.preventDefault();

        var last_desc = $('.description[data-id='+i+']').val();
        var amount = $('.amount[data-id='+i+']').val();
        var rate = $('.rate[data-id='+i+']').val();
        
        if(last_desc ==''){
            swal("Information", "Description can not blank!", "warning");
            return false;
        }
        if(amount =='' || amount <= 0.0001){
            swal("Information", "Amount can not zero or null!", "warning");
            return false;
        }
        i++;

        var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                        "<div class='col-md-3'>" +
                            "<select name='chart_of_account_name[]' class='form-control chart_of_account_name' id='chart_of_account_name_"+i+"' data-id="+i+">" +
                                string_misc_data +
                            "</select>" +   
                        "</div>" +
                        "<div class='col-md-6 text-center'>" +
                            "<input type='text' class='form-control description' name='description[]' id='description_"+i+"' data-id="+i+" placeholder='Description…' class='form-control'>" +
                        "</div>" +
                        "<div class='col-md-2 text-right amount'>" +
                            "<div class='input-group'>" +
                                "<span class='input-group-addon'><i class='fa fa-dollar'></i></span>" +
                                "<input type='number' required data-id="+i+" id='amount_"+i+"' step='0.01' min=0.01 class='form-control amount' name='amount[]' value='"+parseFloat(0).toFixed(2)+"'>" +
                            "</div>" +
                        "</div>" +
                        "<div class='col-md-1 text-center'>" +
                            "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                "<i class='fa fa-minus'></i>" +
                            "</button>" +
                        "</div>" +
                    "</div>";

        $('.calculate_item').append(string);

        $(".calculate_item :input[type=number]").change(function(){        
            var sum = 0;

            $(".amount :input[type=number]").each(function(){
                sum += +$(this).val();
            });

            $("#expense-total_amount").val(parseFloat(sum).toFixed(2));
            $("#total_amount").text(parseFloat(sum).toFixed(2));

        });

        CheckBeforeSave();

        $(function () {
          $('.chart_of_account_name').change(function() {
            var used = new Set;
            $('.chart_of_account_name').each(function () {
              var reset = false;
              $('option', this).each(function () {
                var hide = used.has($(this).text());
                if (hide && $(this).is(':selected')) reset = true;
                $(this).prop('hidden', hide);
              });
              if (reset) $('option:not([hidden]):first', this).prop('selected', true);  
              used.add($('option:selected', this).text());
            });
          }).trigger('change'); // run at load
        });

    });

    $(function () {
      $('.chart_of_account_name').change(function() {
        var used = new Set;
        $('.chart_of_account_name').each(function () {
          var reset = false;
          $('option', this).each(function () {
            var hide = used.has($(this).text());
            if (hide && $(this).is(':selected')) reset = true;
            $(this).prop('hidden', hide);
          });
          if (reset) $('option:not([hidden]):first', this).prop('selected', true);  
          used.add($('option:selected', this).text());
        });
      }).trigger('change'); // run at load
    });

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id'); 
        
        var sum = 0;

        $(".amount :input[type=number]").each(function(){
            sum += +$(this).val();
        });

        $("#expense-total_amount").val(parseFloat(sum).toFixed(2));
        $("#total_amount").text(parseFloat(sum).toFixed(2));

        i--;
        var id = $(this).attr('data-id'); 
        $('#row_line_'+ id).remove();
        
    });

    $("#expense-is_bill").change(function(){
        CheckBeforeSave();
    });


    function CheckBeforeSave() {
        var isNewRecord = parseInt("$isNewRecord");

        var total_amount = $("#expense-total_amount").val();
        total_amount = parseFloat(total_amount);

        var is_bill = $("#expense-is_bill").val();
        is_bill = parseInt(is_bill);

        var chart_account_balance = $("#chart_of_account_amount").text();
        chart_account_balance = parseFloat(chart_account_balance);

        if(total_amount <= 0){
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }
    
        if(isNewRecord == 0){
            var paid_amount = "$model->paid_amount";
            paid_amount = parseFloat(paid_amount);
            if(is_bill == 1){
                if(total_amount < paid_amount){
                    $("#pay-button").prop('disabled', true);
                    $("#pay-button").addClass('disabled');
                    swal(
                        "Warning", 
                        "You cannot apply an amount lower than the paid amount, please check your balance.", 
                        "warning"
                    );
                }else{
                    $("#pay-button").removeAttr('disabled');
                    $("#pay-button").removeClass('disabled');
                }
            }
        }

        if(is_bill == 0){
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
        }else {
            $("#pay-button").removeAttr('disabled');
        }

    }

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });



    $(function () {
      $("#expense-file").change(function () {
        readURL(this);
      });
      $("#expense-file").hide();
    });

    function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            x= e.target.result;
              $('#feature_images').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
    }

JS;

$this->registerJs($script);

?>


