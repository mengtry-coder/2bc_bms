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
$img_url = $base_url."/".$img_url;

$item_type = \backend\models\ItemGroupData::find()->where(['id_type'=>2])->asArray()->all();
$item_type = empty($item_type) ? [] : $item_type;
$item_data = \backend\models\ItemGroupData::find()->where(['status'=>1])->all();
$item_data = empty($item_data) ? [] : $item_data;
$item = \backend\models\Item::find()->where(['id_group'=>$model->id, 'status'=>1])->all();
$item = empty($item) ? [] : $item;

$company_profile = \backend\models\CompanyProfile::findOne(['id'=>1]);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

// $this->registerCssFile(
//     "@web/plugins/summernote/summernote.min.css", 
//     ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
// ]);

// $this->registerJsFile(
//     '@web/plugins/summernote/summernote.min.js',
//     ['depends' => [\yii\web\JqueryAsset::className()]]
// );

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
    .note-popover, .note-table-popover {
        z-index: 99999;
    }
</style>
<div class="item-group-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="tab-base">
                    
        <!--Nav Tabs-->
        <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#demo-lft-tab-1">Description and Inclusive Benefit</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-2">Feature Details</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-3">Contact Details</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-4">Credit Arrangment</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-5">Cncellation Agreement</a>
            </li>
            <li>
                <a data-toggle="tab" href="#demo-lft-tab-6">Confidentiality</a>
            </li>
        </ul>

        <!--Tabs Content-->
        <div class="tab-content">

            <div id="demo-lft-tab-1" class="tab-pane fade active in">
                <div class="row"> 
                    <div class="col-md-2 text-center">
                        <div style="display: none">
                            <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                        </div>
                        <div class="wr_img">
                            <?php if ($model->main_logo == "" || $model->isNewRecord ){ ?>
                                <label for = 'itemgroup-file'>
                                    <img id ='feature_images' src="<?= $base_url."/backend/uploads/empty-avatar.png";?>" class='img-md'>
                                </label>
                            <?php } else {?>
                                <label for="itemgroup-file">
                                    <img id="feature_images" src="<?= $img_url;?>" class="img-md" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';">
                                </label>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                    </div>
                    
                    <div class="col-md-6">
                        <?= $form->field($model, 'full_name')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                        <?php if ($model->status != 1) { $model->status = 0;} ?>
                        <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?> 
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <p class="text-main">Description</p>
                        <?= $form->field($model, 'description')->textArea(['class'=>'editor_area'])->label(false) ?>
                    </div>
                    <div class="col-md-6">
                        <p class="text-main">Inclusive Benefit</p>
                        <?= $form->field($model, 'inclusive_benefit')->textArea(['class'=>'editor_area'])->label(false) ?>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-2" class="tab-pane fade">
                <div class="panel panel-bordered panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-2">
                                <h3 class="panel-title">Group</h3>
                            </div>
                            <div class="col-md-2">
                                <h3 class="panel-title">Title</h3>
                            </div>
                            <div class="col-md-7">
                                <h3 class="panel-title">Description</h3>
                            </div>
                            <div class="col-md-1" style="padding-left: 20px; padding-top: 5px;">
                                <button type="button" class="btn btn-primary btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="nano" style="height: 400px">
                        <div class="nano-content">
                            <div class="panel-body calculate_item">
                                <?php
                                    if($model->isNewRecord){
                                ?>
                                <div class="row row_line" data-id=1 id="row_line_1">
                                    <div class="col-md-2">
                                        <select class="form-control group" name="group[]" data-id=1 id="group_1">
                                        <?php 
                                            foreach ($item_type as $key => $value) {
                                                echo "<option value=".$value['id'].">". $value['title'] ."</option>";
                                            }
                                        ?>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="feature_title[]" placeholder="Title…" class="form-control feature_title" data-id=1 id="feature_title_1" />
                                    </div>
                                    <div class="col-md-7">
                                        <textarea name="feature_description[]" placeholder="Description…" class="form-control feature_description" data-id=1 id="feature_description_1" ></textarea>
                                    </div>
                                    <div class="col-md-1 text-center">
                                        <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>
                                    </div>
                                </div>
                                <?php
                                    }else{
                                        $i = 0;
                                        if(empty($model_feature)){
                                ?>
                                <div class="row row_line" data-id=1 id="row_line_1">
                                    <div class="col-md-2">
                                        <select class="form-control group" name="group[]" data-id=1 id="group_1">
                                        <?php 
                                            if(!empty($item_type)){
                                                foreach ($item_type as $key => $value) {
                                                    echo "<option value=".$value['id'].">". $value['title'] ."</option>";
                                                }
                                            }
                                        ?>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="feature_title[]" placeholder="Title…" class="form-control feature_title" data-id=1 id="feature_title_1" />
                                    </div>
                                    <div class="col-md-7">
                                        <textarea name="feature_description[]" placeholder="Description…" class="form-control feature_description" data-id=1 id="feature_description_1" ></textarea>
                                    </div>
                                    <div class="col-md-1 text-center">
                                        <button type="button" class="btn btn-primary btn-sm btn-icon btn-circle" id="add_more"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                <?php
                                        }
                                        foreach ($model_feature as $key => $value) {
                                            $i++;
                                ?>
                                <div class="row row_line" data-id="<?= $i; ?>" id="row_line_<?= $i; ?>">
                                    <div class="col-md-2">
                                        <select class="form-control group" name="group[]" data-id=1 id="group_<?= $i ?>">
                                        <?php 

                                            foreach ($item_type as $key => $val) {
                                                if($value['id_item_group_type'] == $val['id']){
                                                    $selected = 'selected';
                                                }else{
                                                    $selected = '';
                                                }
                                                echo "<option ".$selected." value=".$val['id'].">".$val['title']."</option>";
                                            }
                                        ?>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="feature_title[]" value="<?= $value['title'] ?>" placeholder="Title…" class="form-control feature_title" data-id="<?= $i; ?>" id="feature_title_<?= $i; ?>" />
                                    </div>
                                    <div class="col-md-7">
                                        <textarea name="feature_description[]" placeholder="Description…" class="form-control feature_description" data-id="<?= $i; ?>" id="feature_description_<?= $i; ?>" ><?= $value['description'] ?></textarea>
                                    </div>
                                    <div class="col-md-1 text-center">
                                        <?php if($i == 1){ ?>
                                        <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>                                        <?php }else{ ?>
                                        <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove' id='remove_row_2_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                                        <?php } ?>
                                    </div>
                                </div>
                                <?php }} ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-3" class="tab-pane fade">
                <div class="row">
                    <div class="col-md-12">
                        <?php 
                            if(!$model->isNewRecord){
                                $tag_arr = \backend\models\ItemGroupDepartment::find()
                                    ->select('id_department')
                                    ->where(['id_item_group'=>$model->id])
                                    ->asArray()
                                    ->all();
                                $row_department = [];
                                if(!empty($tag_arr)){
                                    foreach($tag_arr as $d){
                                        $row_department[]=$d['id_department'];
                                    }
                                }
                            }else{
                                $row_department = [];
                            }

                            $data_department = ArrayHelper::map(\backend\models\Department::find()->all(), 'id', 'name'); 

                                 
                        ?>
                        <label>Cotact Department</label>
                        <?= Select2::widget([
                                'name' => 'department[]',
                                'value'=> $row_department,
                                'data' => $data_department,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'department_data'],
                                'pluginOptions' => [
                                    'tags' => false,
                                    // 'tokenSeparators' => [',', ' '],
                                    // 'maximumInputLength' => 20,
                                    'allowClear' => true
                                ],
                            ]);
                        ?>  
                        <div class="line15"></div>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-4" class="tab-pane fade">
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-main text-uppercase">credit arrangment</p>
                        <?= $form->field($model, 'credit_arrangment')->textArea(['class'=>'editor_area', 'value'=>$model->isNewRecord ? !empty($company_profile) ? $company_profile->credit_arrangment : '' : $model->credit_arrangment])->label(false) ?>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-5" class="tab-pane fade">
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-main text-uppercase">cancellation agreement</p>
                        <?= $form->field($model, 'cancellation_agreement')->textArea(['class'=>'editor_area', 'value'=>$model->isNewRecord ? !empty($company_profile) ? $company_profile->cancellation_agreement : '' : $model->cancellation_agreement])->label(false) ?>
                    </div>
                </div>
            </div>

            <div id="demo-lft-tab-6" class="tab-pane fade">
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-main text-uppercase">confidentiality</p>
                        <?= $form->field($model, 'confidentiality')->textArea(['class'=>'editor_area', 'value'=>$model->isNewRecord ? !empty($company_profile) ? $company_profile->confidentiality : '' : $model->confidentiality])->label(false) ?>
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
$item_type_json = json_encode($item_type);

