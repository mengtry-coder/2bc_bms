<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\EventList;

@$id_event_list = $_GET['id_event_list'];
$eventListData = EventList::findOne($id_event_list); 
$payment_type = ArrayHelper::map(\backend\models\PaymentType::find()
->where(['status' => 1])
->all(), 'id', 'names');

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()
->where(['status' => 1])
->all(), 'id', 'names');

$base_url = Yii::getAlias('@web');

$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');

if($eventListData->authorized == 1){
    $membership_profile = ArrayHelper::map(\backend\models\MembershipProfile::find() 
    ->where(['status'=>1])
    ->all(), 'id', 'company_name');
}else{
    $membership_profile = ArrayHelper::map(\backend\models\MembershipProfile::find() 
    ->where(['status'=>1])
    ->andWhere(['membership_type'=>1])
    ->all(), 'id', 'company_name');
}
// echo $eventListData->authorized;

// $membership_profile = ArrayHelper::map(\backend\models\MembershipProfile::find() 
// ->where(['status'=>1])
// ->all(), 'id', 'company_name');
 
$sql = "
    SELECT CONCAT('(','+',phone_code.code,')',' ',phone_code.short_name) as phone_prefix_code,
    phone_code.id as id
    FROM data_option_phone_number_country_code as phone_code 
    WHERE phone_code.status = 1 
    ";
$prefix_phone_code = Yii::$app->db->createCommand($sql)->queryAll();
$prefix_phone_code = ArrayHelper::map($prefix_phone_code, 'id', 'phone_prefix_code');


