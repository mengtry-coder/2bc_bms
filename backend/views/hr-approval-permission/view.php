<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm; 
use yii\helpers\Url;

$base_url = Yii::getAlias('@web');
$approverName = $model->approvalInfo->id_prefix  . " " . $model->approvalInfo->first_name ." ". $model->approvalInfo->last_name;
$this->title = $approverName;
$this->params['breadcrumbs'][] = ['label' => 'HR Approval Permission By', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $approverName]; 
?>
<style>
.panel-eo {
    border-color: #f87232;
}
</style>
<div class="user-type-form">
    
    <div class="row"> 
        <!-- <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-title">
                        Approval on (<?php count($model_employee);?>)
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
                            <tr> 
                                <td>1</td> 
                                <td>Dara Tester</td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
            </div> 
        </div>  -->
        <div class="col-md-12">
            <?php $form = ActiveForm::begin(); ?> 
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-title">
                        Approval management
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr> 
                                            <th>Department > Employee</th> 
                                            <th class="text-center">Allow</th>
                                        </tr>
                                    </thead>
                                    <tbody> 
                                        <?php 

                                            $department = \backend\models\HrApprovalPermissionDepartment::find()->where(['hr_approval_permission_id'=>$model->id])->all();
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
                                                $employee_profile = \backend\models\EmployeeProfile::find()->where(['id_department'=>$dept->department_id])->all();
                                                $employee_profile = !empty($employee_profile) ? $employee_profile : [];
                                                foreach ($employee_profile as $emp) {
                                                    $count = \backend\models\HrApprovalPermissionData::find()
                                                    ->where(['employee_id'=>$emp->id])
                                                    ->andWhere(['hr_approval_permission_id'=>$model->id])
                                                    ->count(); 
                                            ?>
                                            <tr class="row_<?= $dept->id ?>">
                                                <td valign="center" style='text-align: left; text-indent:50px;'> 
                                                    <?= $emp->id_prefix  . " " . $emp->first_name ." ". $emp->last_name ?>
                                                </td>
                                                <td class="text-center">
                                                    <div class="checkbox" style="margin: 0px">
                                                        <input type="checkbox" data-id="<?= $dept->id ?>" class="checkbox_dept magic-checkbox checkbox_dept_<?= $dept->id ?>" id="checkbox_<?= $emp->id ?>" value="<?= $emp->id ?>" name="employee_id[]" <?php if ($count != 0){ echo 'checked'; }else{echo '';} ?>>
                                                        <label for="checkbox_<?= $emp->id ?>"></label>
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

JS;
$this->registerJs($script);

?>