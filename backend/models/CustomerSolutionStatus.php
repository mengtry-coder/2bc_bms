<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_solution_status".
 *
 * @property int $id
 * @property string $name
 * @property int $order_by
 */
class CustomerSolutionStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'customer_solution_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order_by'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'order_by' => 'Order By',
        ];
    }
}
