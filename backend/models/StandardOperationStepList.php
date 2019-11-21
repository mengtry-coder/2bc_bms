<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "standard_operation_step_list".
 *
 * @property int $id
 * @property string $name
 * @property int $id_standard_operation_step
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property string $updated_by
 * @property int $status
 * @property int $sort
 */
class StandardOperationStepList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'standard_operation_step_list';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_standard_operation_step', 'created_by', 'status', 'sort'], 'integer'],
            [['created_date', 'updated_date', 'updated_by','is_track'], 'safe'],
            [['name'], 'string', 'max' => 255],
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
            'id_standard_operation_step' => 'Id Standard Operation Step',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'sort' => 'Sort',
        ];
    }
}
