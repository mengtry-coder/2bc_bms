<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use backend\models\Quotation;
use backend\models\QuotationTemplateDetail;
use backend\models\QuotationTemplatePlan;
use backend\models\UploadedFile;

$base_url = Yii::getAlias('@web');

if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->main_logo;
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

}
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);


$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Quotation Templates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

$model_quotation = Quotation::findOne(5);
$model_plan = QuotationTemplatePlan::find()->where(['id_quotation_template'=> $model->id])->all();
?>
<style type="text/css">
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
        }
        html, body {
            width: 210mm;
            /* height: 297mm; */
            height: 282mm;
            font-size: 11px;
            background: #FFF;
            overflow:visible;
        }
        #content-container {
            padding-top: 0px;
        }
    }
</style>  
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
                eOcambo Technology To <span class="client_company"><?= $model_quotation->customer->company_name ?></span>
            </h3>
            <h5 class="pull-right">No: <?= $model_quotation->code ?></h5>
            <div class="clearfix"></div>
            <div class="pad-all"></div>
            <h5 class="text-center text-thin">eOcambo Technology is pleased to offer the following QUOTATION</h5>
            <h5 class="text-center text-thin">Valid From 26 August, 2019 to 02 September, 2019</h5>

            <h4 class="pad-sm-all bg-info text-center">SOLUTIONS RATES</h4>

            <table class="table table-bordered invoice-summary">
                <tbody>
                    <tr>
                        <!-- <td rowspan="3" class="text-center">
                            <img id="feature_images" src="<?= $img_url;?>" class="img-md" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';">
                        </td> -->
                        <td rowspan="3" class="text-center h3 text-eo"><?= $model->name ?></td>
                        <td colspan="2" class="h5 text-center bg-eo">RATES</td>
                    </tr>
                    <tr>
                        <?php 
                            foreach ($model_plan as $key => $value) {
                                echo "<td class='text-center'> $value->plan_title </td>";
                            }
                        ?>
                    </tr>
                    <tr>
                        <?php 
                            foreach ($model_plan as $key => $value) {
                                echo "<td class='text-center'>USD$ $value->plan_fee /month </td>";
                            }
                        ?>
                    </tr>
                    <?= $model->plan_detail ?></td>

                </tbody>
                
            </table>
        </div>
    </div>
