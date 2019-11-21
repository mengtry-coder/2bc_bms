<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "task_member".
 *
 * @property int $id
 * @property int $id_task
 * @property int $id_employee
 */
class TaskMember extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'task_member';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_task', 'id_employee'], 'integer'],
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
            'id_employee' => 'Id Employee',
        ];
    }

    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }
}
