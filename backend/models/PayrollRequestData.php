<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "payroll_request_data".
 *
 * @property int $id
 * @property int $id_payroll_request
 * @property int $id_employee
 * @property string $probation_pass_amount
 * @property int $probation_working_day
 * @property string $probation_per_day_amount
 * @property string $probation_pass_total_amount
 * @property string $absent
 * @property string $absent_deduct_amount
 * @property string $increase_amount
 * @property string $other_amount
 * @property string $balance_amount
 * @property string $service_charge_amount
 * @property string $bonus_amount
 * @property string $net_pay_amount
 * @property int $id_payment_method
 * @property string $tip_amount
 * @property string $total_net_pay_amount
 * @property string $remark
 */
class PayrollRequestData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payroll_request_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_payroll_request', 'id_employee', 'probation_working_day', 'id_payment_method', 'absent'], 'integer'],
            [['probation_pass_amount', 'probation_per_day_amount', 'probation_pass_total_amount', 'absent_deduct_amount', 'increase_amount', 'other_amount', 'balance_amount', 'service_charge_amount', 'bonus_amount', 'net_pay_amount', 'tip_amount', 'total_net_pay_amount', 'basic_salary', 'advance_deduct_amount'], 'number'],
            [['remark'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_payroll_request' => 'Id Payroll Request',
            'id_employee' => 'Id Employee',
            'probation_pass_amount' => 'Probation Pass Amount',
            'probation_working_day' => 'Probation Working Day',
            'probation_per_day_amount' => 'Probation Per Day Amount',
            'probation_pass_total_amount' => 'Probation Pass Total Amount',
            'absent' => 'Absent',
            'absent_deduct_amount' => 'Absent Deduct Amount',
            'advance_deduct_amount' => 'Cash Advance Deduct',
            'increase_amount' => 'Increase Amount',
            'other_amount' => 'Other Amount',
            'balance_amount' => 'Balance Amount',
            'service_charge_amount' => 'Service Charge Amount',
            'bonus_amount' => 'Bonus Amount',
            'net_pay_amount' => 'Net Pay Amount',
            'id_payment_method' => 'Id Payment Method',
            'tip_amount' => 'Tip Amount',
            'total_net_pay_amount' => 'Total Net Pay Amount',
            'remark' => 'Remark',
        ];
    }
}
