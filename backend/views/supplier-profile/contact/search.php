<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
?>


<style>
    /*Search Form Button*/
button:focus {
    box-shadow: none !important;
    outline: none !important;
}

/*End Search Form Button*/
</style>
<div class="form-inline">

    <?php $form = ActiveForm::begin([
        'action' => ['contact', 'id'=>$_GET['id'], 'smMenu'=>1],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="pull-right">

                <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control pull-right', 'style'=>'margin-top: -1px;', 'placeholder'=>'Search'])->label(false) ?> 
                
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button>

                <button data-title="Add New Contact" type="button" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['supplier-profile/create-contact', 'id'=>Yii::$app->request->get('id')]) ?>">                            
                    Add New <i class="fa fa-plus-square go-right"></i>
                </button> 
                
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
