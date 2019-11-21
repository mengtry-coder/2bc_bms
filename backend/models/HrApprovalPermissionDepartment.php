<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "hr_approval_permission_department".
 *
 * @property int $id
 * @property int $hr_approval_permission_id
 * @property int $department_id
 */
class HrApprovalPermissionDepartment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'hr_approval_permission_department';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hr_approval_permission_id', 'department_id'], 'integer'],
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
            'department_id' => 'Department',
        ];
    }
    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['id' => 'department_id']);
    }
}
