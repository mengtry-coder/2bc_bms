<?php  
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

@$id_membership_profile = $_GET['id_membership_profile'];

$payment_type = ArrayHelper::map(\backend\models\PaymentType::find()
->where(['status' => 1])
->all(), 'id', 'names');

$payment_method = ArrayHelper::map(\backend\models\PaymentMethod::find()
->where(['status' => 1])
->all(), 'id', 'names');

$payment_for = ArrayHelper::map(\backend\models\PaymentFor::find()
->where(['status' => 1])
->all(), 'id', 'names');

$payment_status = ArrayHelper::map(\backend\models\PaymentStatus::find()
->where(['status' => 1])
->all(), 'id', 'names');

?>

<div class="membership-payment-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="row"> 
        <div class="col-md-3">  
            <?= 
                $form->field($model, 'id_payment_for')->widget(Select2::classname(), [
                    'data' => $payment_for,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    // 'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>  
        </div>
        <div class="col-md-3">   
            <?= $form->field($model, 'amount')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control']); ?>
        </div>
        <div class="col-md-3">   
            <?= $form->field($model, 'paid')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control']); ?> 
        </div>
        <div class="col-md-3">   
            <?= $form->field($model, 'balance')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control','readonly'=>true]); ?> 
        </div>
    </div>

    <div class="row"> 
        <div class="col-md-3">   
            <?= 
                $form->field($model, 'id_payment_type')->widget(Select2::classname(), [
                    'data' => $payment_type,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>    
        </div>
        <div class="col-md-3">   
            <?= 
                $form->field($model, 'id_payment_method')->widget(Select2::classname(), [
                    'data' => $payment_method,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>
        </div> 
        
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-6">   
                    <?= $form->field($model, 'from_date')->textInput(['readonly'=>true]) ?>
                </div>
                <div class="col-md-6">   
                    <?= $form->field($model, 'to_date')->textInput(['readonly'=>true]) ?>
                </div>
            </div>
        </div>
        <div class="col-md-3">  
            <?= 
                $form->field($model, 'status')->widget(Select2::classname(), [
                    'data' => $payment_status,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    // 'options' => ['placeholder' => 'Select'],
                    'pluginOptions' => [
                        'allowClear' => false
                    ],
                ]);
            ?>  
        </div>
    </div> 
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textarea(['rows' => '6']) ?>
        </div>
    </div>
    <?= $form->field($model, 'id_membership_profile')->hiddenInput(['value'=>$id_membership_profile ])->label(false)?>
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS

$('#membershippayment-amount,#membershippayment-paid').change(function(){
    var amount = $('#membershippayment-amount').val();
    var paid = $('#membershippayment-paid').val();
    var balance = (amount - paid).toFixed(2);
    $('#membershippayment-balance').val(balance);
});

$('#membershippayment-from_date,#membershippayment-to_date').datepicker({
    format: 'yyyy-mm-dd',
    changeMonth: true,
    changeYear: true,
    autoclose: true
});

JS;
$this->registerJs($script);
?>