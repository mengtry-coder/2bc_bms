<?php

use yii\helpers\Html; 
use yii\helpers\Url;
use backend\models\Item;
use backend\models\UploadedFile;

$class_id = Yii::$app->controller->action->id; 
// echo $class_id;
@$id_contract = $_GET['id'];
$base_url = Yii::getAlias('@web');

$signature_url = "";

$model_employee = \backend\models\EmployeeProfile::findOne([$model->createdBy->id_employee]);

if(!empty($model_employee)){
    $img_id = $model_employee->signature_url;
}else{
    $img_id = 1;
}

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
$signature_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;

$signature_url = $base_url."/".$signature_url;

$id_contract = $model->id;

$is_sigle_product = count($model_item) > 1 ? '' : 'hide';

$this->title = 'Overview';
$this->params['breadcrumbs'][] = ['label' => 'Contract', 'url' => ['index']]; 
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    a.<?=$class_id;?>{
        cursor: default; background-color: white !important; border-bottom: 2px solid white !important;
    }
    .fa_style li a:hover{
        background-color: white !important; border-bottom: 2px solid white !important;
    }
    .fa_style li a{
        background-color: #dbe3ec;transition: background-color,0.3s;
    }
    
    .table-bordered-no {
        border: none !important;
        border-collapse: collapse !important;
    }
    .table-bordered-no td{
        border: none !important;
    }

    .readMoneytoLetter {
        font-style: italic;
    }
    #container .invoice-masthead {
        margin-bottom: 10px;
    }
    .new-section-sm {
        margin: 5px 0px;
    }
    #container .invoice-summary thead>tr>th {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    #print-content a[href]:after { display:none; } 

    .client_company {
        border-bottom: 1px dotted #000;
        text-decoration: none;
    }
    .pad-sm-all {
        padding: 10px;
    }
    .bg-eo {
        background: #ff6d00;
        color: #fff;
    }
    .text-eo {
        color: #ff6d00;
    }
    .color-red td {
        color: #FE6D00;
        font-weight: 600;
    }
    .pad-50 {
        padding-left: 50px;
    }
    .img-xl {
        width: 175px;
        height: 175px;
    }
    @media print 
    {
        
        table { page-break-inside:auto }
        tr    { page-break-inside:avoid; page-break-after:auto }        
        thead { display:table-header-group }
        tfoot { display:table-footer-group }

        tr#body_break{page-break-inside:auto;}        

        @page { 
            width: 210mm;
            height: 296mm;            
            min-height: initial;
            margin: 20mm 0mm 20mm 0mm;
            border: initial;
            border-radius: initial;           
            box-shadow: initial;
            background: initial;
           /* page-break-after: always;  */          
        }       

        body {
            margin: 0;
            padding: 0;
        }       
        #content-container {
            padding-top: 0px;
        }
    }
