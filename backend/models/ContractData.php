<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "contract_data".
 *
 * @property int $id
 * @property int $id_contract
 * @property int $id_item
 * @property string $item_name
 * @property string $description
 * @property int $qty
 * @property string $rate
 * @property int $discount_type
 * @property string $discount_amount
 * @property string $amount
 */
class ContractData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'contract_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_contract', 'id_item', 'qty', 'discount_type'], 'integer'],
            [['description'], 'string'],
            [['rate', 'discount_amount', 'amount', 'other_charge'], 'number'],
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
            'id_contract' => 'Id Contract',
            'id_item' => 'Id Item',
            'item_name' => 'Item Name',
            'description' => 'Description',
            'other_charge' => 'Other Charge',
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
