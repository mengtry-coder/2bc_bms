<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "task_tag".
 *
 * @property int $id
 * @property int $id_task
 * @property int $id_tag
 */
class TaskTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'task_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_task'], 'integer'],
            [['id_tag'],'string', 'max'=>50]
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
            'id_tag' => 'Id Tag',
        ];
    }
}