$script = <<<JS

    var base_url = "$base_url";

    $('.editor_area').each(function(e){
        CKEDITOR.replace( this.id, { customConfig: base_url + '/plugins/ckeditor/config.js' });
    });

    var dataToString = JSON.stringify($item_type_json);
    var stringReplaced = dataToString.replace(/'/g, "&#39;");
    var item_type_data = JSON.parse(stringReplaced);

    var string_item_type_data = "";
    $.each(item_type_data,function(key,value){
        string_item_type_data = string_item_type_data + "<option value="+value.id+">"+value.title+"</option>";
    });

    $(function () {
        $("#itemgroup-file").change(function () {
            readURL(this);
        });
        $("#itemgroup-file").hide();
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

    // $('#itemgroup-description, #itemgroup-inclusive_benefit, #itemgroup-plan_detail').summernote({
    //     height : '350px',
    //     toolbar: [
    //         // [groupName, [list of button]]
    //         ['style', ['bold', 'italic', 'underline', 'clear']],
    //         ['font', ['strikethrough', 'superscript', 'subscript']],
    //         ['fontsize', ['fontsize']],
    //         ['color', ['color']],
    //         ['table', ['table']],
    //         ['para', ['ul', 'ol', 'paragraph']],
    //     ],
    // });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.feature_title[data-id]:last').attr('data-id');
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            var title = $('.feature_title[data-id='+i+']').val();
            if(title ==''){
                swal("Information", "Title can not blank!", "warning");
                return false;
            }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-2'>" +
                                "<select name='group[]' class='form-control group' id='group_"+i+"' data-id="+i+">" +
                                    string_item_type_data +
                                "</select>" +   
                            "</div>" +
                            "<div class='col-md-2'>" +
                                "<input type='text' name='feature_title[]' placeholder='Title…' class='form-control feature_title' data-id="+i+" id='feature_title_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-7'>" +
                                "<textarea name='feature_description[]' placeholder='Description…' class='form-control feature_description' data-id="+i+" id='feature_description_"+i+"' ></textarea>" +
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove ' id='remove_row_2_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>"
                        ;

            $('.calculate_item').append(string);

            $('.feature_title[data-id='+i+']').focus();

        });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id');

        i--;
        var id = $(this).attr('data-id');
        $('#row_line_'+ id).remove();

    });

JS;

$this->registerJs($script);

?>