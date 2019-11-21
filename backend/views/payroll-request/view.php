<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

$this->title = 'Payroll Request for ' . $model->month->name;
$this->params['breadcrumbs'][] = ['label' => 'Payroll Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

$this->registerJsFile(
    '@web/js/freeze-table.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

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


</style>
<div class="payroll-request-view">
    <div class="panel">
        <div class="panel-heading">
            <div class="panel-title" style="text-transform: uppercase;">
                Monthly Payroll for <?= $model->month->name . ' ' . date('Y'); ?>
            </div>
        </div>
        <?php 

            $validationUrl = ['payroll-request/validation'];
            if (!$model->isNewRecord){
                $validationUrl['id'] = $model->id;
            }

            $form = ActiveForm::begin(); 
            ?>
            
        <div class="panel-body">
            <div class="table-responsive">
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
                    <?php if(empty($check_data)){ ?>
                        <tbody class="calculate_item">

                            <?php 
                                $i=0;
                                foreach ($model_data as $key => $value) {
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
                                        <?= number_format($value['basic_salary'], 2) ?>
                                        <input type="hidden" data-id="<?= $i ?>" class="basic_salary" name="basic_salary[]" id="basic_salary_<?= $i ?>" value="<?= $value['basic_salary'] ?>">
                                    </td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="probation_pass_amount[]" id="probation_pass_amount_<?= $i ?>" class="form-control probation_pass_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format(0) ?> type="number" name="probation_working_day[]" id="probation_working_day_<?= $i ?>" class="form-control probation_working_day" data-id="<?= $i ?>"></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="probation_per_day_amount[]" id="probation_per_day_amount_<?= $i ?>" class="form-control probation_per_day_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="probation_pass_total_amount[]" id="probation_pass_total_amount_<?= $i ?>" class="form-control probation_pass_total_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input value=<?= number_format(0) ?> type="number" name="absent[]" id="absent_<?= $i ?>" class="form-control absent" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="absent_deduct_amount[]" id="absent_deduct_amount_<?= $i ?>" class="form-control absent_deduct_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input value=<?= number_format($value['current_advance_deduct_amount'],2) ?> type="number" name="advance_deduct_amount[]" id="advance_deduct_amount_<?= $i ?>" class="form-control advance_deduct_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="increase_amount[]" id="increase_amount_<?= $i ?>" class="form-control increase_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="other_amount[]" id="other_amount_<?= $i ?>" class="form-control other_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format($value['basic_salary'],2) ?> type="number" name="balance_amount[]" id="balance_amount_<?= $i ?>" class="form-control balance_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="service_charge_amount[]" id="service_charge_amount_<?= $i ?>" class="form-control service_charge_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="bonus_amount[]" id="bonus_amount_<?= $i ?>" class="form-control bonus_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format($value['basic_salary'],2) ?> type="number" name="net_pay_amount[]" id="net_pay_amount_<?= $i ?>" class="form-control net_pay_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td>
                                        <select class="form-control id_payment_method" id="id_payment_method_<?= $i ?>" data-id="<? $i ?>" name="id_payment_method[]">
                                            <option value="1">Bank</option>
                                            <option value="2">Cash</option>
                                        </select>
                                    </td>
                                    <td><input value=<?= number_format(0,2) ?> type="number" name="tip_amount[]" id="tip_amount_<?= $i ?>" class="form-control tip_amount" data-id="<?= $i ?>" step="0.01"></td>
                                    <td><input value=<?= number_format($value['basic_salary'],2) ?> type="number" name="total_net_pay_amount[]" id="total_net_pay_amount_<?= $i ?>" class="form-control total_net_pay_amount" data-id="<?= $i ?>" step="0.01" readonly></td>
                                    <td><input type="text" name="remark[]" id="remark_<?= $i ?>" class="form-control remark" data-id="<?= $i ?>" step="0.01"></td>
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
                                    <input value="<?= number_format(array_sum(array_column($model_data, 'basic_salary')), 2, '.', '') ?>" type="number" name="grand_total_basic_salary" id="grand_total_basic_salary" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_probation_pass_amount" id="grand_total_probation_pass_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="0" type="number" name="grand_total_probation_working_day" id="grand_total_probation_working_day" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_probation_per_day_amount" id="grand_total_probation_per_day_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_probation_pass_total_amount" id="grand_total_probation_pass_total_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="0" type="number" name="grand_total_absent" id="grand_total_absent" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_absent_deduct_amount" id="grand_total_absent_deduct_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_advance_deduct_amount" id="grand_total_advance_deduct_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_increase_amount" id="grand_total_increase_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_other_amount" id="grand_total_other_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(array_sum(array_column($model_data, 'basic_salary')), 2, '.', '') ?>" type="number" name="grand_total_balance_amount" id="grand_total_balance_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_service_charge_amount" id="grand_total_service_charge_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_bonus_amount" id="grand_total_bonus_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    <input value="<?= number_format(array_sum(array_column($model_data, 'basic_salary')), 2, '.', '') ?>" type="number" name="grand_total_net_pay_amount" id="grand_total_net_pay_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td>
                                    --,--
                                </td>
                                <td>
                                    <input value="<?= number_format(0, 2, '.', '') ?>" type="number" name="grand_total_tip_amount" id="grand_total_tip_amount" class="form-control" step="0.01" readonly>
                                </td>
                                <td colspan="2">
                                    <input value="<?= number_format(array_sum(array_column($model_data, 'basic_salary')), 2, '.', '') ?>" type="number" name="grand_total_total_net_pay_amount" id="grand_total_total_net_pay_amount" class="form-control" step="0.01" readonly>
                                </td>
                            </tr>
                        </tfoot>
                    <?php }else{ ?>
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
                    <?php } ?>
                </table>
            </div>
            <div class="line15"></div>
            <div class="text-right <?= $model->status == 3 ? '' : 'hide'?>"> 
                <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded', 'id' => 'save_button']) ?>
            </div> 
            
        </div>
        <?php ActiveForm::end(); ?>
    </div>
    
</div>

<?php

$script = <<<JS
    
$(".table-responsive").freezeTable({
    'columnNum': 4,
    'columnKeep': true,
    'freezeHead': true,
    scrollBar: true,
    // fastMode: true,
    // scrollable: true
});

$(document).ready(function (){
   CalculateEachRow();
   $(".calculate_item :input[type=number]").trigger('change');
});

CalculateGrandTotal();

function CalculateEachRow(){
    $(".calculate_item :input[type=number]").change(function(){

        var id = $(this).data('id');

        var working_day = 30;
        working_day = parseInt(working_day);

        var basic_salary = $("#basic_salary_"+id).val();
        basic_salary = parseFloat(basic_salary);
        if (isNaN(basic_salary)) {
            basic_salary = 0;
        }

        var probation_pass_amount = $("#probation_pass_amount_"+id).val();
        probation_pass_amount = parseFloat(probation_pass_amount);

        var probation_working_day = $("#probation_working_day_"+id).val();
        probation_working_day = parseFloat(probation_working_day);
        
        //~~~~~~~~~~~~~~~~~~~ Calculate total_probation_per_day_amount ~~~~~~~~~~~~~~~~~~~

            var total_probation_per_day_amount = probation_pass_amount / working_day;
            $("#probation_per_day_amount_"+id).val(parseFloat(total_probation_per_day_amount).toFixed(2));

        //~~~~~~~~~~~~~~~~~~~ Calculate total_probation_per_day_amount ~~~~~~~~~~~~~~~~~~~

        var probation_per_day_amount = $("#probation_per_day_amount_"+id).val();
        probation_per_day_amount = parseFloat(probation_per_day_amount);

        //~~~~~~~~~~~~~~~~~~~ Calculate total_probation_pass_total_amount ~~~~~~~~~~~~~~~~~~~
            var total_probation_pass_total_amount = probation_per_day_amount * probation_working_day;
            $("#probation_pass_total_amount_"+id).val(parseFloat(total_probation_pass_total_amount).toFixed(2));
        //~~~~~~~~~~~~~~~~~~~ Calculate total_probation_pass_total_amount ~~~~~~~~~~~~~~~~~~~

        var probation_pass_total_amount = $("#probation_pass_total_amount_"+id).val();
        probation_pass_total_amount = parseFloat(probation_pass_total_amount);

        var absent = $("#absent_"+id).val();
        absent = parseFloat(absent);

        //~~~~~~~~~~~~~~~~~~~ Calculate total_absent_deduct_amount ~~~~~~~~~~~~~~~~~~~
            var total_absent_deduct_amount = basic_salary / working_day * absent;
            $("#absent_deduct_amount_"+id).val(parseFloat(total_absent_deduct_amount).toFixed(2));
        //~~~~~~~~~~~~~~~~~~~ Calculate total_absent_deduct_amount ~~~~~~~~~~~~~~~~~~~

        var absent_deduct_amount = $("#absent_deduct_amount_"+id).val();
        absent_deduct_amount = parseFloat(absent_deduct_amount);

        var advance_deduct_amount = $("#advance_deduct_amount_"+id).val();
        advance_deduct_amount = parseFloat(advance_deduct_amount);

        var increase_amount = $("#increase_amount_"+id).val();
        increase_amount = parseFloat(increase_amount);

        var other_amount = $("#other_amount_"+id).val();
        other_amount = parseFloat(other_amount);

        //~~~~~~~~~~~~~~~~~~~ Calculate total_balance_amount ~~~~~~~~~~~~~~~~~~~
            var total_balance_amount = basic_salary + probation_pass_total_amount - absent_deduct_amount - advance_deduct_amount + increase_amount + other_amount;
            $("#balance_amount_"+id).val(parseFloat(total_balance_amount).toFixed(2));
        //~~~~~~~~~~~~~~~~~~~ Calculate total_balance_amount ~~~~~~~~~~~~~~~~~~~

        var balance_amount = $("#balance_amount_"+id).val();
        balance_amount = parseFloat(balance_amount);

        var service_charge_amount = $("#service_charge_amount_"+id).val();
        service_charge_amount = parseFloat(service_charge_amount);

        var bonus_amount = $("#bonus_amount_"+id).val();
        bonus_amount = parseFloat(bonus_amount);

        //~~~~~~~~~~~~~~~~~~~ Calculate total_net_pay_amount ~~~~~~~~~~~~~~~~~~~
            var total_net_pay_amount = balance_amount + service_charge_amount + bonus_amount;
            $("#net_pay_amount_"+id).val(parseFloat(total_net_pay_amount).toFixed(2));
        //~~~~~~~~~~~~~~~~~~~ Calculate total_net_pay_amount ~~~~~~~~~~~~~~~~~~~

        var net_pay_amount = $("#net_pay_amount_"+id).val();
        net_pay_amount = parseFloat(net_pay_amount);

        var tip_amount = $("#tip_amount_"+id).val();
        tip_amount = parseFloat(tip_amount);

        //~~~~~~~~~~~~~~~~~~~ Calculate grand_total_net_pay_amount ~~~~~~~~~~~~~~~~~~~
            var grand_total_net_pay_amount = net_pay_amount + tip_amount;
            $("#total_net_pay_amount_"+id).val(parseFloat(grand_total_net_pay_amount).toFixed(2));
        //~~~~~~~~~~~~~~~~~~~ Calculate grand_total_net_pay_amount ~~~~~~~~~~~~~~~~~~~
 
        CalculateGrandTotal();

    });
}


function CalculateGrandTotal() {
    var sum = 0;
    $(".table-responsive > table .probation_pass_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_probation_pass_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .probation_working_day").each(function(){
        sum += parseInt(this.value);
    });
    $("#grand_total_probation_working_day").val(parseInt(sum));

    var sum = 0;
    $(".table-responsive > table .probation_per_day_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_probation_per_day_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .probation_pass_total_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_probation_pass_total_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .absent").each(function(){
        sum += parseInt(this.value);
    });
    $("#grand_total_absent").val(parseInt(sum));

    var sum = 0;
    $(".table-responsive > table .absent_deduct_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_absent_deduct_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .advance_deduct_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_advance_deduct_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .increase_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_increase_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .other_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_other_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .balance_amount").each(function(){
        sum += +parseFloat($(this).val());
    });
    $("#grand_total_balance_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .service_charge_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_service_charge_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .bonus_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_bonus_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .net_pay_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_net_pay_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .tip_amount").each(function(){
        sum += parseFloat(this.value);
    });
    $("#grand_total_tip_amount").val(parseFloat(sum).toFixed(2));

    var sum = 0;
    $(".table-responsive > table .total_net_pay_amount").each(function(){

        sum += parseFloat(this.value);
    });
    $("#grand_total_total_net_pay_amount").val(parseFloat(sum).toFixed(2));

}

    $("body").on("submit", "form", function() {
        $(".clone-head-table-wrap").html("");
        $(".clone-column-table-wrap").html("");
        $(".clone-head-table-wrap .clone-column-head-table-wrap").html("");

        // $('#overlay').css({'display':'block','z-index':'9999'});
        $(this).submit(function() {
            return false;
        });
        return true;
    });

JS;
$this->registerJs($script);
?>
