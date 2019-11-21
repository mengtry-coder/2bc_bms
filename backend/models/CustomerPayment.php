<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_payment".
 *
 * @property int $id
 * @property int $id_customer_invoice
 * @property string $doc_id
 * @property string $date
 * @property string $receive_amount
 * @property int $id_payment_method
 * @property string $note
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class CustomerPayment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_payment';
    }

    /**
     * {@inheritdoc}
     */
    public $invoice_no, $available_amount;
    public function rules()
    {
        return [
            [['id_payment_method', 'receive_amount', 'date', 'chart_of_account'], 'required'],
            [['id_customer_invoice', 'id_payment_method', 'status', 'updated_by', 'created_by', 'chart_of_account'], 'integer'],
            [['date', 'updated_date', 'created_date', 'invoice_no', 'clearing_date'], 'safe'],
            [['receive_amount', 'available_amount'], 'number'],
            [['doc_id', 'note'], 'string', 'max' => 255],
            [['cheque_number'], 'string', 'max' => 20],
            ['cheque_number', 'unique'],
            [['cheque_number', 'clearing_date'], 'required', 'when' => function ($model) {
                return $model->id_payment_method == 3;
                }, 'whenClient' => "function (attribute, value) {
                    return $('#customerpayment-id_payment_method').val() == 3;
                }"
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'invoice_no' => 'Invoice #',
            'chart_of_account' => 'Account',
            'id' => 'ID',
            'id_customer_invoice' => 'Customer Invoice',
            'doc_id' => 'Doc ID',
            'date' => 'Date',
            'receive_amount' => 'Amount',
            'id_payment_method' => 'Payment Method',
            'note' => 'Note',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getCustomerInvoice()
    {
        return $this->hasOne(CustomerInvoice::className(),['id'=>'id_customer_invoice']);
    }

    public function getPaymentMethod()
    {
        return $this->hasOne(PaymentMethod::className(),['id'=>'id_payment_method']);
    }
}
