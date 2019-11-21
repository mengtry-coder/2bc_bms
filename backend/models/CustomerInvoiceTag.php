<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_invoice_tag".
 *
 * @property int $id
 * @property int $id_customer_invoice
 * @property string $id_tag
 */
class CustomerInvoiceTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_invoice_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer_invoice'], 'integer'],
            [['id_tag'], 'string', 'max' => 50],
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
            'id_tag' => 'Id Tag',
        ];
    }
}
