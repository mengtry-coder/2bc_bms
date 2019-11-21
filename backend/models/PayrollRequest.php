<?php

namespace backend\models;

use Yii;

class PayrollRequest extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payroll_request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_year', 'id_month', 'id_prepared_by'], 'required'],
            [['date', 'updated_date', 'created_date'], 'safe'],
            [['id_year', 'id_month', 'status', 'updated_by', 'created_by', 'grand_total_probation_working_day', 'grand_total_absent'], 'integer'],
            [['total_amount', 'grand_total_basic_salary', 'grand_total_probation_pass_amount', 'grand_total_probation_per_day_amount', 'grand_total_probation_pass_total_amount', 'grand_total_absent_deduct_amount', 'grand_total_increase_amount', 'grand_total_other_amount', 'grand_total_balance_amount', 'grand_total_service_charge_amount', 'grand_total_bonus_amount', 'grand_total_net_pay_amount', 'grand_total_tip_amount', 'grand_total_total_net_pay_amount', 'grand_total_advance_deduct_amount'], 'number'],
            [['id_prepared_by'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Date',
            'id_year' => 'Year',
            'id_month' => 'Payroll Request For',
            'total_amount' => 'Total Amount',
            'id_prepared_by' => 'Prepared By',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'grand_total_basic_salary' => 'Grand Total Basic Salary',
            'grand_total_probation_pass_amount' => 'Grand Total Probation Pass Amount',
            'grand_total_probation_working_day' => 'Grand Total Probation Working Day',
            'grand_total_probation_per_day_amount' => 'Grand Total Probation Per Day Amount',
            'grand_total_probation_pass_total_amount' => 'Grand Total Probation Pass Total Amount',
            'grand_total_absent' => 'Grand Total Absent',
            'grand_total_absent_deduct_amount' => 'Grand Total Absent Deduct Amount',
            'grand_total_increase_amount' => 'Grand Total Increase Amount',
            'grand_total_other_amount' => 'Grand Total Other Amount',
            'grand_total_balance_amount' => 'Grand Total Balance Amount',
            'grand_total_service_charge_amount' => 'Grand Total Service Charge Amount',
            'grand_total_bonus_amount' => 'Grand Total Bonus Amount',
            'grand_total_net_pay_amount' => 'Grand Total Net Pay Amount',
            'grand_total_tip_amount' => 'Grand Total Tip Amount',
            'grand_total_total_net_pay_amount' => 'Total Net Pay Amount',
        ];
    }

    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_prepared_by']);
    }

    public function getMonth()
    {
        return $this->hasOne(MonthList::className(),['id'=>'id_month']);
    }

    public function getYear()
    {
        return $this->hasOne(YearList::className(),['id'=>'id_year']);
    }

    public function getPayrollRequestStatus()
    {
        return $this->hasOne(PayrollRequestStatus::className(),['id'=>'status']);
    }
}
