<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "standard_operation_check_list".
 *
 * @property int $id
 * @property string $name
 * @property int $id_standard_operation_step_list
 * @property int $id_standard_operation
 * @property int $id_standard_operation_step
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property string $updated_by
 * @property int $status
 */
class StandardOperationCheckList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'standard_operation_check_list';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_standard_operation_step_list', 'id_standard_operation', 'id_standard_operation_step', 'created_by', 'status'], 'integer'],
            [['created_date', 'updated_date', 'updated_by','done_date'], 'safe'],
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
            'id_standard_operation_step_list' => 'SOP Step List',
            'id_standard_operation' => 'Id Standard Operation',
            'id_standard_operation_step' => 'Id Standard Operation Step',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
        ];
    }
}
