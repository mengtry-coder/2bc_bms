<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
$base_url = Yii::getAlias('@web');

$tax_value = \backend\models\Tax::findOne(1)->value;

$tax = ArrayHelper::map(\backend\models\Tax::find()
    ->all(), 'id', 'tax_name');

$quotation_status = ArrayHelper::map(\backend\models\QuotationStatus::find()
    ->all(), 'id', function($model){return $model->name;});
$currency = ArrayHelper::map(\backend\models\Currency::find()
    ->all(), 'id', function($model){return $model->name;});
$id_customer = ArrayHelper::map(\backend\models\CustomerProfile::find()
    ->all(), 'id', function($model){return $model->customer_name . ' ('.$model->company_name . ')';});
$item = ArrayHelper::map(\backend\models\Item::find()
    ->all(), 'id', function($model){
        return $model->itemGroup->name . ' ' . $model->description;
    });
if(!$model->isNewRecord){
$project = ArrayHelper::map(\backend\models\Project::find()
    ->where(['id_customer'=>$model->id_customer])
    ->all(), 'id', 'project_name');
}
$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', 'first_name');
$tax_template = '{label}</br><div class="input-group">
            <span class="input-group-addon">TAX</span> {input} </div>{error}{hint}';
$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';
$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
?>
<style type="text/css">
      .modal-lg {
      width: 95%;
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
        width: 150px !important;
    }

    .invoice-total tr td {
        font-size: 15px;
    }
</style>

