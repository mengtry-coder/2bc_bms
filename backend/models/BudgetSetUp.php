<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "budget_set_up".
 *
 * @property int $id
 * @property int $id_employee
 * @property int $year
 * @property string $budget_value
 * @property string $actual
 * @property string $under_or_over
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class BudgetSetUp extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'budget_set_up';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_employee', 'year', 'status', 'created_by', 'updated_by','id_department','id_position'], 'integer'],
            [['budget_value','id_employee'], 'required'],
            [['budget_value', 'actual', 'under_or_over', 'quarter_1', 'quarter_2', 'quarter_3', 'quarter_4'], 'number'],
            [['created_date', 'updated_date','note','unit_type'], 'safe'],
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
            'id_position' => 'Position',
            'id_department' => 'Department',
            'year' => 'Year',
            'budget_value' => 'Budget Value',
            'actual' => 'Actual',
            'under_or_over' => 'Under / Over',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }
    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }
}
