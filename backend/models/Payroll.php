<?php

namespace backend\models;

use Yii;

class Payroll extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payroll';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            // [['chart_of_account', 'amount', 'amount_in_word'], 'required'],
            [['date', 'updated_date', 'created_date'], 'safe'],
            [['chart_of_account', 'chart_of_account_option', 'status', 'updated_by', 'created_by', 'id_payroll_request', 'pay_for'], 'integer'],
            [['amount', 'amount_option'], 'number'],
            [['doc_id'], 'string', 'max' => 50],
            [['amount_in_word', 'amount_in_word_option'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'doc_id' => 'Doc ID',
            'date' => 'Date',
            'pay_for' => 'Pay For',
            'chart_of_account' => 'Account',
            'amount' => 'Amount',
            'amount_in_word' => 'Amount In Word',
            'chart_of_account_option' => 'Optional Account',
            'amount_option' => 'Amount',
            'amount_in_word_option' => 'Amount In Word',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getMonth()
    {
        return $this->hasOne(MonthList::className(),['id'=>'pay_for']);
    }

    public function getPayrollStatus()
    {
        return $this->hasOne(PayrollStatus::className(),['id'=>'status']);
    }
}
