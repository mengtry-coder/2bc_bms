<?php

namespace backend\models;

use Yii;

class SaleReport extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_invoice';
    }

    /**
     * {@inheritdoc}
     */
    public $shipping_to, $billing_to,$to_date,$date_range,$from_date,$globalSearch,$is_print,$related_to;
    public function rules()
    {
        return [ 
            [['date', 'due_date', 'updated_date', 'created_date', 'term_condition','to_date','date_range','from_date','related_to'], 'safe'],
            [['is_print','id_customer', 'id_payment_method', 'id_recurring_invoice', 'recurring_value', 'recurring_type', 'status', 'updated_by', 'created_by', 'currency', 'id_sale_agent', 'id_discount', 'id_tax', 'is_tax', 'id_project'], 'integer'],
            [['total_tax', 'total_amount', 'receive_amount', 'balance_amount', 'discount_value', 'discount_amount', 'tax_amount', 'sub_total'], 'number'],
            [['doc_id', 'admin_note', 'note', 'client_note', 'shipping_to', 'billing_to'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
        ];
    }

    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_customer']);
    }

    public function getProject()
    {
        return $this->hasOne(Project::className(),['id'=>'id_project']);
    }

    public function getInvoiceStatus()
    {
        return $this->hasOne(InvoiceStatus::className(),['id'=>'status']);
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
