<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "contract_customer_contact".
 *
 * @property int $id
 * @property int $id_contract
 * @property int $id_customer_contact
 */
class ContractCustomerContact extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'contract_customer_contact';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_contract', 'id_customer_contact'], 'integer'],
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
            'id_customer_contact' => 'Id Customer Contact',
        ];
    }
}
