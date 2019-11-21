<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "finance_pay_bill_data".
 *
 * @property int $id
 * @property int $pay_bill_id
 * @property int $bill_id
 * @property string $doc_id
 * @property string $description
 * @property string $total_amount
 * @property string $paid_amount
 * @property int $status
 */
class FinancePayBillData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_pay_bill_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pay_bill_id', 'bill_id', 'status'], 'integer'],
            [['total_amount', 'paid_amount'], 'number'],
            [['doc_id'], 'string', 'max' => 50],
            [['description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pay_bill_id' => 'Pay Bill ID',
            'bill_id' => 'Bill ID',
            'doc_id' => 'Doc ID',
            'description' => 'Description',
            'total_amount' => 'Total Amount',
            'paid_amount' => 'Paid Amount',
            'status' => 'Status',
        ];
    }

    public function getPayBill()
    {
        return $this->hasOne(FinancePayBill::className(),['id'=>'pay_bill_id']);
    }
}
