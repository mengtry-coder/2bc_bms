<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "supplier_position".
 *
 * @property int $id
 * @property int $department_id
 * @property string $name
 * @property int $status
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class SupplierPosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'supplier_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['department_id', 'status', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['name'], 'string', 'max' => 50],
            [['name', 'department_id'], 'required'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'department_id' => 'Department',
            'name' => 'Title',
            'status' => 'Status',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }

    public function getDepartment()
    {
        return $this->hasOne(SupplierDepartment::className(),['id'=>'department_id']);
    }
}
