<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_timesheet".
 *
 * @property int $id
 * @property string $start_date
 * @property string $start_time
 * @property string $end_date
 * @property string $end_time
 * @property int $id_project
 * @property int $id_task
 * @property string $note
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class ProjectTimesheet extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_timesheet';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['start_date', 'end_date', 'start_time', 'end_time', 'id_task', 'note'], 'required'],
            [['start_date', 'end_date', 'updated_date', 'created_date', 'description'], 'safe'],
            [['id_project', 'id_task', 'status', 'updated_by', 'created_by', 'id_employee'], 'integer'],
            [['start_time', 'end_time'], 'string', 'max' => 20],
            [['note'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_employee' => 'Member',
            'start_date' => 'Start Date',
            'start_time' => 'Start Time',
            'end_date' => 'End Date',
            'end_time' => 'End Time',
            'id_project' => 'Project',
            'id_task' => 'Task',
            'note' => 'Name',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getTask()
    {
        return $this->hasOne(Task::className(),['id'=>'id_task']);
    }

    public function getProject()
    {
        return $this->hasOne(Project::className(),['id'=>'id_project']);
    }

    public function getMember()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
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
