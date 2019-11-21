<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;


$base_url = Yii::getAlias('@web');

$customer = ArrayHelper::map(\backend\models\CustomerProfile::find()
    ->all(), 'id', function($model){return $model->customer_name . ' ('.$model->company_name . ')';});
if(!$model->isNewRecord){
$project = ArrayHelper::map(\backend\models\Project::find()
    ->where(['id_customer'=>$model->id_customer])
    ->all(), 'id', 'project_name');
}else{
    if($project_id > 0){
    $project = ArrayHelper::map(\backend\models\Project::find()
        ->where(['id'=>$project_id])
        ->all(), 'id', 'project_name');
    }else{
        $project = [];
    }
}

$currency = ArrayHelper::map(\backend\models\Currency::find()
    ->all(), 'id', 'name');

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()
    ->all(), 'id', function($model){return $model->names;});

$repeater = ArrayHelper::map(\backend\models\RepeaterType::find()
    ->all(), 'id', 'name');

$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});

$item = ArrayHelper::map(\backend\models\Item::find()
    ->all(), 'id', 'description');

$tax_value = \backend\models\Tax::findOne(1)->value;

$tax = ArrayHelper::map(\backend\models\Tax::find()
    ->all(), 'id', 'tax_name');

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

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
    .action_button {
        width: 30px !important;
        height: 30px !important;
        padding: 0px !important;
        border-radius: 50%;
    }
    .calculate_item input {
        background: #fff !important;
    }
    .row_line {
        padding-bottom: 15px;
    }
    #container .invoice-total>tbody>tr td:last-child {
        width: 120px !important;
    }
    #container .invoice-total>tbody>tr td:first-child {
        width: 120px !important;
    }

    #container .invoice-total {
        max-width: 100% !important;
    }

    .invoice-total tr td {
        font-size: 15px;
    }
