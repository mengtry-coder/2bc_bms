<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_profile_solution".
 *
 * @property int $id
 * @property int $id_customer
 * @property int $id_solution
 */
class CustomerProfileSolution extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_profile_solution';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer', 'id_solution'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer' => 'Id Customer',
            'id_solution' => 'Id Solution',
        ];
    }
}
