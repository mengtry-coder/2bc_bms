
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url; 
$base_url = Yii::getAlias('@web'); 
$request = Yii::$app->request; 
$id_customer_profile = $request->get('id_customer_profile',0);
/* @var $this yii\web\View */
/* @var $model backend\models\DataAirportCode */
/* @var $form yii\widgets\ActiveForm */
?>
<style type="text/css">
    td, th {
    padding: 5px;

    text-overflow: ellipsis; 
    overflow: hidden; 
    white-space: nowrap;
} 
</style>
<div class="customer-profile-import-csv">
    <?php $form = ActiveForm::begin([
    'action'=> Url::toRoute(['import-csv?id_customer_profile='.$id_customer_profile]),
    'options' => [
            'enctype' => 'multipart/form-data',
        ]
    ]) ?> 
    <div class='row'>
        <div class="col-md-12">
            <label><span style="color: #c62828;">Customer Profile Contact</span> Demo structure <a type="button" class="btn btn-xs btn-info btn-rounded" href="<?= $base_url.'/customer-profile-contact/download-sample-csv'?>" >Download Sample <i class="demo-psi-file-csv go-right"></i></a> of CSV file for import <span style="color: #283593;">(You have to follow this structure to avoid your data messy.)</span></label>

            <div class="table-responsive">  
                <div id="w1" class="grid-view"> 
                <table border="1" width="100%" style="border-color: #0000006e;">
                    <tr style="background-color: #ababab3d;"> 
    
                        <td>
                            Contact Name <span style="color:red;"><b>&#42;</b></span>
                        </td>
                        <td>
                            Position
                        </td> 
                        <td>
                            Phone Number
                        </td> 
                        <td>
                            Email <span style="color:red;"><b>&#42;</b></span>
                        </td>
                        <td>
                            Note
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ex: 1 (data)
                        </td>
                        <td>
                            ex: 1 (data)
                        </td>
                        <td>
                            ex: 1 (data)
                        </td>
                        <td>
                            ex: 1 (data)
                        </td>
                        <td>
                            ex: 1 (data)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ex: 2 (data)
                        </td>
                        <td>
                            ex: 2 (data)
                        </td>
                        <td>
                            ex: 2 (data)
                        </td>
                        <td>
                            ex: 2 (data)
                        </td>
                        <td>
                            ex: 2 (data)
                        </td>
                        
                    </tr>
                    <tr>
                        
                        <td>
                            ex: 3 (data)
                        </td>
                        <td>
                            ex: 3 (data)
                        </td>
                        <td>
                            ex: 3 (data)
                        </td> 
                        <td>
                            ex: 3 (data)
                        </td>
                        <td>
                            ex: 3 (data)
                        </td> 
                    </tr>
                </table>
                </div>
            </div>
            <label style="color: #c62828;">***Note: field header must be the first row (row 01) in CSV file.</label>
                <div class="h15px"></div>
            </div> 

            <div class="col-md-6">
                <?= $form->field($model, 'file')->fileInput(['class'=>'file btn btn-md btn-primary'])->label(false); ?>
            </div>
        </div>
        <div class="text-right"> 
            <?= Html::submitButton('Import', ['class' => 'btn btn-success btn-rounded','id'=>'bnt_save']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?> 
</div>
<?php  
$script = <<< JS
$("#bnt_save").prop('disabled',true);
$("#customerprofilecontact-file").change(function(){
    var filePath = $("#customerprofilecontact-file").val();
    if(filePath !=""){
        $("#bnt_save").prop('disabled',false);
    }else{
        $("#bnt_save").prop('disabled',true);
    }
})

JS;

$this->registerJS($script);
?>
 