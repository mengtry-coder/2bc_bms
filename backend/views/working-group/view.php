<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm; 
use yii\helpers\Url;
use yii\bootstrap\Modal; 

$base_url = Yii::getAlias('@web');

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Working Group', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name]; 
?>
<style>
.panel-eo {
    border-color: #f87232;
}
</style>
<div class="user-type-form">

<?php
$script = <<<JS

$(document).on("click","#modalButton",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
});

JS;
$this->registerJs($script);
?>

    <?php
        Modal::begin([
            'header' => ' <h4 class="modal-title">Add more member</h4>',
            'id' => 'modal',
            'class' => 'modal fade',
            'size' => 'modal-md',
        ]);
        echo "<div id='modalContent'></div>";
        Modal::end();
    
    ?>
    
    <div class="row"> 
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-control">
                        <button value="<?= Url::toRoute(['working-group/add-member', 'working_group_id'=>$model->id]) ?>" title="Add more member" type="button" id="modalButton" class="btn btn-warning btn-icon btn-sm btn-circle"><i class="fa fa-plus icon-lg"></i></button>
                    </div>
                    <div class="panel-title">
                        Employee which are using this group (<?=count($model_employee);?>)
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>No.</th> 
                                <th>Name</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <?php
                                $index = 0;
                                foreach($model_employee as $model_employees){
                                    $index++;

                                    $model_employees_id = $model_employees->id;

                                    $model_member = Yii::$app->db->createCommand("
                                        SELECT COALESCE(c.filename, (select filename from uploaded_file where id =1)) as img_url
                                        FROM employee_profile as b
                                        LEFT JOIN uploaded_file as c on c.id = b.img_url
                                        WHERE b.id  = :id_employee
                                    ")->bindParam(':id_employee', $model_employees_id)->queryScalar();

                                    $profile_image = $base_url."/".$model_member;
                            ?>
                            <tr>
                                <td>
                                    <?=$index;?>
                                </td>
                                <td>
                                    <div class="pull-right">
                                        <a class="btn btn-xs btn-circle btn-default" data-confirm="Are you sure want to remove this employee?" method="post" href="<?= Url::to(['working-group/remove-employee', 'id' => $model_employees->id]) ?>"><i class="demo-psi-cross"></i></a>
                                    </div>
                                    <span class="pad-lft"></span>
                                    <img src="<?= $profile_image ?>" class="img-circle img-xs" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';"/> 
                                    <span class="pad-lft"></span>
                                    <?= "<a target='_blank' href='". URL::toRoute(['employee-profile/profile','id'=>$model_employees['id']])."' class='text-info'> ".$model_employees->id_prefix  . " " . $model_employees->first_name ." ". $model_employees->last_name."</a>";?>
                                    <p class="text-muted text-sm" style="padding-left: 65px; margin-top: -10px;"><?= $model_employees->position->position_type ?></p>
                                </td>
                            </tr> 
                            <?php
                                } 
                            ?>
                        </tbody>
                    </table> 
                </div>
            </div> 
        </div> 
        <div class="col-md-8">
            <?php $form = ActiveForm::begin(); ?> 
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-title">
                        Working Group Role
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr> 
                                            <th>Data</th> 
                                            <th class="text-center">Allow</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Own Data</td>
                                            <td class="text-center">
                                                <div class="checkbox" style="margin: 0px">
                                                    <input id="own_data" class="own_data magic-checkbox" checked disabled type="checkbox">
                                                    <label for="own_data"></label>
                                                </div>
                                            </td>
                                        </tr>
                                        <?php 

                                            $department = \backend\models\WorkingGroupDepartment::find()->where(['id_working_group'=>$model->id])->all();
                                            $department = !empty($department) ? $department : [];

                                            foreach ($department as $dept) {
                                        ?>
                                            <tr>
                                                <td valign="center" class="text-primary text-semi-bold"> 
                                                    <?= $dept->department->name ?>
                                                </td>
                                                <td class="text-center">
                                                    <div class="checkbox" style="margin: 0px">
                                                        <input type="checkbox" class="magic-checkbox checkboxAll" data-id="<?= $dept->id ?>" name="check_all" id="check_all_<?= $dept->id ?>">
                                                        <label for="check_all_<?= $dept->id ?>"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php 
                                            
                                                // $employee_profile = \backend\models\EmployeeProfile::find()
                                                // ->select(['employee_profile.first_name', 'employee_profile.last_name', 'employee_profile.id_prefix', 'user.id'])
                                                // ->innerJoin('user', 'user.id_employee = employee_profile.id')
                                                // ->where(['employee_profile.id_department'=>$dept->id_department])
                                                // ->all();

                                                $employee_profile = Yii::$app->db->createCommand("select a.first_name, a.last_name, a.id_prefix, b.id as id from employee_profile a inner join `user` b on b.id_employee = a.id where a.id_department = $dept->id_department") ->queryAll();
                                                $employee_profile = !empty($employee_profile) ? $employee_profile : [];
                                                foreach ($employee_profile as $emp) {
                                                    $count = \backend\models\WorkingGroupData::find()
                                                    ->where(['id_user'=>$emp['id']])
                                                    ->andWhere(['id_working_group'=>$model->id])
                                                    ->count();
                                                    
                                            ?>
                                            <tr class="row_<?= $dept->id ?>">
                                                <td valign="center" style='text-align: left; text-indent:50px;'> 
                                                    <?= $emp['id_prefix']  . " " . $emp['first_name'] ." ". $emp['last_name'] ?>
                                                </td>
                                                <td class="text-center">
                                                    <div class="checkbox" style="margin: 0px">
                                                    <input type="checkbox" data-id="<?= $dept->id ?>" class="checkbox_dept magic-checkbox checkbox_dept_<?= $dept->id ?>" id="checkbox_<?= $emp['id'] ?>" value="<?= $emp['id'] ?>" name="user_id[]" <?php if ($count != 0){ echo 'checked'; } ?>>
                                                        <label for="checkbox_<?= $emp['id'] ?>"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php
                                                }
                                            ?>
                                        <?php
                                            }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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

    // $(".check_all").click(function(){
    //     var id = $(this).data('id');
    //     $('.row_'+ id +' .employee_id').not(this).prop('checked', this.checked);
    // });


    $(".checkboxAll").change(function() {
        var data_id = $(this).data('id');
        if (this.checked) {
            $('.checkbox_dept_'+ data_id).each(function() {
                this.checked=true;
            });
        } else {
            $('.checkbox_dept_'+ data_id).each(function() {
                this.checked=false;
            });
        }
    });

    $(".checkbox_dept").click(function () {
        var data_id = $(this).data('id');
        if ($(this).is(":checked")) {
            var isAllChecked = 0;

            $(".checkbox_dept_"+ data_id).each(function() {
                if (!this.checked)
                    isAllChecked = 1;
            });

            if (isAllChecked == 0) {
                $("#check_all_"+ data_id).prop("checked", true);
            }     
        }
        else {
            $("#check_all_"+ data_id).prop("checked", false);
        }
    });


    // $(".employee_id").click(function(){

    //     if($(".employee_id").length == $(".employee_id:checked").length) {
    //         $(".check_all").prop("checked", true);
    //     } else {
    //         $(".check_all").removeAttr("checked");
    //     }

    // });

JS;
$this->registerJs($script);

?>