<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "task_check_list".
 *
 * @property int $id
 * @property int $id_task
 * @property string $description
 * @property string $from_time
 * @property string $to_time
 * @property int $status
 */
class TaskCheckList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'task_check_list';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_task', 'status'], 'integer'],
            [['description'], 'string', 'max' => 500],
            [['from_time', 'to_time'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_task' => 'Id Task',
            'description' => 'Description',
            'from_time' => 'From Time',
            'to_time' => 'To Time',
            'status' => 'Status',
        ];
    }
}