<div class="quotation-form" id="container">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
          <div class="col-md-3">
            <!-- <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?> -->
            <?= $form->field($model, 'id_customer')->widget(Select2::classname(), [
                    'data' => $id_customer,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>
            <?= $form->field($model, 'id_project')->widget(Select2::classname(), [
                'data' => $model->isNewRecord? [] : $project,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'Select'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]); ?>
            <?= $form->field($model, 'status')->widget(Select2::classname(), [
                    'data' => $quotation_status,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>
            <?= $form->field($model, 'currency')->widget(Select2::classname(), [
                    'data' => $currency,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>

          </div>
          <div class="col-md-3">
            <?= $form->field($model, 'date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
            <?= $form->field($model, 'open_till', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
            <?= $form->field($model, 'assigned')->widget(Select2::classname(), [
                    'data' => $employee_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
            ?>
            <?= $form->field($model, 'to')->textInput(['maxlength' => true,'readonly'=>true]) ?>

          </div>
          <div class="col-md-3">

            <!-- <?= $form->field($model, 'discount_type')->textInput() ?> -->
            <?= $form->field($model, 'address')->textInput(['maxlength' => true,'readonly'=>true]) ?>

            <?= $form->field($model, 'city')->textInput(['readonly'=>true]) ?>

            <?= $form->field($model, 'country')->textInput(['readonly'=>true]) ?>
            <?= $form->field($model, 'zip_code')->textInput(['maxlength' => true,'readonly'=>true]) ?>

          </div>
          <div class="col-md-3">
            <?= $form->field($model, 'email')->textInput(['maxlength' => true,'readonly'=>true]) ?>
            <?= $form->field($model, 'phone')->textInput(['maxlength' => true,'readonly'=>true]) ?>
            <?= $form->field($model, 'close_sale_date', ['template'=>$date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
            <?= $form->field($model, 'allow_comment')->checkbox(['id'=>'demo-sw-checked', 'data-switchery'=>true]) ?>


<!-- <input id="demo-sw-checked" type="checkbox" checked> -->


          </div>

        </div>

        <div class="col-md-12">
          <hr/>
          <h3 style="background: #eeeeee;padding: 10px;margin-bottom: 20px;">Add Items:</h3>
          <div class="row">
            <div class="col-md-4">
              <?= Select2::widget([
                        'name' => 'assign_to[]',
                        'data' => $item,
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => ' Add Items', 'multiple' => false, 'id'=>'id_assign_item'],
                        'pluginOptions' => [
                            'allowClear' => false
                        ],
                    ]);
                ?>
            </div>
            <div class="col-md-8">
              <!-- <button data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['item/create']) ?>">                            Add New Item <i class="fa fa-plus-square go-right"></i> -->
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
                    <input type="number" name="qty[]" value=1 min="0" class="form-control qty" data-id=1 id="qty_1" />
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
                    <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <?php
                    }else{
                        if(empty($model_item)){
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
                    <input type="number" name="qty[]" value=1 min="0" class="form-control qty" data-id=1 id="qty_1" />
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
                    <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                </div>
            </div>
            <?php
                }
                    $i = 1;
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
                    <?php if($i == 2){ ?>
                    <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                    <?php }else{ ?>
                    <button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                    <?php } ?>
                </div>
            </div>
            <?php }} ?>
        </div>
    </div>

    <div class="clearfix">
        <table class="table invoice-total" style="max-width: 350px;">
            <tbody>
                <tr>
                    <td><strong>Sub Total :</strong>
                        <input type="hidden" name="sub_total_amount_hidden" value="<?= number_format($model->isNewRecord?0:$model->sub_total,2, '.', '') ?>" id="sub_total_amount_hidden">
                    </td>
                    <td id="sub_total_amount"><?= number_format($model->isNewRecord?0:$model->sub_total,2, '.', '') ?> </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-group">
                            <input type="number" value="<?= number_format($model->isNewRecord?0:$model->discount_value,2, '.', '') ?>" id="discount_overall" min="0" step="0.01" name="discount_overall" class="form-control">
                            <input type="hidden" value="<?= number_format($model->isNewRecord?0:$model->discount_amount,2, '.', '') ?>" id="discount_overall_amount" min="0" step="0.01" name="discount_overall_amount" class="form-control">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default dropdown-toggle btn-primary" id="label-discount" data-toggle="dropdown"><?= $model->isNewRecord? '%' : $model->id_discount == 1? '%' : 'Amount' ?> <span class="caret"></span></button>
                                <ul class="dropdown-menu pull-right" id="discount_type_overall">
                                    <li data-id="1"><a href="#">%</a></li>
                                    <li data-id="2"><a href="#">Amount</a></li>
                                </ul>
                                <input type="hidden" name="discount_type_overall_hidden" value="<?= $model->isNewRecord?0:$model->id_discount; ?>" id="discount_type_overall_hidden">
                            </div>
                        </div>
                    </td>
                    <td id="total_discount" style="vertical-align: middle !important;"><?= number_format($model->isNewRecord?0:$model->discount_amount,2, '.', '') ?></td>
                </tr>
                <tr>
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
                    <td><strong>TOTAL :</strong>
                        <input type="hidden" name="grand_total_amount_hidden" value="<?= number_format($model->isNewRecord?0:$model->grand_total,2, '.', '') ?>" id="grand_total_amount_hidden">
                    </td>
                    <td class="text-bold h4" id="grand_total_amount"><?= number_format($model->isNewRecord?0:$model->grand_total,2, '.', '') ?></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="modal-footer">
        <div class="text-right">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
        </div>
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
    $('#quotation-date, #quotation-open_till, #quotation-close_sale_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#quotation-id_customer").change(function(){
        // var text = $(this).select2('data')[0]['text'];
        // $(".field-task-id_related_profile label").text(text);
        var id = $(this).val();
        $.ajax({
            url: base_url+'/quotation/dependent-get-customer-info',
            type: 'post',
            data: {
                id: id,
                action: 'get_profile'
            },
            success: function(response){
                var data = JSON.parse(response);
                if(data['customer'] != ''){
                $('#quotation-address').val(data['customer']['address']);
                $('#quotation-email').val(data['customer']['email_address']);
                $('#quotation-phone').val(data['customer']['phone_number']);
                $('#quotation-city').val(data['customer']['city']);
                $('#quotation-country').val(data['customer']['country']);
                $('#quotation-to').val(data['customer']['company_name']);
                $('#quotation-zip_code').val(data['customer']['zip_code']);
              }
              if(data['project'] != ''){
                  var str = "";
                  $.each(data['project'],function(key,value){
                      str = str + '<option value="'+value.id+'">'+value.project_name+'</option>';
                  });
                  $('#quotation-id_project').html(str);
              }
            }

        });

    });

    // ==============swish allow=======

    var checking_id = $("#demo-sw-checked").val();
    if(checking_id == 1){
        $(".switchery switchery-default").css({"box-shadow": "rgb(100, 189, 99) 0px 0px 0px 10px inset !important;"});
    }

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
                alert("Item can not null!");
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
                                "<input type='number' name='qty[]' min=0 value=1 class='form-control qty' data-id="+i+" id='qty_"+i+"' />" +
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
                                "<button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
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
                    url: base_url+'/quotation/dependent',
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

    }

    function calculateDiscount() {
        var overall_discount = $("#discount_overall").val();

        var sub_total = $("#sub_total_amount_hidden").val();

        if(overall_discount > 0){
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


JS;

$this->registerJs($script);

?>