</style>
<div class="customer-invoice-form">

    <?php

        $validationUrl = ['customer-invoice/validation'];
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
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'id_customer')->widget(Select2::classname(), [
                        'data' => $customer,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => 'Select'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 label-input">
                    <?= $form->field($model, 'shipping_to')->textInput(['maxlength' => true, 'readonly' => true, 'value'=>$model->isNewRecord?'':$model_customer->shipping_address]) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 label-input">
                    <?= $form->field($model, 'billing_to')->textInput(['maxlength' => true, 'readonly' => true, 'value'=>$model->isNewRecord?'':$model_customer->billing_address]) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'id_project')->widget(Select2::classname(), [
                        'data' => $project,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => 'Select'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]); ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'date', ['template'=>$date_template])->textInput(['value'=>$model->isNewRecord?date('Y-m-d'):$model->date, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'due_date', ['template'=>$date_template])->textInput(['value'=>$model->isNewRecord?date('Y-m-d', strtotime('+1 month')):$model->due_date, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
            </div>
        </div>
        <!-- Customer Information -->
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <?php
                        if(!$model->isNewRecord){
                            $tag_arr = \backend\models\CustomerInvoiceTag::find()
                                ->select('id_tag')
                                ->where(['id_customer_invoice'=>$model->id])
                                ->asArray()
                                ->all();
                            $row_tag = [];
                            if(!empty($tag_arr)){
                                foreach($tag_arr as $d){
                                    $row_tag[]=$d['id_tag'];
                                }
                            }
                        }else{
                            $row_tag = [];
                        }

                    ?>
                    <label>Tag</label>
                    <?= Select2::widget([
                            'name' => 'tag[]',
                            'value'=>$row_tag,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'customer_invoice_tag'],
                            'pluginOptions' => [
                                'tags' => true,
                                'tokenSeparators' => [',', ' '],
                                'maximumInputLength' => 10,
                                'allowClear' => true
                            ],
                        ]);
                    ?>
                    <div class="line15"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                        'data' => $payment_method,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => 'Select'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]); ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'currency')->widget(Select2::classname(), [
                        'data' => $currency,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]); ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'id_recurring_invoice')->widget(Select2::classname(), [
                        'data' => $repeater,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        // 'options' => ['placeholder' => 'Select'],
                        'pluginOptions' => [
                            'allowClear' => false
                        ],
                    ]); ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'id_sale_agent')->widget(Select2::classname(), [
                        'data' => $employee_list,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => 'Select'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]); ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'admin_note')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'client_note')->textInput(['maxlength' => true]) ?>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <hr/>
            <h3 style="background: #eeeeee;padding: 10px;margin-bottom: 20px;">Add Items:</h3>
            <div class="row">
                <div class="col-md-4">
                    <?= Select2::widget([
                        'name' => 'id_assign_item',
                        'data' => $item,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => ' Add Items', 'id'=>'id_assign_item'],
                        'pluginOptions' => [
                            'allowClear' => false
                        ],
                    ]); ?>
                </div>
            </div>
            <hr/>
        </div>
    </div>

    <div class="panel panel-bordered panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-2">
                    <h3 class="panel-title">Item</h3>
                </div>
                <div class="col-md-4">
                    <h3 class="panel-title">Description</h3>
                </div>
                <div class="col-md-1">
                    <h3 class="panel-title">Qty</h3>
                </div>
                <div class="col-md-1">
                    <h3 class="panel-title">Rate</h3>
                </div>
                <div class="col-md-2 text-center">
                    <h3 class="panel-title">Discount</h3>
                </div>
                <div class="col-md-1">
                    <h3 class="panel-title">Amt.</h3>
                </div>
                <div class="col-md-1">
                    <h3 class="panel-title"><i class="demo-psi-gear"></i></h3>
                </div>
            </div>
        </div>
        <div class="panel-body calculate_item">
            <?php
                if($model->isNewRecord){
            ?>
            <div class="row row_line" data-id=1 id="row_line_1">
                <div class="col-md-2">
                    <input type="text" readonly name="item[]" placeholder="Description…" class="form-control item" data-id=1 id="item_1" />
                    <input type="hidden" name="item_id[]" class="form-control item_id" data-id=1 id="item_id_1" />
                </div>
                <div class="col-md-4">
                    <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="qty[]" value=1 min="1" class="form-control qty" data-id=1 id="qty_1" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="rate[]" value="<?= number_format(0,2) ?>" min="0" readonly class="form-control rate" data-id=1 id="rate_1" />
                </div>
                <div class="col-md-1">
                    <select class="form-control discount_type" name="discount_type[]" data-id=1 id="discount_type_1">
                        <option value="1">%</option>
                        <option value="2">Amount</option>
                    </select>
                </div>
                <div class="col-md-1">
                    <input type="number" name="discount[]" value="0" min="0" class="form-control discount" data-id=1 id="discount_1" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="amount[]" min="0" value="<?= number_format(0,2) ?>" readonly class="form-control amount" data-id=1 id="amount_1" />
                </div>
                <div class="col-md-1 text-center">
                    <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <?php
                }else{
                    $i = 0;
                    foreach ($model_item as $key => $value) {
                        $i++;
            ?>
            <div class="row row_line" data-id="<?= $i; ?>" id="row_line_<?= $i; ?>">
                <div class="col-md-2">
                    <input type="text" readonly name="item[]" value="<?= $value->item_name; ?>" class="form-control item" data-id="<?= $i; ?>" id="item_<?= $i; ?>" />
                    <input type="hidden" name="item_id[]" value="<?= $value->id_item; ?>" class="form-control item_id" data-id="<?= $i; ?>" id="item_id_<?= $i; ?>" />
                </div>
                <div class="col-md-4">
                    <input type="text" name="description[]" value="<?= $value->description; ?>" placeholder="Description…" class="form-control description" data-id="<?= $i; ?>" id="description_<?= $i; ?>" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="qty[]" value="<?= $value->qty; ?>" min="0" class="form-control qty" data-id="<?= $i; ?>" id="qty_<?= $i; ?>" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="rate[]" value="<?= $value->rate; ?>" min="0" readonly class="form-control rate" data-id="<?= $i; ?>" id="rate_<?= $i; ?>" />
                </div>
                <div class="col-md-1">
                    <select class="form-control discount_type" name="discount_type[]" data-id="<?= $i; ?>" id="discount_type_<?= $i; ?>">
                        <option value="1" <?= $value->discount_type == 1 ?'selected':'' ?> >%</option>
                        <option value="2" <?= $value->discount_type == 2 ?'selected':'' ?> >Amount</option>
                    </select>
                </div>
                <div class="col-md-1">
                    <input type="number" name="discount[]" value="<?= $value->discount_amount; ?>" min="0" class="form-control discount" data-id="<?= $i; ?>" id="discount_<?= $i; ?>" />
                </div>
                <div class="col-md-1">
                    <input type="number" name="amount[]" min="0" value="<?= $value->amount; ?>" readonly class="form-control amount" data-id="<?= $i; ?>" id="amount_<?= $i; ?>" />
                </div>
                <div class="col-md-1 text-center">
                    <?php if($i == 1){ ?>
                    <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                    <?php }else{ ?>
                    <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                    <?php } ?>
                </div>
            </div>
            <?php }} ?>
        </div>
    </div>

    <div class="clearfix">
        <div class="row">
            <div class="col-md-8">
                <?= $form->field($model, 'term_condition')->textArea(['rows' => 5]) ?>
            </div>
            <div class="col-md-4">
                <table class="table invoice-total">
                    <tbody>
                        <tr>
                            <td colspan="2"><strong>Sub Total :</strong>
                                <input type="hidden" name="sub_total_amount_hidden" value="<?= number_format($model->isNewRecord?0:$model->sub_total,2, '.', '') ?>" id="sub_total_amount_hidden">
                            </td>
                            <td id="sub_total_amount"><?= number_format($model->isNewRecord?0:$model->sub_total,2, '.', '') ?> </td>
                        </tr>
                        <tr>
                            <td><strong>Discount: </strong></td>
                            <td>
                                <div class="input-group">
                                    <input type="number" value="<?= number_format($model->isNewRecord?0:$model->discount_value,2, '.', '') ?>" id="discount_overall" min="0" step="0.01" name="discount_overall" class="form-control">
                                    <input type="hidden" value="<?= number_format($model->isNewRecord?0:$model->discount_amount,2, '.', '') ?>" id="discount_overall_amount" min="0" step="0.01" name="discount_overall_amount" class="form-control">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default dropdown-toggle btn-primary" id="label-discount" data-toggle="dropdown"> <?= $model->isNewRecord? '%' : $model->id_discount == 1? '%' : 'Amount' ?> <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" id="discount_type_overall">
                                            <li data-id="1"><a href="#">%</a></li>
                                            <li data-id="2"><a href="#">Amount</a></li>
                                        </ul>
                                        <input type="hidden" name="discount_type_overall_hidden" value="<?= $model->isNewRecord?1:$model->id_discount; ?>" id="discount_type_overall_hidden">
                                    </div>
                                </div>
                            </td>
                            <td id="total_discount" style="vertical-align: middle !important;"><?= number_format($model->isNewRecord?0:$model->discount_amount,2, '.', '') ?></td>
                        </tr>
                        <tr>
                            <td><strong>TAX Include: </strong></td>
                            <td>
                                <div class="input-group mar-btm">
                                    <input type="number" placeholder="TAX" value="<?= $tax_value; ?>" style="background-color: #fff;" readonly class="form-control">
                                    <div class="input-group-btn dropdown">
                                        <button class="btn btn-primary" type="button">
                                            <input type="checkbox" value="1" <?= $model->is_tax ==1? 'checked':''; ?> id="allow_tax" name="allow_tax" /> VAT(%)
                                        </button>
                                    </div>
                                </div>
                                <input type="hidden" name="total_tax_hidden" value="<?= number_format($model->isNewRecord?0:$model->tax_amount,2, '.', '') ?>" id="total_tax_hidden">
                            </td>
                            <td id="total_tax" style="padding-top: 15px;"><?= number_format($model->isNewRecord?0:$model->tax_amount,2, '.', '') ?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><strong>TOTAL :</strong>
                                <input type="hidden" name="grand_total_amount_hidden" value="<?= number_format($model->isNewRecord?0:$model->total_amount,2, '.', '') ?>" id="grand_total_amount_hidden">
                            </td>
                            <td class="text-bold h4" id="grand_total_amount"><?= number_format($model->isNewRecord?0:$model->total_amount,2, '.', '') ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal-footer">
        <div class="text-right">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded','id'=>'pay-button']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>
