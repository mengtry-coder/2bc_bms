<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_timesheet_tag".
 *
 * @property int $id
 * @property int $id_project_timesheet
 * @property string $id_tag
 */
class ProjectTimesheetTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_timesheet_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project_timesheet'], 'integer'],
            [['id_tag'], 'string', 'max' => 50],
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
            'id_tag' => 'Id Tag',
        ];
    }
}
