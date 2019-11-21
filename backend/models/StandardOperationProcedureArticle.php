<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "standard_operation_procedure_article".
 *
 * @property int $id
 * @property string $name
 * @property int $id_standard_operation_procedure_set_up
 * @property int $id_position
 * @property string $short_description
 * @property string $description
 * @property int $status
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class StandardOperationProcedureArticle extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'standard_operation_procedure_article';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['id_standard_operation_procedure_set_up', 'id_position', 'status', 'created_by', 'updated_by'], 'integer'],
            [['description'], 'string'],
            [['created_date', 'updated_date'], 'safe'],
            [['name', 'short_description'], 'string', 'max' => 255],
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
            'id_standard_operation_procedure_set_up' => 'S.O.P Set Up',
            'id_position' => 'Position',
            'short_description' => 'Short Description',
            'description' => 'Description',
            'status' => 'Status',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
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
    public function getPosition()
    {
        return $this->hasOne(EmployeePosition::className(),['id'=>'id_position']);
    }
}
