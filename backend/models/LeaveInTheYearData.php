<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_in_the_year_data".
 *
 * @property int $id
 * @property int $leave_type_value
 * @property int $id_leave_type
 * @property int $id_month_list
 * @property int $id_year_list
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class LeaveInTheYearData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_in_the_year_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_leave_in_the_year','leave_type_value', 'id_leave_type', 'id_month_list', 'id_year_list', 'created_by', 'updated_by'], 'integer'],
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
            'leave_type_value' => 'Leave Type Value',
            'id_leave_type' => 'Leave Type',
            'id_month_list' => 'Month List',
            'id_year_list' => 'Year List',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }
    public function getYearList()
    {
        return $this->hasOne(YearList::className(),['id'=>'id_year_list']);
    }
    public function getMonthList()
    {
        return $this->hasOne(MonthList::className(),['id'=>'id_month_list']);
    }
    public function getLeaveType()
    {
        return $this->hasOne(LeaveTypeName::className(),['id'=>'id_leave_type']);
    }
}
