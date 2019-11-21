<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_setup_data".
 *
 * @property int $id
 * @property int $id_leave_setup
 * @property int $id_leave_type
 * @property string $amount
 */
class LeaveSetupData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_setup_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_leave_setup', 'id_leave_type'], 'integer'],
            [['amount'], 'number'],
            ['date', 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_leave_setup' => 'Id Leave Setup',
            'id_leave_type' => 'Id Leave Type',
            'amount' => 'Amount',
        ];
    }
}
