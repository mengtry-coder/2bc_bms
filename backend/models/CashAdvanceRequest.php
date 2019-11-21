<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "cash_advance_request".
 *
 * @property int $id
 * @property string $date
 * @property int $id_employee
 * @property string $amount
 * @property string $amount_in_word
 * @property string $reason
 * @property int $id_pay_type
 * @property int $approved_by
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class CashAdvanceRequest extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cash_advance_request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_employee', 'amount', 'approved_by','date', 'chart_of_account'], 'required'],
            [['date', 'created_date', 'updated_date'], 'safe'],
            [['chart_of_account', 'id_employee', 'id_pay_type', 'approved_by', 'status', 'created_by', 'updated_by'], 'integer'],
            [['amount'], 'number', 'min'=>0.01],
            [['amount_in_word', 'reason', 'doc_id'], 'string', 'max' => 255],
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
            'id_employee' => 'Employee',
            'amount' => 'Amount',
            'amount_in_word' => 'Amount In Word',
            'reason' => 'Reason',
            'id_pay_type' => 'Payback Type',
            'approved_by' => 'Approved By',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }

    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }

    public function getApproval()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'approved_by']);
    }

    public function getPayment()
    {
        return $this->hasOne(PayPeriod::className(),['id'=>'id_pay_type']);
    }

    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'updated_by']);
    }

    public function getCreatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
