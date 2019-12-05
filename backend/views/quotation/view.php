<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use backend\models\CompanyProfile;
 $model_company = CompanyProfile::findOne(['id'=>1]);
$class_id = Yii::$app->controller->action->id;
$base_url = Yii::getAlias('@web');
/* @var $this yii\web\View */
/* @var $model backend\models\quotation */

$this->title = "Quotation";
$this->params['breadcrumbs'][] = ['label' => 'Quotation', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<style type="text/css">
button#modalButtonUpdate {
    padding: 8px;
    margin-right: 10px;
}

img {
    object-fit: cover;
}

.project-overview .panel-heading .panel-title {
    text-transform: uppercase;
}

.project-overview .col-md-6 {
    padding: 0px !important;
}

.project-overview .progress {
    margin-left: 7% !important;
    margin-right: 7% !important;
}

.project-overview .panel {
    border-radius: 0px;
    border-right: 1px solid gainsboro;
    border-bottom: 1px solid gainsboro;
}

.panel-title-inline {
    font-size: 16px;
}

#print-content a[href]:after {
    display: none;
}
</style>
<div class="quotation-view">

    <div class="employee-profile-profile">
        <ul class="nav nav-tabs fa_style no-print" style="border-bottom: none;">
            <li><?= Html::a('Quotation Overview', ['quotation/overview','id' => $model->id], ['class' => 'overview']) ?>
            </li>
            <!-- <li><?= Html::a('Note', ['quotation/note','id_quotation' => $model->id], ['class' => 'note']) ?></li> -->
            <li><?= Html::a('View PDF', ['quotation/pdf','id' => $model->id], ['class' => 'pdf']) ?></li>
        </ul>
        <div class="panel" style="border-top-left-radius: 0px;" id="print-content">
            <div class="panel-body">
                <div class="row project-overview">
                    <div class="col-md-12">
                        <?= (new \common\models\GlobalFunction)->OfficialDocumentHeader()?>
                        <div style="padding-top: 15px;" class="invoice-masthead">
                            <div class="btn-group dropdown pull-right no-print" style="z-index: 100;">
                                <button
                                    class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon"
                                    data-toggle="dropdown" type="button">
                                    <i class="btn-label demo-pli-dot-vertical"></i> Option
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="#" value="<?= Url::to(['quotation/update', 'id' => $model->id]); ?>"
                                            data-title="Update quotation : <?= $model->code ?>"
                                            id='modalButtonUpdate'>Update quotation</a></li>
                                    <li><a href="#"
                                            value="<?= Url::to(['quotation/convert-to-invoice', 'id' => $model->id]); ?>"
                                            data-title="Convert To Invoice : <?= $model->name ?>"
                                            id='modalButton'>Convert to Invoice</a></li>
                                    <li><a href="javascript:window.print()">Print</a></li>
                                    <li><a href="#">View PDF</a></li>
                                    <li><a href="#">Download</a></li>
                                </ul>
                            </div>

                            <h3 class="h1 text-uppercase text-center text-thin mar-no text-primary">quotation</h3>
                        </div>
                        <div class="col-md-6">
                            <strong class="text-main"
                                style="font-size: 16px;"><?= $model_customer->customer_name . ' ('.$model_customer->company_name . ')' ?></strong><br>
                            <address>
                                <?=$model->address; ?>
                            </address>

                        </div>
                        <div class="col-md-6">
                            <table class="invoice-details">
                                <tbody>
                                    <tr>
                                        <td class="text-main text-bold">Quotation #</td>
                                        <td class="text-right text-info text-bold"><?=$model->code;?></td>
                                    </tr>
                                    <tr>
                                        <td class="text-main text-bold">Status</td>
                                        <td class="text-right"><span
                                                class="label label-mint"><?=$model->quotationStatus->name; ?></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-main text-bold">Quotation Date</td>
                                        <td class="text-right"><?= date_format(date_create($model->date),'F d, Y') ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-main text-bold">Open Till</td>
                                        <td class="text-right">
                                            <?= date_format(date_create($model->open_till),'F d, Y') ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- xxxxxxx -->
                <hr class="new-section-sm">
                <div class="col-md-12">
                    <h3>Service Offered</h3>

                    <div class="row">
                        <div class="col-lg-12 table-responsive">
                            <table class="table table-bordered invoice-summary">
                                <thead>
                                    <tr class="bg-trans-dark">
                                        <th class="text-uppercase">Description</th>
                                        <th class="min-col text-center text-uppercase">Qty</th>
                                        <th class="min-col text-center text-uppercase">Discount</th>
                                        <th class="min-col text-right text-uppercase">Rate</th>
                                        <th class="min-col text-right text-uppercase">Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 0;
                                    foreach ($model_item as $key => $value) {
                                        $i++;
                                ?>
                                    <tr>
                                        <td>
                                            <strong><?= $value->item_name; ?></strong>
                                            <small><?= $value->description; ?></small>
                                        </td>
                                        <td class="text-center"><?= $value->qty; ?></td>
                                        <?php
                                        if($value->discount_amount > 0){
                                            if($value->discount_type == 1){
                                                $discount = $value->discount_amount.'%';
                                            }else{
                                                $discount = '$'.$value->discount_amount;
                                            }
                                        }else{
                                            $discount = '--,--';
                                        }
                                    ?>
                                        <td class="text-center"><?= $discount ?></td>
                                        <td class="text-right">$<?= $value->rate; ?></td>
                                        <td class="text-right">$<?= $value->amount; ?></td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clearfix">
                        <!-- <table class="table invoice-total"> -->
                        <table class="invoice-overall invoice-details">
                            <tbody>
                                <tr>
                                    <td><strong class="text-primary">Sub Total :</strong></td>
                                    <td>$<?= $model->sub_total ?></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-primary">Discount :</strong></td>
                                    <td><?= $model->discount_amount>0?'$'.$model->discount_amount : '--,--'; ?></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-primary">TAX :</strong></td>
                                    <td><?= $model->tax_amount>0?'$'.$model->tax_amount : '--,--'; ?></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-primary">TOTAL :</strong></td>
                                    <td class="text-bold h4">$<?= $model->grand_total ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 well well-sm" style="margin-top: 30px;">
                        <h3>Terms & Conditions</h3>

                        <hr />
                        <p><?= $model_company->quotation_term_and_condition; ?></p>
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
</div>
<style media="screen">
a.<?=$class_id;

?> {
    cursor: default;
    background-color: white !important;
    border-bottom: 2px solid white !important;
}

.fa_style li a:hover {
    background-color: white !important;
    border-bottom: 2px solid white !important;
}

.fa_style li a {
    background-color: #dbe3ec;
    transition: background-color, 0.3s;
}
</style>
<script type="text/javascript">
$(document).on("click", "#modalButtonUpdate", function() {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));

});
</script>
<?php
$this->registerJs('

        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
            $(".modal-dialog").removeClass("modal-proposal").addClass("modal-task");
        });
        $(document).on("click","#modalButtonUpdate",function () {

          $("#modal").modal("show")
              .find("#modalContent")
              .load($(this).attr("value"));
          var title = $(this).data("title");
          $("#modal").find(".modal-title").html(title);
        });

    ');
?>