<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "quotation_data".
 *
 * @property int $id
 * @property int $id_proposal
 * @property int $id_item
 * @property string $item_name
 * @property string $description
 * @property int $qty
 * @property string $rate
 * @property int $discount_type
 * @property string $discount_amount
 * @property string $amount
 */
class QuotationData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_quotation', 'id_item', 'qty', 'discount_type'], 'integer'],
            [['description'], 'string'],
            [['rate', 'discount_amount', 'amount'], 'number'],
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
            'id_quotation' => 'Id Proposal',
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

    public function getItem()
    {
        return $this->hasOne(Item::className(),['id'=>'id_item']);
    }
}
