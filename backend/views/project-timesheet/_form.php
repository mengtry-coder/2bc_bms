<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web'); 
$model_member = Yii::$app->db->createCommand("
    SELECT b.id, CONCAT(b.id_prefix, ' ', b.first_name, ' ', b.last_name) as member_name
    FROM project_member as a 
    INNER JOIN employee_profile as b on a.id_employee = b.id
    WHERE a.id_project = :id_project
")->bindParam(':id_project', $source_id)->queryAll();

$employee_list = ArrayHelper::map($model_member, 'id', 'member_name'); 

$task_list = ArrayHelper::map(\backend\models\Task::find()
    ->where(['id_related_to'=>$type, 'id_related_profile'=>$source_id])
    ->all(), 'id', 'task_name'); 

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$time_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-clock"></i></span> {input} </div>{error}{hint}';

?>

<div class="project-timesheet-form">

    <?php 

    $validationUrl = ['project-timesheet/validation'];
    if (!$model->isNewRecord){
        $validationUrl['id'] = $model->id;
    }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => true,
        'enableClientValidation' => true,
        'options' => ['autocomplete' => 'off'],
        'validationUrl' => $validationUrl
    ]); 
    ?>

<style type="text/css">
    .action_button {
        width: 30px !important;
        height: 30px !important;
        padding: 0px !important;
        border-radius: 50%;
    }
    .row_line {
        padding-bottom: 15px;
    }
</style>

    <div class="row">
        <div class="col-md-6 col-sm-6">
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'note')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'id_task')->widget(Select2::classname(), [
                            'data' => $task_list,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                    ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?php 
                        if(!$model->isNewRecord){
                            $tag_arr = \backend\models\ProjectTimesheetTag::find()
                                ->select('id_tag')
                                ->where(['id_project_timesheet'=>$model->id])
                                ->asArray()
                                ->all();
                            $row_tag = [];
                            if(!empty($tag_arr)){
                                foreach($tag_arr as $d){
                                    $row_tag[]=$d['id_tag'];
                                }
                            }
                        }else{
                            $row_tag = [];
                        }
                             
                    ?>
                    <label>Tag</label>
                    <?= Select2::widget([
                            'name' => 'tag[]',
                            'value'=>$row_tag,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select', 'multiple' => true, 'id'=>'timesheet_tag'],
                            'pluginOptions' => [
                                'tags' => true,
                                'tokenSeparators' => [',', ' '],
                                'maximumInputLength' => 20,
                                'allowClear' => true
                            ],
                        ]);
                    ?>  
                    <div class="line15"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <?php 
                        if(!$model->isNewRecord){
                            $member_arr = \backend\models\ProjectTimesheetMember::find()
                                ->select('id_employee')
                                ->where(['id_project_timesheet'=>$model->id])
                                ->asArray()
                                ->all();
                            $row = [];
                            if(!empty($member_arr)){
                                foreach($member_arr as $d){
                                    $row[]=$d['id_employee'];
                                }
                            }
                        }else{
                            $row = [];
                        }
                             
                    ?>
                    <label>Assign To</label>
                    <?= Select2::widget([
                            'name' => 'assign_to[]',
                            'data' => $employee_list,
                            'value'=>$row,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => ' Assign To', 'multiple' => true, 'id'=>'id_assign_to'],
                            'pluginOptions' => [
                                'allowClear' => false
                            ],
                        ]);
                    ?>
                    <div class="line15"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'start_date', ['template'=>$date_template])->textInput(['value'=>$model->isNewRecord?date('Y-m-d'):$model->start_date, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'start_time', ['template'=>$time_template])->textInput() ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'end_date', ['template'=>$date_template])->textInput(['value'=>$model->isNewRecord?date('Y-m-d'):$model->end_date, 'readonly' => true, 'style'=>'background: #fff !important;']) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'end_time', ['template'=>$time_template])->textInput() ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'description')->textArea(['rows' => 4]) ?>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="panel panel-bordered panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-10">
                            <h3 class="panel-title">Activity</h3>
                        </div>
                        <div class="col-md-2 text-right">
                            <h3 class="panel-title"><i class="demo-psi-gear"></i></h3>
                        </div>
                    </div>
                </div>
                <div class="panel-body calculate_item">
                    <?php 
                        if($model->isNewRecord){
                    ?>
                    <div class="row row_line" data-id=1 id="row_line_1">
                        <div class="col-md-11">
                            <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" />
                        </div>
                        <div class="col-md-1 text-center">
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <?php 
                        }else{
                            if(empty($model_item)){
                    ?>
                    <div class="row row_line" data-id=1 id="row_line_1">
                        <div class="col-md-11">
                            <input type="text" name="description[]" placeholder="Description…" class="form-control description" data-id=1 id="description_1" />
                        </div>
                        <div class="col-md-1 text-center">
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <?php
                        }
                            $i = 1;
                            foreach ($model_item as $key => $value) {
                                $i++;
                    ?>
                    <div class="row row_line" data-id="<?= $i; ?>" id="row_line_<?= $i; ?>">
                        <div class="col-md-11">
                            <input type="text" name="description[]" value="<?= $value->description; ?>" placeholder="Description…" class="form-control description" data-id="<?= $i; ?>" id="description_<?= $i; ?>" />
                        </div>
                        
                        <div class="col-md-1 text-center">
                            <?php if($i == 2){ ?>
                            <button type="button" class="btn btn-xs btn-primary action_button" id="add_more"><i class="fa fa-plus"></i></button>
                            <?php }else{ ?>
                            <button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_<?= $i ?>' data-id="<?= $i ?>"><i class='fa fa-minus'></i></button>
                            <?php } ?>
                        </div>
                    </div>
                    <?php }} ?>
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

