<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_profile_group".
 *
 * @property int $id
 * @property int $id_customer_profile
 * @property int $id_customer_group
 */
class CustomerProfileGroup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_profile_group';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer_profile', 'id_customer_group'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer_profile' => 'Id Customer Profile',
            'id_customer_group' => 'Id Customer Group',
        ];
    }
}
