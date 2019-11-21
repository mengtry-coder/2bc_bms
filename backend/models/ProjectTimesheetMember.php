<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_timesheet_member".
 *
 * @property int $id
 * @property int $id_timesheet
 * @property int $id_employee
 */
class ProjectTimesheetMember extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_timesheet_member';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project_timesheet', 'id_employee'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_project_timesheet' => 'Id Timesheet',
            'id_employee' => 'Id Employee',
        ];
    }
}