if(!$model->isNewRecord){
    $type = 0;
    $source_id = 0;
}

$script = <<<JS
    
    $(document).on('change','input[type=number]',function(){
        if($(this).val() == '' || $(this).val() < 0){
            $(this).val(0);
        }
    });

    //~~~~~~~~~~~~~~~Date Picker~~~~~~~~~~~~~~~~~~~

    $("#projecttimesheet-start_date").change(function(){

        $('#projecttimesheet-end_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#projecttimesheet-end_date').val())){
            $('#projecttimesheet-end_date').datepicker('setDate', $(this).val());
        }

    });

    //~~~~~~~~~~~~~~~End Date Picker~~~~~~~~~~~~~~~

    $('#projecttimesheet-start_date, #projecttimesheet-end_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $('#projecttimesheet-start_time, #projecttimesheet-end_time').timepicker({
        timeFormat: 'h:mm p',
        // minTime: '8',
        // maxTime: '17',
        dynamic: true,
    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Item Row ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        var data_i = $(document).find('.description[data-id]:last').attr('data-id'); 
        var i = parseInt(data_i);
        var index = 1;

        $('#add_more').unbind('click');
        $('#add_more').bind('click', function (e){
            e.preventDefault();

            var item = $('.description[data-id='+i+']').val();
            if(item ==''){
                alert("Description can not null!");
                return false;
            }

            i++;
            index++;

            var string = "<div class='row row_line' data-id="+i+" id='row_line_"+i+"'>" +
                            "<div class='col-md-11'>" +
                                "<input type='text' name='description[]' placeholder='Description…' class='form-control description' data-id="+i+" id='description_"+i+"' />" +
                            "</div>" +
                            "<div class='col-md-1 text-center'>" +
                                "<button type='button' class='btn btn-danger btn-xs btn_remove action_button' id='remove_row_"+i+"' data-id="+i+">" +
                                    "<i class='fa fa-minus'></i>" +
                                "</button>" +
                            "</div>" +
                        "</div>" 
                        ;

            $('.calculate_item').append(string);


        });

    $(document).on('click', '.btn_remove', function() {

        var current_id = $(this).attr('data-id'); 

        i--;
        var id = $(this).attr('data-id'); 
        $('#row_line_'+ id).remove();
        
    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Item ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


JS;

$this->registerJs($script);

?>
