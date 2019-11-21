<?php

namespace backend\models;

use Yii;

class CustomerInvoice extends \yii\db\ActiveRecord
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
    public $shipping_to, $billing_to;
    public function rules()
    {
        return [
            [['id_customer', 'id_payment_method', 'id_discount'],'required'],
            [['date', 'due_date', 'updated_date', 'created_date', 'term_condition'], 'safe'],
            [['id_customer', 'id_payment_method', 'id_recurring_invoice', 'recurring_value', 'recurring_type', 'status', 'updated_by', 'created_by', 'currency', 'id_sale_agent', 'id_discount', 'id_tax', 'is_tax', 'id_project'], 'integer'],
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
            'id_project' => 'Project',
            'doc_id' => 'Invoice #',
            'date' => 'Date',
            'due_date' => 'Due Date',
            'id_customer' => 'Customer',
            'id_payment_method' => 'Payment Method',
            'total_tax' => 'Total Tax',
            'id_recurring_invoice' => 'Recurring Invoice',
            'recurring_value' => 'Recurring Value',
            'recurring_type' => 'Recurring Type',
            'admin_note' => 'Admin Note',
            'total_amount' => 'Total',
            'receive_amount' => 'Receive',
            'balance_amount' => 'Balance',
            'note' => 'Note',
            'term_condition' => 'Term Condition',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'currency' => 'Currency',
            'id_sale_agent' => 'Sale Agent',
            'client_note' => 'Client Note',
            'id_discount' => 'Discount',
            'discount_value' => 'Discount Value',
            'discount_amount' => 'Discount Amount',
            'id_tax' => 'Tax Type',
            'is_tax' => 'Tax',
            'tax_amount' => 'Tax Amount',
            'sub_total' => 'Sub Total',
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
