<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "hr_approval_permission".
 *
 * @property int $id
 * @property int $approver_id
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class HrApprovalPermission extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'hr_approval_permission';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['approver_id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'approver_id' => 'Approver',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
        ];
    }
    public function getApprovalInfo()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'approver_id']);
    }
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
