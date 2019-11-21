<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\widgets\ActiveForm;
$base_url = Yii::getAlias('@web');
$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = $model->task_name;
$this->params['breadcrumbs'][] = ['label' => 'Tasks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<style type="text/css">
    /*.action_button {
        width: 30px !important;
        height: 30px !important;
        padding: 0px !important;
        border-radius: 50%;
    }*/
    .row_line {
        padding-bottom: 15px;
    }
</style>
<div class="task-view">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Task Info</h3>
                </div>
                <div class="panel-body">
                    <p>Created at: <?= date_format(date_create($model->created_date),'F d, Y') ?></p>
                    <p>Start Date: <?= date_format(date_create($model->start_date),'F d, Y') ?></p>
                    <p>Due Date: <?= date_format(date_create($model->due_date),'F d, Y') ?></p>
                    <p>Status: <?= '<span class="label '.$model->taskStatus->css_class.'">'.$model->taskStatus->name.'</span>' ?></p>
                    <p>Priority: <?= '<span class="label '.$model->taskPriority->css_class.'">'.$model->taskPriority->name.'</span>'; ?></p>
                    <hr>
                    Tag 
                    <?php 
                        if(!empty($model_tag)){
                            foreach ($model_tag as $key => $value) {
                                echo '<button class="btn btn-sm btn-default btn-rounded">'.$value->id_tag.'</button>&nbsp;&nbsp;&nbsp;';
                            }
                        }
                    ?>
                    <hr>
                    <p class="text-semibold">Assign</p>
                        <ul class="list-group">
                        <?php 
                            if(!empty($model_member)){
                                foreach ($model_member as $key => $value) {
                                    $profile_image = $base_url."/".$value['img_url'];
                        ?>
                            <li class="list-group-item">
                                <a target="_blank" class="btn-link" href="<?= URL::toRoute(['employee-profile/profile','id'=>$value['id']]) ?>">
                                    <img src="<?= $profile_image ?>" class="img-circle img-xs" />
                                    <?= $value['employee_name'] ?>
                                </a>
                            </li>  
                        <?php
                                }
                            }
                        ?>
                        </ul>
                    <hr>
                    <h5>Description</h5>
                    <?= nl2br($model->description) ?>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <?php 

            $validationUrl = ['task/validation'];
            if (!$model->isNewRecord){
                $validationUrl['id'] = $model->id;
            }

            $form = ActiveForm::begin(); 
            ?>
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-control">
                        <button type="button" class="btn btn-icon btn-sm btn-circle btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                    </div>
                    <h3 class="panel-title">Check List</h3>
                    <div style="padding-left: 20px; padding-right: 20px;">
                        <div class="progress progress-lg">
                            <div style="width: 0%;" id="check_list_progress" class="progress-bar progress-bar-info">0%</div>
                        </div>
                        <input type="hidden" name="task_progress">
                    </div>
                </div>
                <div class="pad-all"></div>

                <!-- <div class="nano" style="height: 500px">
                    <div class="nano-content"> -->
                        <div class="panel-body calculate_item">
                            <?php 
                                if(!empty($model_item)){
                                $i = 0;
                                foreach ($model_item as $key => $value) {
                                    $i++;
                            ?>
                            <div class="row row_line" data-id="<?= $i ?>" id="row_line_<?= $i ?>">
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <input class="magic-checkbox checklist_box" <?= $value->status == 1 ?"checked":'' ?> value="1" name="checklist_box[]" type="checkbox" data-id="<?= $i ?>" id="checkbox_list_<?= $i ?>">
                                            <label for="checkbox_list_<?= $i ?>" class="checklist_box" data-id="<?= $i ?>"></label>
                                            <input type="hidden" name="check_list_status[]" value="<?= $value->status ?>" data-id="<?= $i ?>" id="check_list_status_<?= $i ?>">
                                        </div>
                                        <input type="text" name="description[]" placeholder="Description…" value="<?= $value->description ?>" class="form-control description" data-id="<?= $i ?>" id="description_<?= $i ?>" required/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div id="demo-dp-range">
                                        <div class="input-daterange input-group timepicker">
                                            <input type="text" class="form-control start_time" value="<?= $value->from_time ?>" name="start_time[]" id="start_time_<?= $i ?>" />
                                            <span class="input-group-addon">to</span>
                                            <input type="text" class="form-control end_time" value="<?= $value->to_time ?>" name="end_time[]" id="end_time_<?= $i ?>" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1 text-center">
                                    <?php if($i == 1){ ?>
                                    <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>
                                    <?php }else{ ?>
                                    <button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php }}else{ ?>
                            <div class="row row_line" data-id=1 id="row_line_1">
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <input class="magic-checkbox checklist_box" value="1" name="checklist_box[]" type="checkbox" data-id=1 id="checkbox_list_1">
                                            <label for="checkbox_list_1" class="checklist_box" data-id=1></label>
                                            <input type="hidden" name="check_list_status[]" value="0" data-id=1 id="check_list_status_1">
                                        </div>
                                        <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" required/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div id="demo-dp-range">
                                        <div class="input-daterange input-group timepicker">
                                            <input type="text" class="form-control start_time" name="start_time[]" id="start_time_1" />
                                            <span class="input-group-addon">to</span>
                                            <input type="text" class="form-control end_time" name="end_time[]" id="end_time_1" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1 text-center">
                                    <button type="button" class="btn btn-info btn-sm btn-icon btn-circle"><i class="demo-psi-gear"></i></button>
                                </div>
                            </div>

                            <?php } ?>
                        </div>
                    <!-- </div>
                </div> -->
                <div class="panel-footer">
                    <div class="text-right"> 
                        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
                    </div> 
                </div>
            </div>

            
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>

<?php
$script = <<<JS

    $('.timepicker input').timepicker({
        timeFormat: 'h:mm p',
        // minTime: '8',
        // maxTime: '17',
        dynamic: true,
    });
    
    checkListProgress();

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.description[data-id]:last').attr('data-id'); 
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            var item = $('.description[data-id='+i+']').val();
            if(item ==''){
                // swal("Information", "Description can not blank!", "warning");
                $('.description[data-id='+i+']').focus();
                return false;
            }

            i++;
            index++;

            var previous_start_time = $(".start_time:last").val();
            var previous_end_time = $(".end_time:last").val();

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-8'>" +
                                "<div class='input-group'>" +
                                    "<div class='input-group-addon'>" +
                                        "<input class='magic-checkbox checklist_box' name='checklist_box[]' value=1 type='checkbox' data-id="+i+" id='checkbox_list_"+i+"'> " +
                                        "<label for='checkbox_list_"+i+"' class='checklist_box'></label>" +
                                        "<input type='hidden' name='check_list_status[]' data-id="+i+" id='check_list_status_"+i+"'>" +
                                    "</div>"+
                                    "<input type='text' name='description[]' placeholder='Description…' class='form-control description' data-id="+i+" id='description_"+i+"' required/>" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-3'>" +
                                "<div id='demo-dp-range'>" +
                                    "<div class='input-daterange input-group timepicker'>" +
                                        "<input type='text' class='form-control start_time' name='start_time[]' value='"+previous_start_time+"' id='start_time_"+i+"' />" +
                                        "<span class='input-group-addon'>to</span>" +
                                        "<input type='text' class='form-control end_time' name='end_time[]' value='"+previous_end_time+"' id='end_time_"+i+"' />" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-sm btn-icon btn-circle btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>" 
                        ;

            $('.calculate_item').append(string);
            $('.description[data-id='+i+']').focus();

            checkListProgress();
            
            $('.timepicker input').timepicker({
                timeFormat: 'h:mm p',
                // minTime: '8',
                // maxTime: '17',
                dynamic: true,
            });

        });

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id'); 

        i--;
        var id = $(this).attr('data-id'); 
        $('#row_line_'+ id).remove();

        checkListProgress();
        
    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    function checkListProgress(){

        var numberOfChecked = $('.checklist_box:checkbox:checked').length;
        var totalCheckboxes = $('.checklist_box:checkbox').length;
        if(totalCheckboxes == 0){
            totalCheckboxes = 1;
        }
        var percentage = (numberOfChecked / totalCheckboxes ) * 100;
        percentage = parseFloat(percentage).toFixed(2);

        $("#check_list_progress").text(percentage +"%");
        $("#check_list_progress").css("width", percentage+"%");

        $(".checklist_box").change(function(){
            var numberOfChecked = $('.checklist_box:checkbox:checked').length;
            var totalCheckboxes = $('.checklist_box:checkbox').length;
            if(totalCheckboxes == 0){
                totalCheckboxes = 1;
            }
            var percentage = (numberOfChecked / totalCheckboxes ) * 100;
            percentage = parseFloat(percentage).toFixed(2);

            $("#check_list_progress").text(percentage +"%");
            $("#task_progress").val(percentage);
            $("#check_list_progress").css("width", percentage+"%");
            
            var id = $(this).data('id');
            if($(this).is(':checked')){
                $("#check_list_status_"+id).val(1);
            }else{
                $("#check_list_status_"+id).val(0);
            }

        });
    }



JS;

$this->registerJs($script);

?>