</style> 
<!-- 
@page {
            size: A4; /* DIN A4 standard, Europe */
            margin:0;
            -webkit-print-color-adjust: exact; 
        }
        html, body {
            width: 210mm;
            /* height: 297mm; */
            height: 282mm;
            font-size: 11px;
            background: #FFF;
            overflow:visible;
        } -->

    <div class="panel" id="print-content">
        <div class="panel-body">
            <div class="invoice-masthead">
                <div style="white-space:nowrap">
                    <?= (new \common\models\GlobalFunction)->OfficialDocumentHeader()?>
                </div>
                <div style="padding-top: 15px;">
                    <div class="btn-group dropdown pull-right no-print" style="z-index: 100;">
                        <button class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                            <i class="btn-label demo-pli-dot-vertical"></i> Option
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="javascript:window.print()">Print</a></li>
                        </ul>
                    </div>
                    <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary" style="color: #02A9F4 !important;">contract</h3>
                </div>
            </div>
            <h3 class="h3 text-uppercase text-center text-thin mar-no text-primary">
                eOcambo Technology AND <span class="client_company"><?= $model->customer->company_name ?></span>
            </h3>
            <h5 class="pull-right">No: <?= $model->doc_id ?></h5>
            <div class="clearfix"></div>
            <div class="pad-all"></div>
            <h5 class="h4 text-center text-thin">eOcambo Technology is pleased to offer the following contract agreement</h5>
            <!-- <h5 class="text-center text-thin">Valid From <?= date_format(date_create($model->start_date),'F d, Y') ?> to <?= date_format(date_create($model->end_date),'F d, Y') ?></h5> -->

            <h4 class="pad-sm-all bg-info text-center text-uppercase" style="background: #02A9F4 !important; color: #fff !important;">contract rates</h4>

            <table class="table table-bordered invoice-summary">
                <tbody>
                    <tr>
                        <td class="h5 text-center bg-eo" style="background: #FE6D00 !important; color: #fff !important;">SOLUTIONS</td>
                        <td class="h5 text-center bg-eo" style="background: #FE6D00 !important; color: #fff !important;">RATES</td>
                    </tr>
                    <?php 
                        $grand_total = 0;
                        foreach ($model_item as $key => $value) {
                            $total_each_row = $value->other_charge + $value->rate;
                            $discount_each_row = 0;
                            if($value->discount_amount > 0){
                                if($value->discount_type == 1){
                                    $discount_each_row = $total_each_row * ($value->discount_amount / 100);
                                } else{
                                    $discount_each_row = $value->discount_amount;
                                }    
                            }
                    ?>
                    <tr>
                        <td class="text-right">
                            <?php 
                                $base_url = Yii::getAlias('@web');
                                $img_url = "";
                            
                                if(empty($value->item->itemGroup)){
                                    $img_id = 1;
                                }else{
                                    $img_id = $value->item->itemGroup->main_logo;
                                }
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
                                $img_url = $base_url."/".$img_url;
                                // $img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);

                            ?>
                            <img id="feature_images" src="<?= $img_url; ?>" class="img-md" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/bms_logo.png' ?>';">
                            <span class="pad-lft h5"><?= $value->item->itemGroup->full_name .' - '. $value->item->description ?></span>
                        </td>
                        <td class="h5 text-center">USD$ <?= number_format($value->rate, 2) ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right">Discount</td>
                        <?php 
                            if($value->discount_amount == 0){
                                $discount_amount = '--,--';
                            }else{
                                if($value->discount_type == 1){
                                    $discount_amount = $value->discount_amount ."%";
                                }else {
                                    $discount_amount = "USD$ ".$value->discount_amount;
                                }
                            }                            
                        ?>
                        <td class="h5 text-center"><?= $discount_amount ?></td>
                    </tr>
                    <?php if(!empty($value->other_charge) && $value->other_charge > 0){ ?>
                    <tr>
                        <td class="h5 text-right">First Setup Fee</td>
                        <td class="h5 text-center">USD$ <?= number_format($value->other_charge,2) ?></td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td class="h5 text-right">Payment</td>
                        <?php $total = $value->other_charge + $value->rate - $discount_each_row; $grand_total = $grand_total + $total;?>

                        <td class="h5 text-center">USD$ <?= number_format($total, 2); ?></td>
                    </tr>

                    <?php } ?>
                    <tr>
                        <td class="h5 text-right" style="background: #fe6d0066 !important; color: #000 !important;">Sub Total</td>
                        <td class="h5 text-center" style="background: #fe6d0066 !important; color: #000 !important;">USD$ <?= number_format($model->sub_total, 2); ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="background: #fe6d0066 !important; color: #000 !important;">Discount</td>
                        <td class="h5 text-center" style="background: #fe6d0066 !important; color: #000 !important;">USD$ <?= number_format($model->discount_amount, 2); ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="background: #FE6D00 !important; color: #fff !important;">Grand Total</td>
                        <td class="h5 text-center" style="background: #FE6D00 !important; color: #fff !important;">USD$ <?= number_format($model->total_amount, 2); ?></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <?php 
                                foreach ($model_item as $key => $value) {
                                    // echo "<p class='pad-all ".$is_sigle_product."' style='font-weight: 500 !important; color: #02A9F4 !important;'>". $value->item->description."</p>";
                                    // echo "<p class='text-main'>".$value->description."</p>";
                                    echo $value->item->itemGroup->description;
                                    break;
                                }
                            ?>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Inclusive Beneift -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">I.</span> EOCAMBO TECHNOLOGY INCLUSIVE BENEFITS
                </h4>
                <?php 
                    foreach ($model_item as $key => $value) {
                        // echo "<p class='pad-all ".$is_sigle_product."' style='font-weight: 500 !important; color: #02A9F4 !important;'>". $value->item->description."</p>";
                        echo $value->item->itemGroup->inclusive_benefit;
                        break;
                    }
                ?>
                <?php // $model->inclusive_benefit ?>
                <div class="pad-all"></div>
            <!-- End Inclusive Beneift -->

            <!-- FEATURES DETAILS -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">II.</span> FEATURES DETAILS
                </h4>
                <table class="table table-bordered">
                    <tbody>
                        <?php 
                            foreach ($model_item as $key => $value) {

                                // echo "<tr><td colspan=2 class='pad-all ".$is_sigle_product."' style='font-weight: 500 !important; color: #02A9F4 !important;'>". $value->item->description."</td></tr>";

                                $id_item_group = $value->item->itemGroup->id;
                                $item_group_data = Yii::$app->db->createCommand("
                                    SELECT b.title, b.id
                                    from item_group_template_detail as a
                                    inner join item_group_data as b on a.id_item_group_type = b.id
                                    where a.id_item_group = :id_item_group
                                    group by b.id
                                ")
                                ->bindParam(':id_item_group', $id_item_group)
                                ->queryAll();
                                foreach ($item_group_data as $key => $value) {
                        ?>
                                <tr>
                                    <td colspan="2" class="bg-info" style="background: #02A9F4 !important; color: #fff !important;"><?= $value['title'] ?></td>
                                </tr>
                                <?php 
                                    $feature_detail = \backend\models\ItemGroupTemplateDetail::findAll(['id_item_group' => $id_item_group, 'id_item_group_type'=>$value['id']]);
                                    foreach ($feature_detail as $key => $value) {
                                ?>
                                    <tr>
                                        <td style="min-width: 150px;"><?= $value->title ?></td>
                                        <td><?= nl2br($value->description) ?></td>
                                    </tr>
                                <?php
                                    }
                                ?>
                        <?php
                                }
                                break;
                            }
                        ?>
                        
                    </tbody>
                </table>

            <!-- END FEATURES DETAILS -->

            <!-- Contact Our Team -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">III.</span> Contact Our Team
                </h4>
                <?php 
                    foreach ($model_item as $key => $value) {
                        // echo "<p class='pad-all text-center ".$is_sigle_product."' style='font-weight: 500 !important; color: #02A9F4 !important;'>". $value->item->description."</p>";
                ?>
                    <?php 
                        $id_item_group = $value->item->itemGroup->id;
                        $data = Yii::$app->db->createCommand("
                            SELECT a.*
                            FROM department as a
                            INNER JOIN item_group_department as b on a.id = b.id_department
                            WHERE b.id_item_group = :id_item_group
                            LIMIT 3
                        ")->bindParam(':id_item_group', $id_item_group)->queryAll();
                    ?>

                    <table class="table table-bordered-no">
                        <tbody>
                            <tr>
                                <?php 
                                    if(!empty($data)){
                                        foreach ($data as $key => $value) {
                                            echo "<td></td>";
                                            echo "<td class='text-center' style='border: 1px solid #FE6D00 !important; font-size: 16px; color: #fff !important; background-color: #FE6D00 !important;'>" . $value['name'] . "</td>";
                                            echo "<td></td>";
                                        }
                                    }
                                ?>
                            </tr>
                            <tr>
                                <?php 
                                    if(!empty($data)){
                                        foreach ($data as $key => $value) {
                                ?>
                                    <td></td>
                                    <td class="text-center" style="width: 30% !important; border: 1px solid #FE6D00 !important;">
                                        <p class="text-bold">Contact Detail</p>
                                        <p class="text-semibold">Phone Number:</p>
                                        <p><?= $value['phone_number'] ?></p>
                                        <p class="text-semibold">Email:</p>
                                        <a class="text-info" href="mailto:<?= $value['email'] ?>"><?= $value['email'] ?></a>
                                    </td>
                                    <td></td>
                                <?php
                                        }
                                    }
                                ?>
                            </tr>
                        </tbody>
                    </table>
                <?php
                        break;
                    }
                ?>

                <table class="table table-bordered-no">
                    <tbody>
                        <?php 
                            $customer_contact = Yii::$app->db->createCommand("
                                SELECT b.*
                                FROM contract_customer_contact as a 
                                INNER JOIN customer_profile_contact as b on a.id_customer_contact = b.id
                                WHERE a.id_contract = :id_contract
                            ")->bindParam(':id_contract', $id_contract)->queryAll();

                            if(!empty($customer_contact)){
                        ?>
                        <tr>
                            <td colspan="4" class="h5 text-uppercase bg-info" style="background: #02A9F4 !important; color: #fff !important;">client details</td>
                        </tr>
                        <?php 
                            foreach ($customer_contact as $key => $value) {
                        ?>
                        <tr>
                            <td colspan="4" class="h5 text-uppercase"><?= $value['department'] ?></td>
                        </tr>
                        <tr>
                            <td class="h5 text-right" style="width: 25% !important;">Contact Person: </td>
                            <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $value['contact_name'] ?></td>
                            <td class="h5 text-right" style="width: 25% !important;">Email: </td>
                            <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $value['email_address'] ?></td>
                        </tr>
                        <tr>
                            <td class="h5 text-right" style="width: 25% !important;">Tel: </td>
                            <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $value['tel'] ?></td>
                            <td class="h5 text-right" style="width: 25% !important;">Mobile: </td>
                            <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $value['phone'] ?></td>
                        </tr>
                        <?php
                                }
                            }
                        ?>

                        
                    </tbody>
                </table>
            <!-- End Contact Our Team -->

            <!-- CREDIT ARRANGEMENTS and PAYMENT -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">IV.</span> CREDIT ARRANGEMENTS and PAYMENT
                </h4>
                <?= $model->credit_arrangment ?>
                <p class="h5 text-semibold" style="text-decoration: underline; font-style: italic;">Electronic Funds Transfer:</p>
                <p>Payment can be made direct into the following account:</p>
                <table class="table table-bordered-no color-red" width="50%">
                    <tbody>
                        <tr>
                            <td class="text-right" style="font-weight: 600 !important; color: #FE6D00 !important;">Account Name:</td>
                            <td style="font-weight: 600 !important; color: #FE6D00 !important;"><span class="pad-50"></span><?= $model->bank->account_name ?></td>
                        </tr>
                        <tr>
                            <td class="text-right" style="font-weight: 600 !important; color: #FE6D00 !important;">Account Number:</td>
                            <td style="font-weight: 600 !important; color: #FE6D00 !important;"><span class="pad-50"></span><?= $model->bank->account_number ?></td>
                        </tr>
                        <tr>
                            <td class="text-right" style="font-weight: 600 !important; color: #FE6D00 !important;">Bank Name:</td>
                            <td style="font-weight: 600 !important; color: #FE6D00 !important;"><span class="pad-50"></span><?= $model->bank->bank_name ?></td>
                        </tr>
                        <tr>
                            <td class="text-right" style="font-weight: 600 !important; color: #FE6D00 !important;">Bank Address:</td>
                            <td style="font-weight: 600 !important; color: #FE6D00 !important;"><span class="pad-50"></span><?= $model->bank->bank_address ?></td>
                        </tr>
                        <tr>
                            <td class="text-right" style="font-weight: 600 !important; color: #FE6D00 !important;">SWIFT/Bic:</td>
                            <td style="font-weight: 600 !important; color: #FE6D00 !important;"><span class="pad-50"></span><?= $model->bank->swift_code ?></td>
                        </tr>
                    </tbody>
                </table>

                <p class="h5 text-semibold" style="text-decoration: underline; font-style: italic;">Cash Payment:</p>
                <p>Cash settlement must be paid at eOcambo Technology upon the agreement.</p>
                <div class="pad-all"></div>
            <!-- End CREDIT ARRANGEMENTS and PAYMENT -->

            <!-- CANCELLATION / TERMINATION CONTRACT AGREEMENT -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">V.</span> CANCELLATION / TERMINATION CONTRACT AGREEMENT
                </h4>
                <?= $model->cancellation_agreement ?>
                <div class="pad-all"></div>
            <!-- END CANCELLATION / TERMINATION CONTRACT AGREEMENT -->

            <!-- CONFIDENTIALITY -->
                <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm" style="font-weight: 500 !important; color: #02A9F4 !important;">
                    <span class="pad-rgt">VI.</span> CONFIDENTIALITY
                </h4>
                <?= $model->confidentiality ?>
                <div class="pad-all"></div>
            <!-- END CONFIDENTIALITY -->

            <img id="feature_images_signature_url" src="<?= $signature_url;?>" width="175" onError="this.onerror=null;this.src='<?= $base_url.'/img/upload_holder.png' ?>';">

            <table class="table table-bordered-no">
                <?php 
                    $company_profile = \backend\models\CompanyProfile::findOne(['id'=>1]);
                    $position = \backend\models\EmployeePosition::findOne(['id'=>$model->createdBy->id_position]);
                    $employee_profile = \backend\models\EmployeeProfile::findOne(['id'=>$model->createdBy->id_employee]);
                ?>
                <tbody>
                    <tr>
                        <td colspan="2" class="h4 text-uppercase" style="font-weight: 500 !important; color: #02A9F4 !important;">CONFIRMED BY</td>
                        <td colspan="2" class="h4 text-uppercase" style="font-weight: 500 !important; color: #02A9F4 !important;">ACCEPTED BY</td>
                    </tr>
                    <?php 

                    ?>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Name: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->createdBy->first_name . ' ' . $model->createdBy->last_name ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Name: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->customer->customer_name ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Position: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= !empty($position) ? $position->position_type : '' ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Position: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->customer->position ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Company: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $company_profile->names ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Company: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->customer->company_name ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">E-mail: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= !empty($employee_profile->email) ? $employee_profile->email : $company_profile->email ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">E-mail: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->customer->email_address ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Tel: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= !empty($employee_profile) ? $employee_profile->phone_number : '' ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Tel: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $model->customer->phone_number ?></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Mailing Address: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= $company_profile->mailing_address ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Mailing Address: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"></td>
                    </tr>
                    <tr>
                        <td class="h5 text-right" style="width: 25% !important;">Date: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"><?= date_format(date_create($model->created_date),'F d, Y') ?></td>
                        <td class="h5 text-right" style="width: 25% !important;">Date: </td>
                        <td class="h5" style="width: 25% !important; background: #E9EEEF !important; border-bottom: 1px dotted !important;"></td>
                    </tr>

                </tbody>
            </table>

            

        </div>
    </div>

