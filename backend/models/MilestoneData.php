<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "milestone_data".
 *
 * @property int $id
 * @property int $id_milestone_type
 * @property int $id_project
 * @property int $id_task
 */
class MilestoneData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'milestone_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_milestone_type', 'id_project', 'id_task'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_milestone_type' => 'Id Milestone Type',
            'id_project' => 'Id Project',
            'id_task' => 'Id Task',
        ];
    }
}
