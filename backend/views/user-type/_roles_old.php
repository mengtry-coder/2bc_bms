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
                        Employee which are using this role
                    </div>
                </div>
                <div class="panel-body">

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
                                            $permission_menu = \backend\models\PermissionMenu::find() 
                                                ->where(['permission_menu.is_parent'=>1, 'permission_menu.status'=>1])
                                                ->orderBy(['sort'=>SORT_ASC])
                                                ->all(); 

                                            if(!empty($permission_menu)){
                                            foreach ($permission_menu as $key => $value) {
                                                $count = \backend\models\PermissionMenu::find()
                                                        ->where(['is_parent'=>0, 'status'=>1, 'parent_id'=>$value->id])
                                                        ->count();
                                                    $permission_action = \backend\models\PermissionAction::find()
                                                        ->where(['user_type_id'=>$model->id, 'permission_menu_id'=>$value->id]) 
                                                        ->all();
                                                        

                                                if($count == 0){
                                                    foreach($permission_action as $k => $v){
                                                         
                                        ?>
                                            <tr>
                                                <td><a class="text-primary text-bold"><?= $value->menu_name ?></a></td>
                                                <td class="text-center">
                                                    <div class="form-group userTypeRoles-main_allow" style="margin-bottom: 0px;">
                                                        <input id="main_allow-<?=$value->id;?>" value="" <?= $value['id'] == "1" ?"checked":'' ?> name="permission_allow[]" class="magic-checkbox checkbox_allow" type="checkbox" data-id="<?=$value->id;?>">
                                                        <label for="main_allow-<?=$value->id;?>"class="unselectable">Allow</label>
                                                    </div> 
                                                    <input type="hidden" name="permission_allows[]" value="<?= $value['id'];?>" data-id="<?= $value->id ?>" id="main_allowing_<?= $value->id ?>">    
                                                </td>
                                            </tr>
                                            
                                        <?php
                                                    }
                                            }else{
                                        ?> 
                                            <?php
                                                $permission_sub_menu = \backend\models\PermissionMenu::find()
                                                ->where(['is_parent'=>0, 'status'=>1, 'parent_id'=>$value->id])
                                                ->orderBy(['sort'=>SORT_ASC])
                                                ->all();
                                                
                                                if(!empty($permission_sub_menu)){
                                                    foreach ($permission_sub_menu as $key_sub => $value_sub) { 
                                                        $permission_action_sub = \backend\models\PermissionAction::find()
                                                        ->where(['user_type_id'=>$model->id, 'permission_menu_id'=>$value_sub->id]) 
                                                        ->all();
                                            ?>
                                            <tr>
                                                <td style="text-align: left; text-indent: 50px;"><a class="text-primary"><?= $value_sub->menu_name ?></a></td>
                                                <td class="text-center">
                                                    <div class="form-group userTypeRoles-sub_allow" style="margin-bottom: 0px;">
                                                        <input id="sub_allow-<?=$value_sub->id;?>" value="" <?= $value_sub['id'] == "1" ?"checked":'' ?> name="permission_allow[]" class="magic-checkbox checkbox_allow" type="checkbox" data-id="<?=$value_sub->id;?>">
                                                        <label for="sub_allow-<?=$value_sub->id;?>"class="unselectable">Allow</label>
                                                    </div> 
                                                    <input type="hidden" name="permission_allows[]" value="<?= $value_sub['id'];?>" data-id="<?= $value_sub->id ?>" id="sub_allowing_<?= $value_sub->id ?>">  
                                                </td>
                                            </tr>
                                                
                                            <?php
                                                    }
                                                }
                                            ?> 
                                        <?php
                                                }
                                            } 
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

function arrayFilterByColumn($array,$column,$value){
    $result = [];
    if(!empty($array)){
        foreach ($array as $key => $arr) {
            if($arr[$column] == $value){
                array_push($result, $arr);
            }
        }
        return $result;
    }else{
        return [];
    }
    

    
} 

function getArrayByColumn($array,$id,$column){
    
    $result = [];
    if(!empty($array)){
        if(in_array($id, array_column($array, $column)) == 1){
             
            foreach ($array as $key => $value) {
                if($value[$column] == $id){
                    $result = $array[$key];
                }
            }
            
        }
    }
    
    return $result;
    }
?>