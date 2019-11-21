<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sop_goal_setup".
 *
 * @property int $id
 * @property int $id_position
 * @property int $id_employee
 * @property int $id_sop_step
 * @property int $id_sop_step_list
 * @property int $quarter_1
 * @property int $quarter_2
 * @property int $quarter_3
 * @property int $quarter_4
 * @property string $note
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class SopGoalSetup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sop_goal_setup';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_position', 'id_employee', 'id_sop_step', 'id_sop_step_list', 'id_year'], 'required'],
            [['id_year', 'id_position', 'id_employee', 'id_sop_step', 'id_sop_step_list', 'quarter_1', 'quarter_2', 'quarter_3', 'quarter_4', 'status', 'created_by', 'updated_by'], 'integer'],
            [['note'], 'string'],
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
            'id_year' => 'Year',
            'id_position' => 'Position',
            'id_employee' => 'Employee',
            'id_sop_step' => 'KPI Step',
            'id_sop_step_list' => 'KPI Step List',
            'quarter_1' => 'Quarter 1',
            'quarter_2' => 'Quarter 2',
            'quarter_3' => 'Quarter 3',
            'quarter_4' => 'Quarter 4',
            'note' => 'Note',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }

    public function getPosition()
    {
        return $this->hasOne(EmployeePosition::className(),['id'=>'id_position']);
    }

    public function getYearList()
    {
        return $this->hasOne(YearList::className(),['id'=>'id_year']);
    }

    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }

    public function getSopStep()
    {
        return $this->hasOne(StandardOperationStep::className(),['id'=>'id_sop_step']);
    }

    public function getSopStepList()
    {
        return $this->hasOne(StandardOperationStepList::className(),['id'=>'id_sop_step_list']);
    }

}
