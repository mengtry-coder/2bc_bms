<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "payroll_data".
 *
 * @property int $id
 * @property int $id_payroll
 * @property int $id_type
 * @property string $description
 * @property string $amount
 */
class PayrollData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payroll_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_payroll', 'id_type'], 'integer'],
            [['amount'], 'number'],
            [['description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_payroll' => 'Id Payroll',
            'id_type' => 'Id Type',
            'description' => 'Description',
            'amount' => 'Amount',
        ];
    }
}
