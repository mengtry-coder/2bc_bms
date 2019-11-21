<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "hr_approval_permission_data".
 *
 * @property int $id
 * @property int $hr_approval_permission_id
 * @property int $employee_id
 */
class HrApprovalPermissionData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'hr_approval_permission_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hr_approval_permission_id', 'employee_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'hr_approval_permission_id' => 'Hr Approval Permission',
            'employee_id' => 'Employee',
        ];
    }
}
