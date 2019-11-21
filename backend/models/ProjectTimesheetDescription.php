<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_timesheet_description".
 *
 * @property int $id
 * @property int $id_project_timesheet
 * @property string $description
 */
class ProjectTimesheetDescription extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_timesheet_description';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project_timesheet'], 'integer'],
            [['description'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_project_timesheet' => 'Id Project Timesheet',
            'description' => 'Description',
        ];
    }
}
