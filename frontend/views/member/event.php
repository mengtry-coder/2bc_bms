<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use backend\models\MembershipProfile;
use yii\widgets\ActiveForm; 
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;  

$membership_url = Url::toRoute(['membership-profile/index']);
$membership_name = ArrayHelper::map(\backend\models\MembershipProfile::find()
->where(['status' => 1])
->all(), 'id', 'company_name');
$this->registerJsFile(
    '@web/js/bootstrap.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->title = 'Payment'; 
$this->params['breadcrumbs'][] = 'Payment'; 

?>
<style>
    .modal-lg{
        width: 90%;
    }
    #overlay {
    position: fixed;
    display: none;
    width: auto;
    height: auto;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #00000050;
    z-index: 999999 !important;
    cursor: progress;
    }
    #text{
        position: absolute;
        top: 50%;
        left: 50%;
        font-size: 50px;
        color: white;
        transform: translate(-50%,-50%);
        -ms-transform: translate(-50%,-50%);
    }
</style>
<div class="member-payment"> 
    <div id="overlay">
        <div id="text">Processing <span class="fa fa-user fa-pulse"></span></div>
    </div>
    <div class="panel"> 
        <div class="panel-body">  
            <?php $form = ActiveForm::begin([
                // 'action' => ['payment'],
                // 'method' => 'post',
                // 'id' => 'date_report',
            ]); ?>
            <div class="row">
                <div class="col-md-10"> 
                    <div class="row">    
                        <div class="col-md-4 col-xs-6"> 
                            <?php $search_by = [1 => "Upcoming", 2 => "Expired"]; ?>
                            <?= $form->field($model, 'status')->widget(Select2::classname(), [
                                'data' => $search_by,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => [
                                    'placeholder'=>'All'
                                ], 
                                'pluginOptions' => [
                                    'allowClear' => true 
                                ]]);
                            ?>  
                        </div> 
                        <div class="col-md-4 col-xs-6">
                            <?php $payment_for = ['1' => 'Membership', '2' => 'Event'] ?>
                            <?php $form->field($model, 'id_event_list')->widget(Select2::classname(), [
                                'data' => $payment_for,
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                'options' => [
                                    'placeholder'=>'All'
                                ],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ]]);
                            ?> 
                        </div>   
                        
                    </div>
                </div>

                <div class="col-md-2 col-sm-12 col-xs-12">
                    <div class="btn-action pull-right">
                        <div class="row"> 
                            <div class="col-md-12 col-xs-12"> 
                                <button type="submit" class="btn btn-success btn-rounded" style="margin-right: 0px;">
                                    Search <i class="fa fa-search go-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            <br/>
            <?php ActiveForm::end();?> 

            <div class="table-responsive"> 
                
                <div id="w1" class="grid-view">
                    <table  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <?php
                    // print_r($data_member_event);
                        if(count($data_member_event) > 0){
                    ?>     
                    <thead>
                            <tr>
                                <th>#</th>
                                <th class="text-center">Valid Date</th> 
                                <th class="min-tablet">Event Name</th>
                                <th class="min-tablet">Address</th>
                                <th class="min-desktop">Email</th>
                                <th class="min-desktop">No.Audient</th>
                                <th class="text-center">Status</th> 
                                <th class="text-center">Action</th> 
                            </tr>
                        </thead>
                        <?php 
                        } 
                        ?>
                        <tbody> 
                            <?php
                            $paymentRange = 1;
                            foreach($data_member_event as $key => $value)
                            {
                                echo "
                                <tr>
                                    <td>".$paymentRange++."</td>
                                    <td style='text-align: center;'>".$value["from_date"]." To ".$value["to_date"]."</td>
                                    <td>".$value["event_name"]."</td>
                                    <td>".$value["address"]."</td>
                                    <td>".$value["email"]."</td>
                                    <td><center>".$value["number_of_audient"]."</center></td>
                                    <td style='text-align:center;'>
                                ";
                                    if ($value["status"] == 1) {
                                        $status = '<div class="text-center"><span class="label label-info">Upcoming</span></div>';
                                    } else{
                                        $status = '<div class="text-center"><span class="label label-warning">Expired</span></div>';
                                    } 
                                    echo $status;
                                echo "</td>
                                    <td style='text-align: right;'><center><a class='btn btn-xs btn-default' href='#' title='Detail'><span class='fa fa-search'></span></a></center></td> 
                                </tr>
                                ";
                            }
                            ?> 
                        </tbody>
                    </table> 
                </div>   
            </div>
        </div>
    </div>
</div> 
