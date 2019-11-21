<?php
use yii\helpers\ArrayHelper;
use yii\helpers\Url;  
use yii\helpers\Html;  
$controllerName = Yii::$app->controller->id;
$actionName = Yii::$app->controller->action->id; 
$request = Yii::$app->request;
    $smMenu = 1;
    $id_lead_profiles = $request->get('id',0);
    if($id_lead_profiles !=0){
        $id_lead_profile = $id_lead_profiles;
    }else{
        $id_lead_profile = $request->get('id_lead_profile');
    } 

?>
<div class="panel">
    <div class="panel-heading panel-eo">
        <h3 class="panel-title" style="font-weight: 500;">Sale Report Menu</h3>
    </div>
    <div class="panel-body"> 
        <div class="list-group"> 
            <a class="list-group-item emNavActiveOnAction_invoice" href="<?= Url::toRoute('sale-report/invoice?smMenu='.$smMenu) ?>">Invoices</a>
            <!-- <a class="list-group-item emNavActiveOnAction_item" href="<?= Url::toRoute('sale-report/item?smMenu='.$smMenu) ?>">Items</a> -->
            <!-- <a class="list-group-item emNavActiveOnAction_payment-recieve" href="<?= Url::toRoute('sale-report/payment-recieve?smMenu='.$smMenu) ?>">Payments Received</a> -->
            <!-- <a class="list-group-item emNavActiveOnAction_credit-note" href="<?= Url::toRoute('sale-report/credit-note?smMenu='.$smMenu) ?>">Credit Notes</a> -->
            <a class="list-group-item emNavActiveOnAction_proposal" href="<?= Url::toRoute('sale-report/proposal?smMenu='.$smMenu) ?>">Proposals</a>
            <a class="list-group-item emNavActiveOnAction_quotation" href="<?= Url::toRoute('sale-report/quotation?smMenu='.$smMenu) ?>">Quotations</a>
            <!-- <a class="list-group-item emNavActiveOnAction_customer" href="<?= Url::toRoute('sale-report/customer?smMenu='.$smMenu) ?>">Customers</a> -->
        </div> 
    </div>
</div>

<style media="screen">
 .emNavActive_<?=$controllerName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 .emNavActiveOnAction_<?=$actionName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 </style>