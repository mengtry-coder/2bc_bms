<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\StandardOperationCheckList;
?>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-12">
            <div id="demo-accordion" class="panel-group accordion">
                <?php
                    $sop_step_list = Yii::$app->db->createCommand('
                    select standard_operation_step_list.* ,
                    standard_operation_step.name as step_name
                    from standard_operation_step_list 
                    left join standard_operation_step on standard_operation_step.id = standard_operation_step_list.id_standard_operation_step
                    where id_standard_operation_step = "'.$model->kpi_status.'"
                    ')->queryAll();
                    foreach($sop_step_list as $key => $value){ 

                        $checkList = StandardOperationCheckList::find()->where(['id_standard_operation_step_list' => $value['id'],'id_standard_operation_step'=>$model->kpi_status,'id_standard_operation'=>$model->id])->one();

                ?> 
                    <div class="panel"> 
                        <div class="panel-heading panel-bordered panel-mint">
                            <h4 class="panel-title">
                                <div class="row">
                                    <div class="col-md-8 col-xs-8">
                                        <a data-parent="#demo-accordion" data-toggle="collapse" href="#demo-acc-panel-<?=$key;?>" aria-expanded="true" class=""><b><?=$value['step_name']."</b> > ".$value['name'];?></a>
                                    </div>
                                    <div class="col-md-4 col-xs-4">
                                        <?php
                                        if($value['is_track'] == 1){
                                        ?> 
                                        <div class="pull-right" style="margin-right: 10px;">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="text" id="done_date_<?=$key?>" class="done_date form-control" name="done_date[]" placeholder="Done Date" value="<?= $checkList['done_date'] == "" ?"": $checkList['done_date'] ?>" data-id="<?=$key?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                        <input id="is_done-<?=$key?>" <?= $checkList['is_done'] == "1" ?"checked":'' ?> value="1" name="is_dones[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$key?>">
                                                        <label for="is_done-<?=$key?>" style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                        <input type="hidden" name="is_done[]" value="<?= $checkList['is_done'] == 1 ?1:0 ?>" data-id="<?=$key?>"  id="is_done_<?=$key?>">
                                                    </div>  
                                                </div>
                                            </div> 
                                        </div>
                                        <?php
                                        }else{
                                        ?>
                                        <div class="pull-right" style="margin-right: 10px; display:none;">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="text" id="done_date_<?=$key?>" class="done_date form-control" name="done_date[]" placeholder="Done Date" value="<?= $checkList['done_date'] == "" ?"": $checkList['done_date'] ?>" data-id="<?=$key?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                        <input id="is_done-<?=$key?>" <?= $checkList['is_done'] == "1" ?"checked":'' ?> value="1" name="is_dones[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$key?>">
                                                        <label for="is_done-<?=$key?>" style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                        <input type="hidden" name="is_done[]" value="<?= $checkList['is_done'] == 1 ?1:0 ?>" data-id="<?=$key?>"  id="is_done_<?=$key?>">
                                                    </div>  
                                                </div>
                                            </div> 
                                        </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </h4> 
                        </div> 

                        <div id="demo-acc-panel-<?=$key;?>" class="panel-collapse collapse" aria-expanded="true" style="">
                            <div class="panel-body panel-bordered panel-mint">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Note</label> 
                                        <textarea name="description[]" rows="6" class="form-control" data-id="<?=$key?>"><?= $checkList['description'];?></textarea>
                                        <input name="sop_step_list[]" type="hidden" data-id="<?=$key?>" value="<?=$value['id']?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <?php
                    }
                ?>
            </div>
        </div> 

        <!-- start other old sop step -->
        <div class="col-md-12">  
            <div class="text-info text-bold bord-btm">S.O.P Step History</div>
            <br>
            <div id="demo-accordion-old" class="panel-group accordion">
                <?php
                    $sop_step_list_old = Yii::$app->db->createCommand('
                    SELECT
                        standard_operation.`name` as sop_name,
                        standard_operation_step.`name` as sop_step_name,
                        standard_operation_step_list.`name` as sop_step_list_name,
                        standard_operation_step_list.is_track as is_track,
                        standard_operation_check_list.*
                    FROM standard_operation_check_list 
                        LEFT JOIN standard_operation on standard_operation.id = standard_operation_check_list.id_standard_operation
                        LEFT JOIN standard_operation_step on standard_operation_step.id = standard_operation_check_list.id_standard_operation_step
                        LEFT JOIN standard_operation_step_list on standard_operation_step_list.id = standard_operation_check_list.id_standard_operation_step_list
                    WHERE standard_operation_check_list.id_standard_operation = "'.$model->id.'"
                    AND standard_operation_check_list.id_standard_operation_step != "'.$model->kpi_status.'"
                    ')->queryAll();
                    foreach($sop_step_list_old as $keyOld => $valueOld){ 

                        // $checkList = StandardOperationCheckList::find()->where(['id_standard_operation_step_list' => $valueOld['id'],'id_standard_operation_step'=>$model->kpi_status,'id_standard_operation'=>$model->id])->one();
                ?> 
                    <div class="panel"> 
                        <div class="panel-heading panel-bordered panel-info"> 

                            <h4 class="panel-title">
                                <div class="row">
                                    <div class="col-md-8 col-xs-8">
                                    <a data-parent="#demo-accordion-old" data-toggle="collapse" href="#demo-acc-panel-old-<?=$keyOld;?>" aria-expanded="true" class=""><b><?=$valueOld['sop_step_name']."</b> > ".$valueOld['sop_step_list_name'];?></a>
                                    </div>
                                    <div class="col-md-4 col-xs-4">
                                        <?php
                                        if($valueOld['is_track'] == 1){
                                        ?>  

                                        <div class="pull-right" style="margin-right: 10px;">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="text" id="done_date_<?=$keyOld?>" class="form-control" name="done_date[]" placeholder="Done Date" value="<?= $valueOld['done_date'] == "" ?"": $valueOld['done_date'] ?>" data-id="<?=$keyOld?>" readonly="" style="margin-top: 4px;background: #fff !important;">
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group standardoperationstep-is_done" style="margin-bottom: auto;">
                                                        <input disabled id="is_done_old-<?=$keyOld?>" <?= $valueOld['is_done'] == "1" ?"checked":'' ?> value="1" name="is_done_olds[]" class="magic-checkbox checkbox_tracking" type="checkbox" data-id="<?=$keyOld?>">
                                                        <label for="is_done_old-<?=$keyOld?>"  style="display: unset; padding: 0px 0px 0px 25px;">Is Done</label>
                                                        <input disabled type="hidden" name="is_done_old[]" value="<?= $valueOld['is_done'] == 1 ?1:0 ?>" data-id="<?=$keyOld?>"  id="is_done_old_<?=$keyOld?>">
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </h4> 
                        </div> 

                        <div id="demo-acc-panel-old-<?=$keyOld;?>" class="panel-collapse collapse" aria-expanded="true" style="">
                            <div class="panel-body panel-bordered panel-info">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Note</label> 
                                        <textarea name="description_old[]" rows="6" class="form-control" data-id="<?=$keyOld?>" readonly style="background-color: #fff;"><?= $valueOld['description'];?></textarea>
                                        <input name="sop_step_list_old[]" type="hidden" data-id="<?=$keyOld?>" value="<?=$valueOld['id']?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <?php
                    }
                ?>
            </div>
        </div> 
        <!-- end other old sop step -->
    </div> 
</div><!-- end col-md-8 -->