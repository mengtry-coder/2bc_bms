<?php

namespace backend\models;

use Yii;

class Task extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */

    public static function tableName()
    {
        return 'task';
    }
 
    public function rules()
    {
        return [
            [['task_name', 'id_related_profile', 'id_priority', 'id_related_to', 'status', 'start_date','id_employee_position'],'required'],
            [['rate'], 'number'],
            [['start_date', 'due_date', 'deadline', 'updated_date', 'created_date', 'description','is_related_kpi','kpi_status','id_employee_position','department'], 'safe'],
            [['id_priority', 'id_repeater', 'id_related_to', 'id_related_profile', 'status', 'updated_by', 'created_by', 'id_billing_type', 'id_assign_type'], 'integer'],
            [['task_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [ 
            'kpi_status' => 'Standard Operation Step',
            'is_related_kpi' => 'Related To K.P.I',
            'id_employee_position' => 'Employee Possition',
            'id_assign_type' => 'Assign Type',
            'task_name' => 'Task Name',
            'id_billing_type' => 'Billing Type',
            'rate' => 'Rate',
            'start_date' => 'Start Date',
            'due_date' => 'Due Date',
            'deadline' => 'Deadline',
            'id_priority' => 'Priority',
            'id_repeater' => 'Repeat every',
            'id_related_to' => 'Related To',
            'id_related_profile' => 'Related Profile',
            'description' => 'Description',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getMember()
    {
        return $this->hasMany(TaskMember::className(), ['id_task' => 'id']);
    }

    public function getBillingType()
    {
        return $this->hasOne(BillingType::className(),['id'=>'id_billing_type']);
    }

    public function getTaskRelated()
    {
        return $this->hasOne(TaskRelatedTo::className(),['id'=>'id_related_to']);
    }

    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_customer']);
    }

    public function getTaskStatus()
    {
        return $this->hasOne(TaskStatus::className(),['id'=>'status']);
    }

    public function getTaskPriority()
    {
        return $this->hasOne(Priority::className(),['id'=>'id_priority']);
    }

    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'updated_by']);
    }

    public function getCreatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