</div>
<?php

$script = <<<JS

    var base_url = "$base_url";
    var project_id = "$project_id";

    if(project_id > 0){
        $("#customerinvoice-id_project").val(project_id).trigger("change");
    }


    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    //~~~~~~~~~~~~~~~ Date Picker~~~~~~~~~~~~~~~

    $("#customerinvoice-date").change(function(){

        $('#customerinvoice-due_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#customerinvoice-due_date').val())){
            $('#customerinvoice-due_date').datepicker('setDate', $(this).val());
        }

    });

    $('#customerinvoice-date, #customerinvoice-due_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Start Assign Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        $("#customerinvoice-id_customer").change(function(){
            var id = $(this).val();

            if(id != ''){
                $.ajax({
                    url: base_url+'/customer-invoice/dependent',
                    type: 'post',
                    data: {
                        id: id,
                        action: 'get_customer_data'
                    },
                    success: function(response){
                        var data = JSON.parse(response);
                        if(data['customer'] != ''){
                            $("#customerinvoice-shipping_to").val(data['customer']['shipping_address']);
                            $("#customerinvoice-billing_to").val(data['customer']['billing_address']);
                        }
                        if(data['project'] != ''){
                            var str = "";
                            $.each(data['project'],function(key,value){
                                str = str + '<option value="'+value.id+'">'+value.project_name+'</option>';
                            });
                            $('#customerinvoice-id_project').html(str);
                        }
                    }
                });
            }
        });
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Assign Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Change before add item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $(".calculate_item :input[type=number]").change(function(){
            var sum = 0;

            $(".calculate_item .row_line").each(function(){
                var id = $(this).data('id');
                var qty = $("#qty_"+id).val();
                var rate = $("#rate_"+id).val();
                var discount = $("#discount_"+id).val();
                var discount_type = $("#discount_type_"+id).val();
                var discount_amount = 0;

                var amount = $("#amount_"+id).val();

                var total_amount = parseFloat(qty) * parseFloat(rate);

                if(parseInt(discount_type) == 1){
                    $("#discount_"+id).attr('max', 100);

                    if(parseFloat(discount) > 100){
                        $("#discount_"+id).val(parseFloat(100).toFixed(2));
                        discount = parseFloat(100);
                    }
                    discount_amount = (parseFloat(total_amount) * parseFloat(discount)) / 100;
                }else{
                    $("#discount_"+id).attr('max', parseFloat(rate).toFixed(2));

                    if(parseFloat(discount) > parseFloat(rate)){
                        $("#discount_"+id).val(parseFloat(rate).toFixed(2));
                        discount = parseFloat(rate).toFixed(2);
                    }
                    discount_amount = parseFloat(discount);
                }

                total_amount = parseFloat(total_amount) - parseFloat(discount_amount);
                $("#amount_"+id).val(parseFloat(total_amount).toFixed(2));

                var paid = 0;
                paid += parseFloat($("#amount_"+id).val());
                sum += parseFloat(paid);

            });

            calculationNumber();

            $("#sub_total_amount").html(parseFloat(sum).toFixed(2));

        });

    calculationNumber();
    CheckBeforeSave();
    // calculateDiscount();

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END Change before add item~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.amount[data-id]:last').attr('data-id');
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            var item = $('.item[data-id='+i+']').val();
            if(item ==''){
                swal("Information", "Item can not blank!", "warning");
                return false;
            }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-2'>" +
                                "<input type='text' name='item[]' readonly placeholder='Description…' class='form-control item' data-id="+i+" id='item_"+i+"' />" +
                                "<input type='hidden' name='item_id[]' data-id="+i+" id='item_id_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-4'>" +
                                "<input type='text' name='description[]' placeholder='Description…' class='form-control description' data-id="+i+" id='description_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-1'>" +
                                "<input type='number' name='qty[]' min=1 value=1 class='form-control qty' data-id="+i+" id='qty_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-1'>" +
                                "<input type='number' readonly data-id="+i+" id='rate_"+i+"' step='0.01' min=0 class='form-control' name='rate[]' value='"+parseFloat(0).toFixed(2)+"'>" +
                            "</div>" +
                            "<div class='col-md-1'>" +
                                "<select name='discount_type[]' class='form-control discount_type' id='discount_type_"+i+"' id='misc_name_"+i+"' data-id="+i+">" +
                                    "<option value=1>%</option>" +
                                    "<option value=2>Amount</option>" +
                                "</select>" +
                            "</div>" +
                            "<div class='col-md-1'>" +
                                "<input type='number' data-id="+i+" id='discount_"+i+"' step='0.01' min=0 class='form-control' name='discount[]' value='0'>" +
                            "</div>" +
                            "<div class='col-md-1'>" +
                                "<input type='number' readonly data-id="+i+" id='amount_"+i+"' step='0.01' min=0 class='form-control' name='amount[]' value='"+parseFloat(0).toFixed(2)+"'>" +
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove ' id='remove_row_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>"
                        ;

            $('.calculate_item').append(string);

            $("#id_assign_item").val('').trigger('change');

            calculationNumber();
        });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Start Assign Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        $("#id_assign_item").change(function(){
            var id = $(this).val();

            if(id != ''){
                $.ajax({
                    url: base_url+'/customer-invoice/dependent',
                    type: 'post',
                    data: {
                        id: id,
                        action: 'get_item_data'
                    },
                    success: function(response){
                        var data = JSON.parse(response);
                        // console.log(data);

                        if(data != ''){

                            $("#item_"+i).val(data['description']);
                            $("#item_id_"+i).val(data['id']);
                            $("#description_"+i).val(data['short_description']);
                            $("#rate_"+i).val(parseFloat(data['rate']).toFixed(2));

                            var rate = $("#rate_"+i).val();
                            rate = parseFloat($("#rate_"+i).val());

                            var qty = $("#qty_"+i).val();
                            qty = parseInt(qty);

                            var amount_calc = qty * rate;
                            $("#amount_"+i).val(parseFloat(amount_calc).toFixed(2));
                            calculationNumber();
                        }

                    }
                });

            }
        });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Assign Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id');

        var sum = 0;

        $(".amount :input[type=number]").each(function(){
            sum += +$(this).val();
        });

        $("#sub_total_amount").html(parseFloat(sum).toFixed(2));

        calculationNumber();

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_'+ id).remove();
        $("#id_assign_item").val('').trigger('change');

    });

    $("#discount_type_overall li").click(function(){
        $("#discount_type_overall_hidden").val($(this).data('id'));
        $("#discount_overall").val(0);
        $("#total_discount").text(parseFloat(0).toFixed(2));
        if($(this).data('id') == 1){
            $("#label-discount").html('% <span class="caret"></span>');
        } else {
            $("#label-discount").html('Amount <span class="caret"></span>');
        }
    });

    function calculationNumber() {
        var sum = 0;

        $(".calculate_item .row_line").each(function(){
            var id = $(this).data('id');
            var qty = $("#qty_"+id).val();
            var rate = $("#rate_"+id).val();
            var discount = $("#discount_"+id).val();
            var discount_type = $("#discount_type_"+id).val();
            var discount_amount = 0;
            var amount = $("#amount_"+id).val();

            var total_amount = parseFloat(qty) * parseFloat(rate);

            if(parseInt(discount_type) == 1){
                $("#discount_"+id).attr('max', 100);

                if(parseFloat(discount) > 100){
                    $("#discount_"+id).val(parseFloat(100).toFixed(2));
                    discount = parseFloat(100).toFixed(2);
                }
                discount_amount = (parseFloat(total_amount) * parseFloat(discount)) / 100;
            }else{
                $("#discount_"+id).attr('max', parseFloat(rate).toFixed(2));

                if(parseFloat(discount) > parseFloat(rate)){
                    $("#discount_"+id).val(parseFloat(rate).toFixed(2));
                    discount = parseFloat(rate).toFixed(2);
                }
                discount_amount = parseFloat(discount);
            }

            total_amount = parseFloat(total_amount) - parseFloat(discount_amount);
            $("#amount_"+id).val(parseFloat(total_amount).toFixed(2));

            var paid = 0;
            paid += parseFloat($("#amount_"+id).val());
            sum += parseFloat(paid);
        });

        $("#sub_total_amount").html(parseFloat(sum).toFixed(2));
        $("#sub_total_amount_hidden").val(parseFloat(sum).toFixed(2));

        calculateDiscount();
        calculateTax();
        calculateGrandTotal();

        $(".calculate_item :input[type=number], .calculate_item .discount_type, #discount_overall, #allow_tax").change(function(){
            var sum = 0;

            $(".calculate_item .row_line").each(function(){
                var id = $(this).data('id');
                var qty = $("#qty_"+id).val();
                var rate = $("#rate_"+id).val();
                var discount = $("#discount_"+id).val();
                var discount_type = $("#discount_type_"+id).val();
                var discount_amount = 0;

                var total_amount = parseFloat(qty) * parseFloat(rate);

                if(parseInt(discount_type) == 1){
                    $("#discount_"+id).attr('max', 100);

                    if(parseFloat(discount) > 100){
                        $("#discount_"+id).val(parseFloat(100).toFixed(2));
                        discount = parseFloat(100);
                    }
                    discount_amount = (parseFloat(total_amount) * parseFloat(discount)) / 100;
                }else{
                    $("#discount_"+id).attr('max', parseFloat(rate).toFixed(2));

                    if(parseFloat(discount) > parseFloat(rate)){
                        $("#discount_"+id).val(parseFloat(rate).toFixed(2));
                        discount = parseFloat(rate).toFixed(2);
                    }
                    discount_amount = parseFloat(discount);
                }

                total_amount = parseFloat(total_amount) - parseFloat(discount_amount);
                $("#amount_"+id).val(parseFloat(total_amount).toFixed(2));

                var paid = 0;
                paid += parseFloat($("#amount_"+id).val());
                sum += parseFloat(paid);

            });

            $("#sub_total_amount").html(parseFloat(sum).toFixed(2));
            $("#sub_total_amount_hidden").val(parseFloat(sum).toFixed(2));

            calculateDiscount();
            calculateTax();
            calculateGrandTotal();

        });
        CheckBeforeSave();

    }
    
    function calculateDiscount() {
        var overall_discount = $("#discount_overall").val();

        var sub_total = $("#sub_total_amount_hidden").val();

        if(parseFloat(overall_discount) < parseFloat(sub_total)){
            var overall_discount_type = $("#discount_type_overall_hidden").val();
            overall_discount_type = parseInt(overall_discount_type);

            var overall_discount_amount = 0;

            if(overall_discount_type == 1) {
                $("#overall_discount").attr('max', 100);

                if(parseFloat(overall_discount) > 100){
                    $("#overall_discount").val(parseFloat(100).toFixed(2));
                    overall_discount = parseFloat(100).toFixed(2);
                }
                overall_discount_amount = (parseFloat(sub_total) * parseFloat(overall_discount)) / 100;
            }else{
                $("#overall_discount").attr('max', parseFloat(overall_discount).toFixed(2));

                if(parseFloat(overall_discount) > parseFloat(overall_discount)){
                    $("#overall_discount").val(parseFloat(overall_discount).toFixed(2));
                    overall_discount = parseFloat(overall_discount).toFixed(2);
                }
                overall_discount_amount = parseFloat(overall_discount);
            }
            $("#discount_overall_amount").val(parseFloat(overall_discount_amount).toFixed(2));
            $("#total_discount").text(parseFloat(overall_discount_amount).toFixed(2));
        }

    }

    function calculateTax() {
        var sub_total_amount_hidden = $("#sub_total_amount_hidden").val();
        sub_total_amount_hidden = parseFloat(sub_total_amount_hidden);

        var total_tax = 0;
        if($("#allow_tax").is(':checked')){
            var tax_value = "$tax_value";
            tax_value = parseFloat(tax_value);
            total_tax = (sub_total_amount_hidden * tax_value) / 100;
        }

        $("#total_tax_hidden").val(parseFloat(total_tax).toFixed(2));
        $("#total_tax").text(parseFloat(total_tax).toFixed(2));

        var total_tax_hidden = $("#total_tax_hidden").val();
        total_tax_hidden = parseFloat(total_tax_hidden);

    }

    function calculateGrandTotal() {
        var sub_total_amount_hidden = $("#sub_total_amount_hidden").val();
        sub_total_amount_hidden = parseFloat(sub_total_amount_hidden);

        var discount_overall_amount = $("#discount_overall_amount").val();
        discount_overall_amount = parseFloat(discount_overall_amount);

        var total_tax_hidden = $("#total_tax_hidden").val();
        total_tax_hidden = parseFloat(total_tax_hidden);

        var grand_total = (sub_total_amount_hidden - discount_overall_amount) + total_tax_hidden;

        $("#grand_total_amount_hidden").val(parseFloat(grand_total).toFixed(2));
        $("#grand_total_amount").text(parseFloat(grand_total).toFixed(2));

    }

    function CheckBeforeSave() {
        var total_amount = $("#grand_total_amount_hidden").val();
        total_amount = parseFloat(total_amount);

        var receive_amount = "$model->receive_amount";
        receive_amount = parseFloat(receive_amount);

        if(total_amount <= 0)
        {
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }

        if(total_amount < receive_amount)
        {
            $("#pay-button").prop('disabled', true);
        }else{
            $("#pay-button").removeAttr('disabled');
        }
    }

JS;

$this->registerJs($script);

?>
