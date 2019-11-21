<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;

$base_url = Yii::getAlias('@web');

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->main_logo;
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
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->registerCssFile(
    "@web/plugins/summernote/summernote.min.css", 
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/summernote/summernote.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
    .note-popover, .note-table-popover {
        z-index: 99999;
    }
</style>
<div class="quotation-template-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="tab-base">
                    
        <!--Nav Tabs-->
        <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#demo-lft-tab-1">Detail</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-2">Plan</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-3">Feature</a>
            </li>
        </ul>

        <!--Tabs Content-->
        <div class="tab-content">

            <div id="demo-lft-tab-1" class="tab-pane fade active in">
                <div class="row"> 
                    <div class="col-md-3 text-center">
                        <div style="display: none">
                            <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                        </div>
                        <div class="wr_img">
                            <?php if ($model->main_logo == "" || $model->isNewRecord ){ ?>
                                <label for = 'quotationtemplate-file'>
                                    <img id ='feature_images' src="<?= $base_url."/backend/uploads/empty-avatar.png";?>" class='img-md'>
                                </label>
                            <?php } else {?>
                                <label for="quotationtemplate-file">
                                    <img id="feature_images" src="<?= $img_url;?>" class="img-md" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';">
                                </label>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <p class="text-main">Description</p>
                        <?= $form->field($model, 'description')->textArea()->label(false) ?>
                    </div>
                    <div class="col-md-6">
                        <p class="text-main">Inclusive Benefit</p>
                        <?= $form->field($model, 'inclusive_benefit')->textArea()->label(false) ?>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-2" class="tab-pane fade">
                <div class="panel panel-bordered panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-3">
                                <h3 class="panel-title">Title</h3>
                            </div>
                            <div class="col-md-4">
                                <h3 class="panel-title">Description</h3>
                            </div>
                            <div class="col-md-2">
                                <h3 class="panel-title">Setup Fee</h3>
                            </div>
                            <div class="col-md-2">
                                <h3 class="panel-title">Monthly Fee</h3>
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
                            <div class="col-md-3">
                                <input type="text" name="title[]" placeholder="Title…" class="form-control title" data-id=1 id="title_1" />
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" />
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <input type="number" name="setup_fee[]" value="<?= number_format(0,2) ?>" min="0" class="form-control setup_fee" data-id=1 id="setup_fee_1" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <input type="number" name="fee[]" value="<?= number_format(0,2) ?>" min="0" class="form-control fee" data-id=1 id="fee_1" />
                                </div>
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
                            <div class="col-md-3">
                                <input type="text" name="title[]" value="<?= $value['plan_title'] ?>" placeholder="Title…" class="form-control title" data-id="<?= $i; ?>" id="title_<?= $i; ?>" />
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="description[]" value="<?= $value['plan_description'] ?>" placeholder="Description…" class="form-control description" data-id="<?= $i; ?>" id="description_<?= $i; ?>" />
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <input type="number" name="setup_fee[]" value="<?= $value['setup_fee'] ?>" min="0" class="form-control setup_fee" data-id="<?= $i; ?>" id="setup_fee_<?= $i; ?>" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <input type="number" name="fee[]" value="<?= $value['plan_fee'] ?>" min="0" class="form-control fee" data-id="<?= $i; ?>" id="fee_<?= $i; ?>" />
                                </div>
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
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-main">Plan Detail</p>
                        <?= $form->field($model, 'plan_detail')->textArea()->label(false) ?>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-3" class="tab-pane fade">
                <div class="panel panel-bordered panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4">
                                <h3 class="panel-title">Title</h3>
                            </div>
                            <div class="col-md-7">
                                <h3 class="panel-title">Description</h3>
                            </div>
                            <div class="col-md-1">
                                <h3 class="panel-title"><i class="demo-psi-gear"></i></h3>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body calculate_item_2">
                        <?php
                            if($model->isNewRecord){
                        ?>
                        <div class="row row_line" data-id=1 id="row_line_2_1">
                            <div class="col-md-4">
                                <input type="text" name="feature_title[]" placeholder="Title…" class="form-control feature_title" data-id=1 id="feature_title_1" />
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="feature_description[]" placeholder="Description…" class="form-control feature_description" data-id=1 id="feature_description_1" />
                            </div>
                            <div class="col-md-1 text-center">
                                <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more_2"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <?php
                            }else{
                                $i = 0;
                                foreach ($model_feature as $key => $value) {
                                    $i++;
                        ?>
                        <div class="row row_line" data-id="<?= $i; ?>" id="row_line_2_<?= $i; ?>">
                            <div class="col-md-4">
                                <input type="text" name="feature_title[]" value="<?= $value['title'] ?>" placeholder="Title…" class="form-control feature_title" data-id="<?= $i; ?>" id="feature_title_<?= $i; ?>" />
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="feature_description[]" value="<?= $value['description'] ?>" placeholder="Description…" class="form-control feature_description" data-id="<?= $i; ?>" id="feature_description_<?= $i; ?>" />
                            </div>
                            <div class="col-md-1 text-center">
                                <?php if($i == 1){ ?>
                                <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more_2"><i class="fa fa-plus"></i></button>
                                <?php }else{ ?>
                                <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove_2' id='remove_row_2_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                                <?php } ?>
                            </div>
                        </div>
                        <?php }} ?>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS

    $(function () {
        $("#quotationtemplate-file").change(function () {
            readURL(this);
        });
        $("#quotationtemplate-file").hide();
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

    $('#quotationtemplate-description, #quotationtemplate-inclusive_benefit, #quotationtemplate-plan_detail').summernote({
        height : '350px',
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
        ],
    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.fee[data-id]:last').attr('data-id');
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            var title = $('.title[data-id='+i+']').val();
            if(title ==''){
                swal("Information", "Title can not blank!", "warning");
                return false;
            }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-3'>" +
                                "<input type='text' name='title[]' placeholder='Title…' class='form-control title' data-id="+i+" id='title_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-4'>" +
                                "<input type='text' name='description[]' placeholder='Description…' class='form-control description' data-id="+i+" id='description_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>"+
                                    "<span class='input-group-addon'><i class='fa fa-dollar'></i></span>"+
                                    "<input type='number' data-id="+i+" id='setup_fee_"+i+"' step='0.01' min=0 class='form-control' name='setup_fee[]' value='"+parseFloat(0).toFixed(2)+"'>" +
                                "</div>"+
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<div class='input-group'>"+
                                    "<span class='input-group-addon'><i class='fa fa-dollar'></i></span>"+
                                    "<input type='number' data-id="+i+" id='fee_"+i+"' step='0.01' min=0 class='form-control' name='fee[]' value='"+parseFloat(0).toFixed(2)+"'>" +
                                "</div>"+
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove ' id='remove_row_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>"
                        ;

            $('.calculate_item').append(string);

        });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id');

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_'+ id).remove();

    });



    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.feature_title[data-id]:last').attr('data-id');
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more_2').unbind('click');
        $('#add_more_2').bind('click', function (e){
            e.preventDefault();

            var title = $('.feature_title[data-id='+i+']').val();
            if(title ==''){
                swal("Information", "Title can not blank!", "warning");
                return false;
            }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_2_"+i+"'>" +
                            "<div class='col-md-4'>" +
                                "<input type='text' name='feature_title[]' placeholder='Title…' class='form-control feature_title' data-id="+i+" id='feature_title_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-7'>" +
                                "<input type='text' name='feature_description[]' placeholder='Description…' class='form-control feature_description' data-id="+i+" id='feature_description_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove_2 ' id='remove_row_2_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>"
                        ;

            $('.calculate_item_2').append(string);

        });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    $(document).on('click', '.btn_remove_2', function() {

        var current_id = $(this).attr('data-id');

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_2_'+ id).remove();

    });

JS;

$this->registerJs($script);

?>
