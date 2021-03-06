<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_invoice_data".
 *
 * @property int $id
 * @property int $id_customer_invoice
 * @property int $id_item
 * @property string $item_name
 * @property string $description
 * @property int $qty
 * @property string $rate
 * @property int $discount_type
 * @property string $discount_amount
 * @property string $amount
 */
class CustomerInvoiceData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_invoice_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer_invoice', 'id_item', 'discount_type'], 'integer'],
            [['description'], 'string'],
            [['rate', 'discount_amount', 'amount', 'qty'], 'number'],
            [['item_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer_invoice' => 'Id Customer Invoice',
            'id_item' => 'Id Item',
            'item_name' => 'Item Name',
            'description' => 'Description',
            'qty' => 'Qty',
            'rate' => 'Rate',
            'discount_type' => 'Discount Type',
            'discount_amount' => 'Discount Amount',
            'amount' => 'Amount',
        ];
    }
}