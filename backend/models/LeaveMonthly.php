<?php

namespace backend\models;

use Yii;

class LeaveMonthly extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_monthly';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_employee', 'id_month', 'id_year'], 'required'],
            [['id_employee', 'id_month', 'id_year', 'status', 'updated_by', 'created_by'], 'integer'],
            [['updated_date', 'created_date'], 'safe'],
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
            'id_month' => 'Month',
            'id_year' => 'Year',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getEmployee(){
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }

    public function getMonth()
    {
        return $this->hasOne(MonthList::className(),['id'=>'id_month']);
    }

    public function getYear()
    {
        return $this->hasOne(YearList::className(),['id'=>'id_year']);
    }
}
