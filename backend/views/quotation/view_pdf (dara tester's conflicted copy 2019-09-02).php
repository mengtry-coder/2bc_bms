<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use backend\models\Quotation;
use backend\models\Item;
use backend\models\UploadedFile;

$class_id = Yii::$app->controller->action->id;
$base_url = Yii::getAlias('@web');

$this->title = $model->name .' | PDF Preview';
$this->params['breadcrumbs'][] = ['label' => 'Quotation', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

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
        padding: 5px;
    }
    .bg-eo {
        background: #ff6d00;
        color: #fff;
    }
    .text-eo {
        color: #ff6d00;
    }
    @media print 
    {
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
            -webkit-print-color-adjust: exact !important;
        }
        #content-container {
            padding-top: 0px;
        }
    }
</style>  

    <ul class="nav nav-tabs fa_style no-print" style="border-bottom: none;">
        <li><?= Html::a('Quotation Overview', ['quotation/overview','id' => $model->id], ['class' => 'overview']) ?></li>
        <li><?= Html::a('View PDF', ['quotation/pdf','id' => $model->id], ['class' => 'pdf']) ?></li>
    </ul>

    <?php 
        foreach ($model_item as $key => $value) {
    ?>

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
                        <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">QUOTATION</h3>
                    </div>
                </div>
                <h3 class="h3 text-uppercase text-center text-thin mar-no text-primary">
                    eOcambo Technology To <span class="client_company"><?= $model->customer->company_name ?></span>
                </h3>
                <h5 class="pull-right">No: <?= $model->code ?></h5>
                <div class="clearfix"></div>
                <div class="pad-all"></div>
                <h5 class="text-center text-thin">eOcambo Technology is pleased to offer the following QUOTATION</h5>
                <h5 class="text-center text-thin">Valid From <?= date_format(date_create($model->date),'F d, Y') ?> to <?= date_format(date_create($model->open_till),'F d, Y') ?></h5>

                <h4 class="pad-sm-all bg-info text-center">SOLUTIONS RATES</h4>

                <table class="table table-bordered invoice-summary">
                    <tbody>
                        <tr>
                            <td rowspan="3" class="text-center">
                                <?php 
                                    $img_url = "";
                                
                                    $img_id = $value->item->itemGroup->main_logo;
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

                                    $img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);

                                    $total_plan = \backend\models\Item::find()->where(['id_group'=> $value->item->itemGroup->id])->all();
                                ?>
                                <img id="feature_images" src="<?= $img_url; ?>" class="img-md" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';">
                            </td>
                            <td rowspan="3" class="text-center h3 text-eo"><?= $value->item->itemGroup->name ?></td>
                            <td colspan="<?= count($total_plan) ?>" class="h5 text-center bg-eo">RATES</td>
                        </tr>
                        <tr>
                            <?php 
                                foreach ($total_plan as $key => $v) {
                                    echo "<td class='text-center'> $v->description </td>";
                                }
                            ?>
                        </tr>
                        <tr>
                            <?php 
                                foreach ($total_plan as $key => $v) {
                                    echo "<td class='text-center'>USD$ $v->rate /month </td>";
                                }
                            ?>
                        </tr>
                        <!-- Feature Plan -->
                        <?php 
                            foreach ($item_type as $key => $v) {
                        ?>
                            <tr>
                                <td colspan="<?= 2 + count($total_plan) ?>" class="h5 pad-sm-all bg-info"><?= $v->name ?></td>
                            </tr>
                            
                            <?php 
                                $id_type = $v->id;
                                $feature_title = Yii::$app->db->createCommand("
                                    SELECT b.title, a.id, GROUP_CONCAT(a.description) as description
                                    FROM item_data as a
                                    INNER JOIN item_group_data as b on a.id_data = b.id
                                    WHERE a.`status` = 1
                                    AND b.id_type = :id_type
                                    GROUP BY a.id_data
                                ")
                                ->bindParam(':id_type', $id_type)
                                ->queryAll();
                                foreach ($feature_title as $feature) {
                            ?>
                            <tr>
                                <td colspan="2"><?= $feature['title']; ?></td>
                                <?php 
                                    $data = explode(',', $feature['description']);
                                    foreach ($data as $d) {
                                ?>
                                <td class="text-center">
                                    <?php 
                                        if($d == 'YES'){
                                            echo "<i class='fa fa fa-check text-info'></i>";
                                        } else if($d == 'NO'){
                                            echo "<i class='fa fa-times text-danger'></i>";
                                        }else {
                                            echo $d;
                                        }
                                    ?>
                                </td>
                                <?php
                                    }
                                ?>
                            </tr>
                            <?php
                                }
                            ?>
                        <?php
                            }
                        ?>
                        <!-- End Feature Plan -->
                        <tr>
                            <td colspan="<?= 2 + count($total_plan) ?>">
                                <?= $value->item->itemGroup->description ?>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Inclusive Beneift -->
                    <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm">
                        <span class="pad-rgt">I.</span> EOCAMBO TECHNOLOGY INCLUSIVE BENEFITS
                    </h4>
                    <?= $value->item->itemGroup->inclusive_benefit ?>
                    <div class="pad-all"></div>
                <!-- End Inclusive Beneift -->
                
                <!-- FEATURES DETAILS -->
                    <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm">
                        <span class="pad-rgt">II.</span> FEATURES DETAILS
                    </h4>
                    <table class="table table-bordered">
                        <tbody>
                            <?php 
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
                                    <td colspan="2" class="bg-info"><?= $value['title'] ?></td>
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
                            ?>
                            
                        </tbody>
                    </table>

                <!-- END FEATURES DETAILS -->

                <!-- Contact Our Team -->
                    <div class="pad-all"></div>            
                    <h4 class="h4 text-uppercase text-thin mar-no text-primary pad-btm">
                        <span class="pad-rgt">III.</span> Contact Our Team
                    </h4>

                    <?php 
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
                                            echo "<td class='text-center' style='border: 1px solid #FE6D00 !important; font-size: 16px; color: #fff; background-color: #FE6D00;'>" . $value['name'] . "</td>";
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
                                    <td class="text-center" style="border: 1px solid #FE6D00 !important;">
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
                <!-- End Contact Our Team -->

                <!-- Hot Line -->
                <table class="table table-bordered-no">
                    <tbody>
                        <tr>
                            <td colspan="2" class="text-uppercase text-center">Hot line</td>
                        </tr>
                        <tr>
                            <td>
                                <p class="text-semibold text-right">Email:</p>
                                <p class="text-semibold text-right">Phone:</p>
                            </td>
                            <td>
                                <p>
                                    <a class="text-info" href="mailto:<?= !empty($model->employee->email) ? $model->employee->email : '--,--' ?>">
                                    <?= !empty($model->employee->email) ? $model->employee->email : '--,--' ?></a>
                                </p>
                                <p><?= !empty($model->employee->phone_number) ? $model->employee->phone_number : '--,--' ?></p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- End Hot Line -->
            </div>
        </div>

    <?php
        }
    ?>
