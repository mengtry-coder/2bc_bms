<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
@$id_membership_profile = $_GET['id_membership_profile'];

$base_url = Yii::getAlias('@web');

$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');

$event_list = ArrayHelper::map(\backend\models\EventList::find() 
    ->where(['status' => 1])
    ->all(), 'id', 'event_name');
 
$sql = "
    SELECT CONCAT('(','+',phone_code.code,')',' ',phone_code.short_name) as phone_prefix_code,
    phone_code.id as id
    FROM data_option_phone_number_country_code as phone_code 
    WHERE phone_code.status = 1 
    ";
$prefix_phone_code = Yii::$app->db->createCommand($sql)->queryAll();
$prefix_phone_code = ArrayHelper::map($prefix_phone_code, 'id', 'phone_prefix_code');


?>

<div class="membership-event-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">  
        <div class="col-md-8">
            <?= 
                $form->field($model, 'id_event_list')->widget(Select2::classname(), [
                    'data' => $event_list,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'from_date')->textInput(['readonly'=>true]) ?>
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'to_date')->textInput(['readonly'=>true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'address')->textInput(['maxlength' => true,'readonly'=>true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'address_line_2')->textInput(['maxlength' => true,'readonly'=>true]) ?>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <?= 
                        $form->field($model, 'prefix_phone_code')->widget(Select2::classname(), [
                            'data' => $prefix_phone_code,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select','disabled'=>'disabled'],
                            'pluginOptions' => [
                                'allowClear' => true, 
                            ],
                        ]);
                    ?>     
                </div>
                <div class="col-md-7">
                    <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true,'readonly'=>true]) ?>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <?= 
                        $form->field($model, 'prefix_phone_code_line_2')->widget(Select2::classname(), [
                            'data' => $prefix_phone_code,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select','disabled'=>'disabled'],
                            'pluginOptions' => [
                                'allowClear' => true,
                                'readonly' => true
                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-7">
                    <?= $form->field($model, 'phone_number_line_2')->textInput(['maxlength' => true,'readonly'=>true]) ?>
                </div>
            </div>
        </div>  
    </div>

    <div class="row"> 
        <div class="col-md-3">
            <?= 
                $form->field($model, 'id_country')->widget(Select2::classname(), [
                    'data' => $country,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select','disabled'=>'disabled'],
                    'pluginOptions' => [
                        'allowClear' => true,
                        'readonly' => true 
                    ],
                ]);
            ?>     
        </div>
        <div class="col-md-3">
            <?= 
                $form->field($model, 'id_city')->widget(Select2::classname(), [
                    'data' => $city,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select','disabled'=>'disabled'],
                    'pluginOptions' => [
                        'allowClear' => true,
                        'readonly' => true
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'id_province')->textInput(['maxlength' => true,'readonly'=>true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'postal_code')->textInput(['maxlength' => true,'readonly'=>true]) ?>
        </div>
    </div>

    <div class="row">
        
        <div class="col-md-4">
            <div class="col-md-7">
                <?= $form->field($model, 'email')->textInput(['maxlength' => true,'readonly'=>true]) ?>
            </div> 
            <div class="col-md-5">
                <?= $form->field($model, 'number_of_audient')->textInput(['type'=>'number','min'=>1]) ?>
            </div>
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'event_fee')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control','readonly'=>true]); ?>
        </div>
        <div class="col-md-2">   
            <?= $form->field($model, 'amount')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control','readonly'=>true]); ?>
        </div>
        <div class="col-md-2">   
            <?= $form->field($model, 'paid')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control']); ?> 
        </div>
        <div class="col-md-2">   
            <?= $form->field($model, 'balance')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control','readonly'=>true]); ?> 
        </div> 
        <div class="col-md-2">
        <?= $form->field($model, 'status')->hiddenInput()->label(false)?>
            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?php $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div> 

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textarea(['rows' => '6','readonly'=>true]) ?>
        </div>
    </div>  

    <?= $form->field($model, 'id_membership_profile')->hiddenInput(['value'=>$id_membership_profile ])->label(false)?>
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<script>

var base_url = "<?=$base_url?>";

//==== Start Ajax query data by event name
$('#membershipevent-id_event_list').change(function(){
    var id_event_list = $(this).val();
    $.ajax({
        url: base_url+'/membership-event/dependent',
        type: 'post',
        data: {
            id_event_list: id_event_list,
            action: 'get_data_by_event'
        },
        success: function(response){
            var data = JSON.parse(response);
            // console.log(data);  
            var str = "<option value=''></option>";
            $.each(data,function(key,value){
                $('#membershipevent-from_date').val(value.from_date); 
                $('#membershipevent-to_date').val(value.to_date); 
                $('#membershipevent-address').val(value.address); 
                $('#membershipevent-address_line_2').val(value.address_line_2); 
                $('#membershipevent-prefix_phone_code').html(`<option value='${value.prefix_phone_code}'>${value.prefix_phone_code_name}</option>`);
                $('#membershipevent-phone_number').val(value.phone_number); 
                $('#membershipevent-prefix_phone_code_line_2').html(`<option value='${value.prefix_phone_code_line_2}'>${value.prefix_phone_code_line_2_name}</option>`);
                $('#membershipevent-phone_number_line_2').val(value.phone_number_line_2); 
                $('#membershipevent-id_country').html(`<option value='${value.id_country}'>${value.country_name}</option>`);
                $('#membershipevent-id_city').html(`<option value='${value.id_city}'>${value.city_name}</option>`);
                $('#membershipevent-id_province').val(value.id_province);
                $('#membershipevent-postal_code').val(value.postal_code);
                $('#membershipevent-email').val(value.email);
                $('#membershipevent-event_fee').val(value.fee_for_membership);
                $('#membershipevent-description').val(value.description); 
                $('#membershipevent-status').val(value.status); 
                
            }); 
        }
    });
});
//==== End Ajax query data by event name
 
$('#membershipevent-id_event_list').change(function(){
    $('#membershipevent-number_of_audient').val(""); 
    $('#membershipevent-amount').val(""); 
}); 
// start calculate audient and event fee
$('#membershipevent-number_of_audient').change(function(){
    var no_audient = $('#membershipevent-number_of_audient').val();
    var event_fee = $('#membershipevent-event_fee').val();
    var amount = (no_audient * event_fee).toFixed(2);
    $('#membershipevent-amount').val(amount);  

    if(no_audient < 1){
        alert("Number of Audient can not smaller than 1");
        $('#membershipevent-number_of_audient').val(1); 
        $('#membershipevent-amount').val(event_fee);
    } 
    
});
// end calculate audient and event fee
// start calculate amount and balance
$('#membershipevent-amount,#membershipevent-paid').change(function(){
    var amount = $('#membershipevent-amount').val();
    var paid = $('#membershipevent-paid').val();
    var balance = (amount - paid).toFixed(2);
    $('#membershipevent-balance').val(balance); 
});
// end calculate amount and balance

// $('#membershipevent-from_date,#membershipevent-to_date').datepicker({
//     format: 'yyyy-mm-dd',
//     changeMonth: true,
//     changeYear: true,
//     autoclose: true
// });

</script>