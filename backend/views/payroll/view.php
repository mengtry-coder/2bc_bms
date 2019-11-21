<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$this->registerJsFile(
    '@web/js/freeze-table.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Payroll for ' . $model->month->name;
$this->params['breadcrumbs'][] = ['label' => 'Payroll', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<?php
    Modal::begin([
        'header' => ' <h4 class="modal-title">'.'Payrolls'.'</h4>',
        'id' => 'modal',
        'class' => 'modal fade',
        'size' => 'modal-custom-70',
    ]);
    echo "<div id='modalContent'></div>";
    Modal::end();

?>
<style type="text/css">
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
      -webkit-appearance: none; 
      margin: 0; 
    }
    .column_number {
        min-width: 95px;
    }
    .column_date {
        min-width: 95px;
    }
    table tfoot input[type=number]{
        background: transparent !important;
        border: none;
        font-weight: bolder;
        font-size: 16px;
        padding: 0px;
    }
    table tbody input[type=number], table tbody input[type=text], table tbody select{
        background: transparent !important;
        border: none !important;
        font-weight: bolder;
        font-size: 13px;
        padding: 0px;
    }

</style>
<div class="payroll-request-view">
    <div class="panel">
        <div class="panel-heading">
            <div class="pad-top"></div>
            <?php if($model->status !=3){ ?>
            <button class="btn btn-primary btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['payroll/approve', 'id'=>$model->id]) ?>" data-title="Approve Payroll" id='modalButton'>
                <i class="btn-label fa fa-check"></i> Approve
            </button>
            <button class="btn btn-danger btn-labeled pull-right mar-rgt button-reject-payroll" data-value="<?= yii\helpers\Url::to(['payroll/reject', 'id' => $model->id]); ?>" title="Reject Request" data-confirm="Are you sure want to reject this file?" data-method="post"">
                <i class="btn-label fa fa-times"></i> Reject
            </button>
            <?php } ?>
            <div class="panel-title" style="text-transform: uppercase;">
                Monthly Payroll for <?= $model->month->name . ' ' . date('Y'); ?>
                <?= '<span class="label '.$model->payrollStatus->css_class.'">'.$model->payrollStatus->name.'</span>' ?>
            </div>
        </div>
            
        <div class="panel-body">
            <div class="table-responsive view_table_payroll">
                <table class="table table-striped table-bordered table-hover custom_odd_even">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th>Code</th>
                            <th style="min-width: 180px;">Employee Name</th>
                            <th>Department</th>
                            <th class="column_date">Joint Date</th>
                            <th class="text-center">Y</th>
                            <th class="text-center">M</th>
                            <th class="text-center">D</th>
                            <th class="text-center">W.D</th>
                            <th class="column_number">Basic Salary</th>
                            <th class="column_number">3 months Probation Salary</th>
                            <th class="column_number">Probation W.D</th>
                            <th class="column_number">Probation Per Day Salary</th>
                            <th class="column_number">Amount Pass Probation</th>
                            <th class="column_number">Absent</th>
                            <th class="column_number">Deduction</th>
                            <th class="column_number">Cash Advance Deduction</th>
                            <th class="column_number">Increase</th>
                            <th class="column_number">Other</th>
                            <th class="column_number">Balance</th>
                            <th class="column_number">S.C. 5%</th>
                            <th class="column_number">Bonus</th>
                            <th class="column_number">Net Pay</th>
                            <th class="column_number">Method</th>
                            <th class="column_number">Tip</th>
                            <th class="column_number">Total Net Pay</th>
                            <th style="min-width: 200px;">Remark</th>
                        </tr>
                    </thead>
                    <tbody class="calculate_item">

                        <?php 
                            $i=0;
                            foreach ($model_payroll_request_data as $key => $value) {
                                $i++;
                        ?>
                            <tr>
                                <td class="text-center">
                                    <?= $i ?>
                                    <input type="hidden" data-id="<?= $i ?>" name="id_employee[]" id="id_employee_<?= $i ?>" value="<?= $value['id_employee'] ?>">
                                </td>
                                <td><?= $value['code'] ?></td>
                                <td><?= $value['employee_name'] ?></td>
                                <td><?= $value['department'] ?></td>
                                <td><?= date_format(date_create($value['join_date']),'M d, Y') ?></td>
                                <td class="text-center"><?= $value['p_year'] ?></td>
                                <td class="text-center"><?= $value['p_month'] ?></td>
                                <td class="text-center"><?= $value['p_day'] ?></td>
                                <td class="text-center"><?= $value['working_day'] ?></td>
                                <td class="text-center">
                                    <?= number_format($value['current_salary'], 2) ?>
                                    <input type="hidden" data-id="<?= $i ?>" class="basic_salary" name="basic_salary[]" id="basic_salary_<?= $i ?>" value="<?= $value['current_salary'] ?>">
                                </td>
                                <td><input value=<?= number_format($value['probation_pass_amount'],2, '.', '') ?> type="number" name="probation_pass_amount[]" id="probation_pass_amount_<?= $i ?>" class="form-control probation_pass_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['probation_working_day']) ?> type="number" name="probation_working_day[]" id="probation_working_day_<?= $i ?>" class="form-control probation_working_day" data-id="<?= $i ?>"></td>
                                <td><input value=<?= number_format($value['probation_per_day_amount'],2, '.', '') ?> type="number" name="probation_per_day_amount[]" id="probation_per_day_amount_<?= $i ?>" class="form-control probation_per_day_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input value=<?= number_format($value['probation_pass_total_amount'],2, '.', '') ?> type="number" name="probation_pass_total_amount[]" id="probation_pass_total_amount_<?= $i ?>" class="form-control probation_pass_total_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input value=<?= number_format($value['absent']) ?> type="number" name="absent[]" id="absent_<?= $i ?>" class="form-control absent" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['absent_deduct_amount'],2, '.', '') ?> type="number" name="absent_deduct_amount[]" id="absent_deduct_amount_<?= $i ?>" class="form-control absent_deduct_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input value=<?= number_format($value['advance_deduct_amount'],2, '.', '') ?> type="number" name="advance_deduct_amount[]" id="advance_deduct_amount_<?= $i ?>" class="form-control advance_deduct_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input value=<?= number_format($value['increase_amount'],2, '.', '') ?> type="number" name="increase_amount[]" id="increase_amount_<?= $i ?>" class="form-control increase_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['other_amount'],2, '.', '') ?> type="number" name="other_amount[]" id="other_amount_<?= $i ?>" class="form-control other_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['balance_amount'],2) ?> type="number" name="balance_amount[]" id="balance_amount_<?= $i ?>" class="form-control balance_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input value=<?= number_format($value['service_charge_amount'],2, '.', '') ?> type="number" name="service_charge_amount[]" id="service_charge_amount_<?= $i ?>" class="form-control service_charge_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['bonus_amount'],2, '.', '') ?> type="number" name="bonus_amount[]" id="bonus_amount_<?= $i ?>" class="form-control bonus_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['net_pay_amount'],2) ?> type="number" name="net_pay_amount[]" id="net_pay_amount_<?= $i ?>" class="form-control net_pay_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td>
                                    <select class="form-control id_payment_method" id="id_payment_method_<?= $i ?>" data-id="<? $i ?>" name="id_payment_method[]">
                                        <?php 
                                            $selected = $value['id_payment_method'] == 1 ?'selected' : '';
                                            $selected_2 = $value['id_payment_method'] == 2 ?'selected' : '';
                                        ?>
                                        <option value="1" <?= $selected ?> >Bank</option>
                                        <option value="2" <?= $selected_2 ?> >Cash</option>
                                    </select>
                                </td>
                                <td><input value=<?= number_format($value['tip_amount'],2, '.', '') ?> type="number" name="tip_amount[]" id="tip_amount_<?= $i ?>" class="form-control tip_amount" data-id="<?= $i ?>" step="0.01"></td>
                                <td><input value=<?= number_format($value['total_net_pay_amount'],2) ?> type="number" name="total_net_pay_amount[]" id="total_net_pay_amount_<?= $i ?>" class="form-control total_net_pay_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                <td><input type="text" name="remark[]" value="<?= $value['remark'] ?>" id="remark_<?= $i ?>" class="form-control remark" data-id="<?= $i ?>" step="0.01"></td>
                            </tr>
                        <?php
                            }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="9" class="text-center">
                                Grand Total
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'current_salary')), 2, '.', '') ?>" type="number" name="grand_total_basic_salary" id="grand_total_basic_salary" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'probation_pass_amount')), 2, '.', '') ?>" type="number" name="grand_total_probation_pass_amount" id="grand_total_probation_pass_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= array_sum(array_column($model_payroll_request_data, 'probation_working_day'))?>" type="number" name="grand_total_probation_working_day" id="grand_total_probation_working_day" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'probation_per_day_amount')), 2, '.', '') ?>" type="number" name="grand_total_probation_per_day_amount" id="grand_total_probation_per_day_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'probation_pass_total_amount')), 2, '.', '') ?>" type="number" name="grand_total_probation_pass_total_amount" id="grand_total_probation_pass_total_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= array_sum(array_column($model_payroll_request_data, 'absent')) ?>" type="number" name="grand_total_absent" id="grand_total_absent" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'absent_deduct_amount')), 2, '.', '') ?>" type="number" name="grand_total_absent_deduct_amount" id="grand_total_absent_deduct_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'advance_deduct_amount')), 2, '.', '') ?>" type="number" name="grand_total_advance_deduct_amount" id="grand_total_advance_deduct_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'increase_amount')), 2, '.', '') ?>" type="number" name="grand_total_increase_amount" id="grand_total_increase_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'other_amount')), 2, '.', '') ?>" type="number" name="grand_total_other_amount" id="grand_total_other_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'balance_amount')), 2, '.', '') ?>" type="number" name="grand_total_balance_amount" id="grand_total_balance_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'service_charge_amount')), 2, '.', '') ?>" type="number" name="grand_total_service_charge_amount" id="grand_total_service_charge_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'bonus_amount')), 2, '.', '') ?>" type="number" name="grand_total_bonus_amount" id="grand_total_bonus_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'net_pay_amount')), 2, '.', '') ?>" type="number" name="grand_total_net_pay_amount" id="grand_total_net_pay_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td>
                                --,--
                            </td>
                            <td>
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'tip_amount')), 2, '.', '') ?>" type="number" name="grand_total_tip_amount" id="grand_total_tip_amount" class="form-control" step="0.01" readonly>
                            </td>
                            <td colspan="2">
                                <input value="<?= number_format(array_sum(array_column($model_payroll_request_data, 'total_net_pay_amount')), 2, '.', '') ?>" type="number" name="grand_total_total_net_pay_amount" id="grand_total_total_net_pay_amount" class="form-control" step="0.01" readonly>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    
</div>

<?php

$script = <<<JS
$( document ).ready(function() {    
    $(".view_table_payroll").freezeTable({
        'columnNum': 4,
        'columnKeep': true,
        'freezeHead': true,
        scrollBar: true,
        // fastMode: true,
        // scrollable: true
    });

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-reject-payroll')){
            swal({
                text: "Are you sure you want to reject this payroll request?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
    };

});

$(document).on("click","#modalButton",function () {
    $("#modal").modal("show")
        .find("#modalContent")
        .load($(this).attr("value"));
    var title = $(this).data("title");
    $("#modal").find(".modal-title").html(title);
});

JS;
$this->registerJs($script);
?>
