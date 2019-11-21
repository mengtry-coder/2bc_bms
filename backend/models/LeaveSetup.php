<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "leave_setup".
 *
 * @property int $id
 * @property int $id_employee
 * @property int $id_month
 * @property int $id_year
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class LeaveSetup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'leave_setup';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_month', 'id_year'], 'required'],
            [['id_month', 'id_year', 'status', 'updated_by', 'created_by'], 'integer'],
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
            'id_month' => 'Month',
            'id_year' => 'Year',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
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
