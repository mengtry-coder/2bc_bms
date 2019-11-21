<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;

$base_url =  Yii::getAlias('@web');

$account_type = ArrayHelper::map(\backend\models\AccountType::find()
    ->where(['is_parent' => 0])->andWhere(['status' => 1])
    ->all(), 'id', 'names');

$bank = ArrayHelper::map(\backend\models\Bank::find()->where(['status'=>1])->orderBy(['bank_name'=>SORT_ASC])->all(),
'id', function($model){
    return $model->bank_name . ' | ' . $model->account_name . ' | ' . $model->account_number;
});

$sub_account_type = ArrayHelper::map(\backend\models\AccountType::find()
    ->where(['=','is_parent', $model->id_account_type])
    ->andWhere(['status' => 1])
    ->all(), 'id', 'names');


$is_sub_chart_account = ArrayHelper::map(\backend\models\ChartAccount::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');

// $is_sub_chart_account = ArrayHelper::map(\backend\models\ChartAccount::find()
//     ->where(['is_parent' => 0])->andWhere(['status' => 1])
//     ->all(), 'id', 'names');
// echo "$model->id";
$empty_arr = [];
?>

<style type="text/css">
.modal {
    overflow-x: hidden;
    overflow-y: auto;
}

.select2-selection.select2-selection--single{
    height: 30px !important;
    border-radius: 2px !important;
    border-color: #151515 border: 1px !important; 
}
</style> 

<div class="row">
<div class="col-sm-12">
<div class="chart-account-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'id_account_type')->dropDownList($account_type,
                    ['prompt' => "None"])->label('Account Type')
            ?>
        </div>
        <div class="col-md-6">
            <?= 
            $form->field($model, 'id_is_parent')->widget(Select2::classname(), [
                'data' => $sub_account_type,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'None'],
                'pluginOptions' => [
                    'allowClear' => false
            ]]);
            ?>      
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <?= $form->field($model, 'number_code')->textInput(['type'=>'number'],['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'names')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <?= 
            $form->field($model, 'is_parent')->widget(Select2::classname(), [
                'data' => $is_sub_chart_account,
                'theme' => Select2::THEME_DEFAULT,
                'language' => 'eg',
                'options' => ['placeholder' => 'None'],
                'pluginOptions' => [
                    'allowClear' => false
            ]]);
            ?>   
        </div>
        <div class="col-md-12">
            <input type="hidden" id="idacct" value="<?= $model->id_account_type; ?>">


            <?= $form->field($model, 'id_bank')->dropDownList($bank,
                    ['prompt' => "Select Bank Name"])->label(false);
            ?>

            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
        </div>
    </div>

    <div class="form-group pull-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-primary cus-button']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
</div>
<?php
if ($model->isNewRecord) {
    $newRecord = 1;
}else{
    $newRecord = 0;
}
?>
<script type="text/javascript">
var base_url = '<?= $base_url ?>';
var newRecord = '<?= $newRecord ?>';
     
    if (newRecord == 0) {
        $('#chartaccount-is_parent').change(function(){
            var id = $(this).val();
            var model_id = '<?= $model->id ?>';
            var model_is_parent = '<?= $model->is_parent ?>'; 
            
            if (id == model_id) {
                alert('Can not use current Chart of Account as Sub!');
                $('#chartaccount-is_parent').val(model_is_parent);
            }
        });
    }

    $('#chartaccount-id_account_type').change(function(){
        var id = $(this).val();
        $.ajax({
            url: base_url+'/index.php?r=chart-account/create',
            type: 'post',
            data: {
                id: id,
                action: 'get_parent'
            },
            success: function(data){
                var str = '<option value="">None</option>';
                $.each(JSON.parse(data),function(key,value){
                    str = str + '<option value="'+value.id+'">'+value.names+'</option>';
                });
                $('#chartaccount-id_is_parent').html(str);
            }
        });
    });
    $(document).ready(function () {
        $('#chartaccount-id_bank').hide();

        var idacct = $('#idacct').val();
        if(idacct == 3){
           $('#chartaccount-id_bank').show(); 
        }
        $(document).on('change', '#chartaccount-id_account_type', function () { 
            var id_account_type = $(this).val();
       
            if(id_account_type == 3){
                $('#chartaccount-id_bank').show();

            }else{
                $('#chartaccount-id_bank').hide();
                $('#chartaccount-id_bank').val("");
            }

        })

    });
</script>
