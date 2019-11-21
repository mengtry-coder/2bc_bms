<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "employee_position".
 *
 * @property int $id
 * @property string $position_type
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class EmployeePosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'employee_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_date', 'description', 'updated_date'], 'safe'],
            [['created_by', 'updated_by','id_department', 'status'], 'integer'],
            [['position_type'], 'string', 'max' => 255],
            [['position_type','id_department'], 'required'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'position_type' => 'Position Type',
            'id_department' => 'Department',
            'description' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
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
}
