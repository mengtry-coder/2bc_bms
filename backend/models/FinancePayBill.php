<?php

namespace backend\models;

use Yii;

class FinancePayBill extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_pay_bill';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_related_to', 'id_related_profile', 'id_chart_of_account', 'date'], 'required'],
            [['id_related_to', 'id_related_profile', 'id_chart_of_account', 'id_payment_method', 'created_by', 'updated_by', 'status'], 'integer'],
            [['date', 'clearing_date', 'created_date', 'updated_date', 'bill_date'], 'safe'],
            [['amount'], 'number'],
            [['doc_id'], 'string', 'max' => 50],
            [['cheque_number'], 'string', 'max' => 10],
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
            'doc_id' => 'Doc. ID',
            'id_related_to' => 'Related To',
            'id_related_profile' => 'Name',
            'date' => 'Date',
            'id_chart_of_account' => 'Account',
            'id_payment_method' => 'Payment Method',
            'cheque_number' => 'Cheque Number',
            'clearing_date' => 'Clearing Date',
            'amount' => 'Amount',
            'remark' => 'Remark',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
        ];
    }

    public function getPaymentMethod()
    {
        return $this->hasOne(PaymentMethod::className(),['id'=>'id_payment_method']);
    }

    public function getMainTable()
    {
        return $this->hasOne(Expense::className(),['doc_id'=>'doc_id']);
    }
}
