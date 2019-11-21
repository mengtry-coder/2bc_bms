<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "supplier_profile_contact".
 *
 * @property int $id
 * @property int $supplier_id
 * @property string $prefix
 * @property string $name
 * @property string $date_of_birth
 * @property int $gender_id
 * @property int $position_id
 * @property int $department_id
 * @property string $mobile
 * @property string $credit_note
 * @property string $email
 * @property string $description
 * @property int $status
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class SupplierProfileContact extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'supplier_profile_contact';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['supplier_id', 'gender_id', 'position_id', 'department_id', 'status', 'created_by', 'updated_by'], 'integer'],
            [['date_of_birth', 'created_date', 'updated_date'], 'safe'],
            [['prefix', 'credit_note'], 'string', 'max' => 10],
            [['name', 'mobile', 'email'], 'string', 'max' => 100],
            [['description'], 'string', 'max' => 255],
            [['name', 'position_id', 'department_id'], 'required']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'supplier_id' => 'Supplier',
            'prefix' => 'Prefix',
            'name' => 'Name',
            'date_of_birth' => 'Date Of Birth',
            'gender_id' => 'Gender',
            'position_id' => 'Position',
            'department_id' => 'Department',
            'mobile' => 'Mobile',
            'credit_note' => 'Credit Note',
            'email' => 'Email',
            'description' => 'Description',
            'status' => 'Status',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }

    public function getPosition()
    {
        return $this->hasOne(SupplierPosition::className(),['id'=>'position_id']);
    }

    public function getDepartment()
    {
        return $this->hasOne(SupplierDepartment::className(),['id'=>'department_id']);
    }
}
