<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_application".
 *
 * @property int $id
 * @property int $id_approver
 * @property string $start_date
 * @property string $end_date
 * @property int $is_half_day
 * @property int $id_leave_type_name
 * @property string $leave_reason
 * @property string $reject_reason
 * @property string $id_leave_status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class LeaveApplication extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $date_range;
    public static function tableName()
    {
        return 'leave_application';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_approver', 'is_half_day','img_url', 'id_leave_type_name', 'created_by', 'updated_by','id_employee'], 'integer'],
            [['start_date', 'end_date', 'created_date', 'updated_date','date_range'], 'safe'],
            [['start_date', 'end_date', 'id_employee', 'leave_reason','id_leave_type_name'], 'required'],
            [['leave_reason', 'reject_reason', 'id_leave_status'], 'string', 'max' => 255],
        ];
    }
    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/employee-profile', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_employee' => 'Employee',
            'id_approver' => 'Approver',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'is_half_day' => 'Is Half Day',
            'id_leave_type_name' => 'Leave Type',
            'leave_reason' => 'Leave Reason',
            'reject_reason' => 'Reject Reason',
            'id_leave_status' => 'Leave Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }
    public function getEmployee(){
      return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }
    public function getApprover(){
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_approver']);
      }
    public function getLeaveStatus(){
      return $this->hasOne(LeaveStatus::className(),['id'=>'id_leave_status']);
    }
    public function getLeaveTypeName(){
      return $this->hasOne(LeaveTypeName::className(),['id'=>'id_leave_type_name']);
    }
}
