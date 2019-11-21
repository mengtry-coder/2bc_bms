<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_status".
 *
 * @property int $id
 * @property string $approve_status_name
 */
class LeaveStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['approve_status_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'approve_status_name' => 'Approve Status Name',
        ];
    }
}
