<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "standard_operation_step".
 *
 * @property int $id
 * @property string $name
 * @property int $id_employee_position
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property string $updated_by
 * @property int $status
 * @property string $css
 * @property int $sort
 */
class StandardOperationStep extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'standard_operation_step';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_employee_position','name'],'required'],
            [['id_employee_position', 'created_by', 'status', 'sort'], 'integer'],
            [['created_date', 'updated_date', 'updated_by'], 'safe'],
            [['name', 'css'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'KPI Step Name',
            'id_employee_position' => 'Employee Position',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'css' => 'Css',
            'sort' => 'Sort',
        ];
    }
    public function getUpdatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }
    public function getCreatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }
    public function getPossition()
    {
      return $this->hasOne(EmployeePosition::className(),['id'=>'id_employee_position']);
    }
}
