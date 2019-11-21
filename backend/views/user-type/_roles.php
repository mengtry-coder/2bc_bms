<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm; 
use yii\helpers\Url;

$this->title = 'User Type & Role: ' . $model->user_type_name;
$this->params['breadcrumbs'][] = ['label' => 'User Type', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user_type_name]; 
?>
<style>
.panel-eo {
    border-color: #f87232;
}
</style>
<div class="user-type-form">
    
    <div class="row"> 
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading panel-eo">
                    <div class="panel-title">
                        Employee which are using this role (<?=count($employee_using_role);?>)
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
                                foreach($employee_using_role as $employee_using_roles){
                                    $index++;
                            ?>
                            <tr>
                                <td>
                                    <?=$index;?>
                                </td>
                                <td>
                                    <?= "<a target='_blank' href='". URL::toRoute(['employee-profile/profile','id'=>$employee_using_roles['id']])."' class='text-info'> ".$employee_using_roles['user_name']."</a>";?>
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
                        User Type & Roles
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-8">
                            <?= $form->field($model, 'user_type_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-4">
                            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                            <?php if ($model->status != 1) { $model->status = 0;} ?>
                            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr> 
                                            <th>Features</th> 
                                            <th class="text-center">Allow</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
                                       <?php
                                            getUerTypeRole(0,$model->id);  
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

function getUerTypeRole($parent_id = 0,$user_type_id = 1){
    $permission_menu = Yii::$app->db->createCommand("
    SELECT 
        pm.id,
        pm.menu_name,
        pa.permission_menu_id as checked 
    FROM permission_menu AS pm
    LEFT JOIN permission_action AS pa ON pm.id = pa.permission_menu_id
    AND pa.user_type_id = $user_type_id
    WHERE parent_id = $parent_id and status = 1
    ORDER BY pm.sort")->queryAll();
    if(!empty($permission_menu)){
        foreach($permission_menu as $pm){
            $checked = '';
            if($pm['checked']!=null){
                $checked = 'checked';
            }
            echo 
            "<tr>
                <td><a class='text-primary text-bold'>".$pm['menu_name']."</a></td>
                <td class='text-center'>
                    <div class='form-group userTypeRoles-main_allow' style='margin-bottom: 0px;'>
                        <input id='main_allow-".$pm['id']."' value='".$pm['id']."' $checked name='permission_allow[]' class='magic-checkbox checkbox_allow' type='checkbox' data-id='".$pm['id']."'>
                        <label for='main_allow-".$pm['id']."'class='unselectable'>Allow</label>
                    </div> 
                 
                    </td>
            </tr>";
            if(checkIfhasChild($pm['id'])==true){
                getSubRole($pm['id'],$user_type_id);
            }
        }
    }
    
}
function getSubRole($parent_id = 0,$user_type_id = 1){
    $permission_menu = Yii::$app->db->createCommand("
    SELECT 
        pm.id,
        pm.menu_name,
        pa.permission_menu_id as checked 
    FROM permission_menu AS pm
    LEFT JOIN permission_action AS pa ON pm.id = pa.permission_menu_id
    AND pa.user_type_id = $user_type_id
    WHERE parent_id = $parent_id and status = 1
    ORDER BY pm.sort")->queryAll();
    if(!empty($permission_menu)){
        foreach($permission_menu as $pm){
            $checked = '';
            if($pm['checked']!=null){
                $checked = 'checked';
            }
            echo 
            "<tr>
                <td style='text-align: left; text-indent:50px;'><a class='text-primary text-bold'>".$pm['menu_name']."</a></td>
                <td class='text-center'>
                    <div class='form-group userTypeRoles-main_allow' style='margin-bottom: 0px;'>
                        <input id='main_allow-".$pm['id']."' value='".$pm['id']."' $checked name='permission_allow[]' class='magic-checkbox checkbox_allow' type='checkbox' data-id='".$pm['id']."'>
                        <label for='main_allow-".$pm['id']."'class='unselectable'>Allow</label>
                    </div> 
                </td>
            </tr>";
        }
    }
}
function checkIfhasChild($parent_id){
    $child = \backend\models\PermissionMenu::find()
        ->where(['parent_id'=>$parent_id, 'status'=>1])
        ->orderBy(['sort'=>SORT_ASC])->all();
    if(empty($child)){
        return false;
    }else{
        return true;
    }
}
?>