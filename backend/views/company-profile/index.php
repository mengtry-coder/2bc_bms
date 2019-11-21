<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use backend\components\InputTemplate;
use yii\widgets\ActiveForm;
use backend\models\UploadedFile;

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$base_url = Yii::getAlias('@web');

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->logo;
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
$img_url = $base_url."/".$img_url;

$this->title = 'Company Profile';
$this->params['breadcrumbs'][] = ['label' => 'Setup', 'url' => '#'];
$this->params['breadcrumbs'][] = ['label' => 'Company Profile', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css">
    .row-form {
        margin: 0px -15px;
    }
    .nav-tabs {
        padding-left: 0px;
    }
    .nav-tabs li a{
        margin-right: 0px;
    }
</style>
<div class="company-profile-index">

    <div class="row">
        <!-- <div class="col-md-3 col-sm-4">
            <?= $this->render('//company-profile/menu_left'); ?>
        </div> -->
        <div class="col-md-12 col-sm-12">
            <div class="panel"> 
                <div class="panel-body">  

                    <?php $form = ActiveForm::begin(); ?>
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="panel-control" style="float: left;">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab-1" data-toggle="tab">Basic Detail</a></li>
                                        <li><a href="#tab-2" data-toggle="tab">Term & Condition</a></li>
                                        <li><a href="#tab-3" data-toggle="tab">Bill and Payment</a></li>
                                        <li><a href="#tab-4" data-toggle="tab">What we do</a></li>
                                        <li><a href="#tab-5" data-toggle="tab">Vision & Mission</a></li>
                                        <li><a href="#tab-6" data-toggle="tab">Contract</a></li>
                                        <li><a href="#tab-7" data-toggle="tab">Note & Information</a></li>
                                    </ul>
                                </div>
                                <!-- <h3 class="panel-title">Panel With tabs</h3> -->
                            </div> 
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab-1">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div style="display: none">
                                                    <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                                                </div>
                                                <div class="wr_img">
                                                    <?php if ($model->logo == "" || $model->isNewRecord ){ ?>
                                                        <label for = 'companyprofile-file'>
                                                            <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                                                        </label>
                                                    <?php } else {?>
                                                        <label for="companyprofile-file"> 
                                                            <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                                                        </label>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'names')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'website')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'mailing_address')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <?= $form->field($model, 'vattin')->textInput(['maxlength' => true]) ?>
                                                    </div>
                                                </div>

                                                <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                                                  
                                                
                                            </div>

                                        </div>
                                    </div>
                                    <div class="tab-pane fade in" id="tab-2">
                                        <?= $form->field($model, 'quotation_term_and_condition')->textArea(['class'=>'editor_area'])->label(false) ?>
                                    </div>
                                    <div class="tab-pane fade in" id="tab-3">
                                        <?= $form->field($model, 'bill_and_payment')->textArea(['class'=>'editor_area'])->label(false) ?>
                                    </div>
                                    <div class="tab-pane fade in" id="tab-4">
                                        <?= $form->field($model, 'what_we_do')->textArea(['class'=>'editor_area'])->label(false) ?>
                                    </div>
                                    <div class="tab-pane fade in" id="tab-5">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">our vision</p>
                                                <?= $form->field($model, 'vision')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">our mission</p>
                                                <?= $form->field($model, 'mission')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade in" id="tab-6">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">credit arrangment</p>
                                                <?= $form->field($model, 'credit_arrangment')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">cancellation aagreement</p>
                                                <?= $form->field($model, 'cancellation_agreement')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">confidentiality</p>
                                                <?= $form->field($model, 'confidentiality')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade in" id="tab-7">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">Invoice</p>
                                                <?= $form->field($model, 'info_invoice')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">expense</p>
                                                <?= $form->field($model, 'info_expense')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">bill</p>
                                                <?= $form->field($model, 'info_bill')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">pay bill</p>
                                                <?= $form->field($model, 'info_pay_bill')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">opening balance</p>
                                                <?= $form->field($model, 'info_opening_balance')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="text-main text-uppercase">journal entry</p>
                                                <?= $form->field($model, 'info_journal_entry')->textArea(['class'=>'editor_area'])->label(false) ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="panel-footer">
                                <div class="text-right"> 
                                    <?= Html::submitButton('<i class="btn-label fa fa-floppy-o"></i> Save', ['class' => 'btn btn-success btn-labeled btn-rounded']) ?>
                                </div> 
                            </div>
                        </div>
                    <?php ActiveForm::end(); ?>
                                        
                </div>
            </div>
        </div>
    </div>
</div>

<?php

$script = <<<JS

    var base_url = "$base_url";

    $('.editor_area').each(function(e){
        CKEDITOR.replace( this.id, { customConfig: base_url + '/plugins/ckeditor/config.js' });
    });

    $(function () {
        $("#companyprofile-file").change(function () {
            readURL(this);
        });
        $("#companyprofile-file").hide();
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
