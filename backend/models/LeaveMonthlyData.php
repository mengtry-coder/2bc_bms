<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_monthly_data".
 *
 * @property int $id
 * @property int $id_leave_monthly
 * @property int $id_leave_type
 * @property string $amount
 * @property string $date
 */
class LeaveMonthlyData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_monthly_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_leave_monthly', 'id_leave_type'], 'integer'],
            [['amount'], 'number'],
            [['date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_leave_monthly' => 'Id Leave Setup',
            'id_leave_type' => 'Id Leave Type',
            'amount' => 'Amount',
            'date' => 'Date',
        ];
    }
}
