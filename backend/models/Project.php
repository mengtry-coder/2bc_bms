<?php

namespace backend\models;

use Yii;

class Project extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project';
    }

    /**
     * {@inheritdoc}
     */
    public $date_range,$from_date,$to_date,$id_employee;
    public function rules()
    {
        return [
            [['project_name', 'id_customer', 'id_priority', 'status', 'start_date', 'deadline'],'required'],
            [['id_customer', 'is_calculate', 'id_billing_type', 'id_priority', 'status', 'updated_by', 'created_by', 'cut_off_day'], 'integer'],
            [['project_progress', 'rate', 'estimated_hour'], 'number'],
            [['start_date', 'due_date', 'deadline', 'updated_date', 'created_date', 'description', 'note'], 'safe'],
            [['project_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'project_name' => 'Project Name',
            'id_customer' => 'Customer',
            'is_calculate' => 'Calculate progress through tasks',
            'project_progress' => 'Project Progress',
            'id_billing_type' => 'Billing Type',
            'rate' => 'Rate',
            'estimated_hour' => 'Estimated Hour',
            'start_date' => 'Start Date',
            'due_date' => 'Due Date',
            'deadline' => 'Deadline',
            'id_priority' => 'Priority',
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
        return $this->hasMany(ProjectMember::className(), ['id_project' => 'id']);
    }

    public function getBillingType()
    {
        return $this->hasOne(BillingType::className(),['id'=>'id_billing_type']);
    }

    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_customer']);
    }

    public function getProjectStatus()
    {
        return $this->hasOne(ProjectStatus::className(),['id'=>'status']);
    }

    public function getProjectPriority()
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