?>
<style>
.row_stylePanel{
    padding: 8px;
    background-color: #ececec;
    border-left: 5px solid #0ab0fc;
    margin: 0px;
}
</style>
<div class="event-list-participation">

    <?php $form = ActiveForm::begin(); ?>
    <?php
    
    if(!$model->isNewrecord){ 
    $membership_profile_update = Yii::$app->db->createCommand('
    SELECT * FROM membership_profile WHERE membership_profile.id = '.$model->id_membership_profile.'
    ')->queryOne(); 
    ?>
<!--first row on Update-->

    <div class="row row_stylePanel">
        <div class="col-md-6 col-xs-6">
            <span class="btn btn-info btn-rounded btn-labeled">
                <i class="btn-label fa fa-vcard"></i> 
                <b>1</b>
            </span> 
            <span class="btn btn-info btn-rounded btn-labeled">
                <i class="btn-label demo-psi-pen-5 icon-lg"></i> 
                <b>Update on: <span class="show_count_class"><?= $membership_profile_update['company_name'];?></span></b>
            </span>
        </div> 
        <div class="col-md-6 col-xs-6 text-right"> 
            <!-- <span class="btn btn-warning btn-rounded btn-circle add_row">
                <i class="fa fa-plus"></i>
            </span> -->
            <!-- <button class="btn btn-danger btn-rounded btn-circle">
                <i class="fa fa-close"></i>
            </button> -->
        </div> 
    </div> 
    <br>
    <div class="row">  
        <div class="col-md-3">
            <?= 
                $form->field($model, 'id_membership_profile')->widget(Select2::classname(), [
                    'data' => $membership_profile,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['class'=>'membershipevent-id_membership_profile','data-id'=>1,'placeholder' => 'Select','id'=>'membership_profile_1'],
                    'pluginOptions' => [
                        'allowClear' => false,
                        'disabled' => true,
                    ],
                ]);
            ?>  
        </div> 

        <div class="col-md-3">
            <div class="form-group field-membership_name_1">
                <label class="control-label" for="membership_name_1">Membership Name</label>
                <input type="text" id="membership_name_1" class="form-control" name="membership_name" readonly data-id="1" value="<?= $membership_profile_update['first_name'].' '.$membership_profile_update['last_name']; ?>">
            </div>
        </div>

        <div class="col-md-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group field-phone_number1_1">
                        <label class="control-label" for="phone_number1_1">Phone Number</label>
                        <input type="text" id="phone_number1_1" class="form-control" name="phone_number1" readonly data-id="1" value="<?= $membership_profile_update['prefix_phone_code'].' '.$membership_profile_update['phone_number']; ?>">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group field-phone_number2_1">
                        <label class="control-label" for="phone_number2_1">Phone Number Line 2</label>
                        <input type="text" id="phone_number2_1" class="form-control" name="phone_number2" readonly data-id="1" value="<?= $membership_profile_update['phone_number_line_2']; ?>">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <?= $form->field($model, 'email')->textInput(['id'=>'email_1','data-id'=>1,'maxlength' => true,'readonly'=>true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            
            <div class="row">
                <div class="col-md-6">
                    <?= 
                        $form->field($model, 'id_payment_type')->widget(Select2::classname(), [
                            'data' => $payment_type,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['id'=>'id_payment_type_1','data-id'=>1,'placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>  
                </div>

                <div class="col-md-6">
                    <?= 
                        $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                            'data' => $payment_method,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['id'=>'id_payment_method_1','data-id'=>1,'placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>   
                </div>
            </div> 

        </div>
        <div class="costingBlock" data-id="1">
            <div class="col-md-3"> 
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'register_date')->textInput(['class'=>'form-control register_date','id'=>'register_date_1','data-id'=>1,'readonly'=>true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'number_of_audient')->textInput(['id'=>'number_of_audient_1','data-id'=>1,'type'=>'number','min'=>'1']) ?>
                    </div>
                </div> 
            </div>  
            <div class="col-md-3"> 
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'event_fee')->textInput(['id'=>'event_fee_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'amount')->textInput(['id'=>'amount_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                </div> 
            </div>  
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'paid')->textInput(['id'=>'paid_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'balance')->textInput(['id'=>'balance_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                </div> 
            </div>
        </div>
    </div> 

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'member_description')->textarea(['id'=>'member_description_1','data-id'=>1,'rows' => '2']) ?>
        </div>
    </div> 
    <div class="demo_new_row">

    </div>
<!-- end first row -->
    <?php
    }else{
    ?>
<!--first row Add new-->
<div class="row row_stylePanel">
        <div class="col-md-6 col-xs-6">
            <span class="btn btn-info btn-rounded btn-labeled">
                <i class="btn-label fa fa-vcard"></i> 
                <b>1</b>
            </span> 
            <span class="btn btn-info btn-rounded btn-labeled">
                <i class="btn-label demo-pli-receipt-4 icon-lg"></i> 
                <b>Total Member: <span class="show_count_class">1</span></b>
            </span>
        </div> 
        <div class="col-md-6 col-xs-6 text-right"> 
            <span class="btn btn-warning btn-rounded btn-circle add_row">
                <i class="fa fa-plus"></i>
            </span>
            <!-- <button class="btn btn-danger btn-rounded btn-circle">
                <i class="fa fa-close"></i>
            </button> -->
        </div> 
    </div> 
    <br>
    <div class="row">  
        <div class="col-md-3">
            <?= 
                $form->field($model, 'id_membership_profile')->widget(Select2::classname(), [
                    'data' => $membership_profile,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['class'=>'membershipevent-id_membership_profile','data-id'=>1,'placeholder' => 'Select','id'=>'membership_profile_1'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>  
        </div> 

        <div class="col-md-3">
            <?= $form->field($model, 'membership_name')->textInput(['id'=>'membership_name_1','data-id'=>1,'readonly'=>true]) ?>
        </div>

        <div class="col-md-3">
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'phone_number1')->textInput(['id'=>'phone_number1_1','data-id'=>1,'readonly'=>true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'phone_number2')->textInput(['id'=>'phone_number2_1','data-id'=>1,'readonly'=>true]) ?>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <?= $form->field($model, 'email')->textInput(['id'=>'email_1','data-id'=>1,'maxlength' => true,'readonly'=>true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            
            <div class="row">
                <div class="col-md-6">
                    <?= 
                        $form->field($model, 'id_payment_type')->widget(Select2::classname(), [
                            'data' => $payment_type,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['id'=>'id_payment_type_1','data-id'=>1,'placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>  
                </div>

                <div class="col-md-6">
                    <?= 
                        $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                            'data' => $payment_method,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['id'=>'id_payment_method_1','data-id'=>1,'placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>   
                </div>
            </div> 

        </div>
        <div class="costingBlock" data-id="1">
            <div class="col-md-3"> 
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'register_date')->textInput(['class'=>'form-control register_date','id'=>'register_date_1','data-id'=>1,'readonly'=>true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'number_of_audient')->textInput(['id'=>'number_of_audient_1','data-id'=>1,'type'=>'number','min'=>'1']) ?>
                    </div>
                </div> 
            </div>  
            <div class="col-md-3"> 
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'event_fee')->textInput(['id'=>'event_fee_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'amount')->textInput(['id'=>'amount_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                </div> 
            </div>  
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($model, 'paid')->textInput(['id'=>'paid_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true]) ?>
                    </div>
                    <div class="col-md-6">
                        <?= $form->field($model, 'balance')->textInput(['id'=>'balance_1','data-id'=>1,'type'=>'number','step'=>'0.01','maxlength' => true,'readonly'=>true]) ?>
                    </div>
                </div> 
            </div>
        </div> <!-- end costingBlock -->
    </div> 

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'member_description')->textarea(['id'=>'member_description_1','data-id'=>1,'rows' => '2']) ?>
        </div>
    </div> 
    <div class="demo_new_row">

    </div>
<!-- end first row -->
    <?php
    }
    ?>
    <?= $form->field($model, 'id_event_list')->hiddenInput(['value'=>$id_event_list ])->label(false)?>
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<script>

var base_url = "<?=$base_url?>";

var template = $('#template_append').html();

var howMany = 1;
 
$('.add_row').click(function() {
    howMany += 1;  
    countClass = $('.count_class').length; 
    $('.show_count_class').text(countClass + 2);
$('.demo_new_row').append(`
    <div class="count_class demo_new_row_wrap_${howMany}">
        <div class="row row_stylePanel">
            <div class="col-md-6 col-xs-6">
                <span class="btn btn-info btn-rounded btn-labeled">
                    <i class="btn-label fa fa-vcard"></i> 
                    <b>${howMany}</b>
                </span>
            </div>
            <div class="col-md-6 col-xs-6 text-right">  
                <div class="btn btn-danger btn-rounded btn-circle" id="btn_remove" data-id="${howMany}">
                    <i class="fa fa-minus"></i>
                </div>
            </div> 
        </div> 
        <br>
        <div class="row">  
            <div class="col-md-3">
                <div class="form-group">
                    <label for="membershipevent-id_membership_profile">Membership Profile</label>
                    <select class="form-control membershipevent-id_membership_profile membership_profile_select2" name="membership_profile[]" data-id="${howMany}" id="membership_profile_${howMany}" required>
                    <?php 
                            echo '<option value="">Select</option>';
                        foreach($membership_profile as $key => $value){
                            if($value != null){
                            echo '<option value="'.$key.'">'.$value.'</option>';
                            }
                        }
                    ?> 
                    </select>
                </div> 
            </div> 

            <div class="col-md-3">
                <div class="form-group field-eventlist-membership_name">
                    <label class="control-label" for="eventlist-membership_name">Membership Name</label>
                    <input type="text" id="membership_name_${howMany}" class="form-control" data-id="${howMany}" name="membership_name[]" readonly>
                </div> 
            </div>

            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group field-eventlist-phone_number">
                            <label class="control-label" for="eventlist-phone_number">Phone Number</label>
                            <input type="text" id="phone_number1_${howMany}" class="form-control" data-id="${howMany}" name="phone_number[]" readonly>
                        </div>  
                    </div>
                    <div class="col-md-6">
                        <div class="form-group field-eventlist-phone_number2">
                            <label class="control-label" for="eventlist-phone_number2">Phone Number Line 2</label>
                            <input type="text" id="phone_number2_${howMany}" class="form-control" data-id="${howMany}" name="phone_number2[]" readonly>
                        </div>   
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group field-eventlist-email">
                    <label class="control-label" for="eventlist-email">Email</label>
                    <input type="text" id="email_${howMany}" class="form-control" data-id="${howMany}" name="email[]" readonly>
                </div>    
            </div>
        </div>
        <div class="row"> 
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="eventlist-id_payment_type">Payment Type</label>
                            <select name="payment_type[]" class="form-control payment_type_select2" id="id_payment_type_${howMany}" data-id="${howMany}">
                            <?php 
                                    echo '<option value="">Select</option>';
                                foreach($payment_type as $key => $value){
                                    if($value != null){
                                    echo '<option value="'.$key.'">'.$value.'</option>';
                                    }
                                }
                            ?> 
                            </select>
                        </div>  
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="eventlist-id_payment_method">Payment Method</label>
                            <select name="payment_method[]" class="form-control payment_method_select2" id="id_payment_method_${howMany}" data-id="${howMany}">
                            <?php 
                                    echo '<option value="">Select</option>';
                                foreach($payment_method as $key => $value){
                                    if($value != null){
                                    echo '<option value="'.$key.'">'.$value.'</option>';
                                    }
                                }
                            ?> 
                            </select>
                        </div>  
                    </div>
                </div>
            </div>
                
            <div class="costingBlock" data-id="${howMany}"> 
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-register_date">
                                <label class="control-label" for="eventlist-register_date">Register Date</label>
                                <input type="text" id="register_date_${howMany}" class="form-control register_date" data-id="${howMany}" name="register_date[]" readonly required>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-number_of_audient">
                                <label class="control-label" for="eventlist-number_of_audient">No.Pax</label>
                                <input type="number" min="1" id="number_of_audient_${howMany}" class="form-control" data-id="${howMany}" name="number_of_audient[]" required>
                            </div>   
                        </div>
                    </div> 
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-event_fee">
                                <label class="control-label" for="eventlist-event_fee">Event Fee</label>
                                <input type="number" step="0.01" id="event_fee_${howMany}" class="form-control" data-id="${howMany}" name="event_fee[]" readonly>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-amount">
                                <label class="control-label" for="eventlist-amount">Amount</label>
                                <input type="number" step="0.01" id="amount_${howMany}" class="form-control" data-id="${howMany}" name="amount[]" readonly>
                            </div>   
                        </div>
                    </div> 
                </div> 

                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-paid">
                                <label class="control-label" for="eventlist-paid">Paid</label>
                                <input type="number" step="0.01" id="paid_${howMany}" class="form-control" data-id="${howMany}" name="paid[]">
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="form-group field-eventlist-balance">
                                <label class="control-label" for="eventlist-balance">Balance</label>
                                <input type="number" step="0.01" id="balance_${howMany}" class="form-control" data-id="${howMany}" name="balance[]" readonly>
                            </div>   
                        </div>
                    </div> 
                </div>
            </div> 
        </div> 

        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="eventlist-member_description">Description</label>
                    <textarea id="member_description_${howMany}" class="form-control" name="member_description[]" rows="2" data-id="${howMany}"></textarea>
                </div>
            </div>
        </div>
    </div>
    `);
    $('.membership_profile_select2,.payment_type_select2,.payment_method_select2').select2(); 
    $('.count_range').append(howMany);
    $('.register_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });
});

$(document).ready(function () {
    $(document).on('click', '#btn_remove', function(){
        
        var row_id = $(this).data('id');
        $('.demo_new_row_wrap_'+row_id+'').remove(); 
        countClass = $('.count_class').length; 
        $('.show_count_class').text(countClass + 1);
    }); 
    //==== Start Ajax query data by event name
    $(document).on('change','.membershipevent-id_membership_profile',function(){
        var id_membership_profile = $(this).val();
        var id_event_list = "<?=$id_event_list?>"; 
        var data_id = $(this).data('id');  
        $.ajax({
            url: base_url+'/event-list/dependent?id='+id_event_list,
            type: 'post',
            data: {
                id_membership_profile: id_membership_profile, 
                action: 'get_data_by_event'
            },
            success: function(response){
                var data = JSON.parse(response);
                // console.log(data);  
                var str = "<option value=''></option>";
                if(data ==""){
                    $('#membership_name_'+data_id).val(""); 
                    $('#phone_number1_'+data_id).val(""); 
                    $('#phone_number2_'+data_id).val(""); 
                    $('#email_'+data_id).val("");  
                    $('#event_fee_'+data_id).val("");  
                    $('#number_of_audient_'+data_id).val(1);
                    $('#amount_'+data_id).val("");
                    $('#balance_'+data_id).val("");
                    $('#paid_'+data_id).val("");    
                }else{
                    $.each(data,function(key,value){
                        $('#membership_name_'+data_id).val(value.membership_name); 
                        $('#phone_number1_'+data_id).val(value.phone_number1); 
                        $('#phone_number2_'+data_id).val(value.phone_number2); 
                        $('#email_'+data_id).val(value.email);  
                        $('#event_fee_'+data_id).val(value.event_fee);  
                        $('#number_of_audient_'+data_id).val(1);
                        $('#amount_'+data_id).val(value.event_fee); 
                        $('#balance_'+data_id).val(value.event_fee);  
                        $('#paid_'+data_id).val("");    
                    }); 
                }
            }
        });
        // alert('#number_of_audient_'+data_id,'#event_fee'+data_id);
        $('.costingBlock').change(function(){
            var dataID = $(this).data("id");
            var number_of_audient = $('#number_of_audient_'+dataID).val();  
            var event_fee = $('#event_fee_'+dataID).val(); 
            var amount = (number_of_audient * event_fee).toFixed(2); 
            $('#amount_'+dataID).val(amount);  
            var paid = $('#paid_'+dataID).val(); 
            var balance = (amount - paid).toFixed(2); 
            $('#balance_'+dataID).val(balance);   

            if(number_of_audient < 1){
                alert("No.Pax can not smaller than 1");
                $('#number_of_audient_'+dataID).val(1); 
                $('#event_fee_'+dataID).val(event_fee);
            } 
        }); 
    });
    $('.costingBlock').change(function(){ 
        var number_of_audient = $('#number_of_audient_1').val();  
        var event_fee = $('#event_fee_1').val(); 
        var amount = (number_of_audient * event_fee).toFixed(2); 
        $('#amount_1').val(amount);  
        var paid = $('#paid_1').val(); 
        var balance = (amount - paid).toFixed(2); 
        $('#balance_1').val(balance);   

        if(number_of_audient < 1){
            alert("No.Pax can not smaller than 1");
            $('#number_of_audient_1').val(1); 
            $('#event_fee_1').val(event_fee);
        } 
    }); 
 
    $('.register_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

}); 
</script>