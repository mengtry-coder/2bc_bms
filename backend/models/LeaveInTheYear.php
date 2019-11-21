<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_in_the_year".
 *
 * @property int $id
 * @property resource $name
 * @property int $id_year_list
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class LeaveInTheYear extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_in_the_year';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_year_list', 'status', 'created_by', 'updated_by','id_month_list'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['name','id_year_list','id_month_list'], 'required'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'id_year_list' => 'Year',
            'id_month_list' => 'Month',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
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
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
