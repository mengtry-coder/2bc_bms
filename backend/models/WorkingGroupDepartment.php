<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "working_group_department".
 *
 * @property int $id
 * @property int $id_working_group
 * @property int $id_department
 */
class WorkingGroupDepartment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'working_group_department';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_working_group', 'id_department'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_working_group' => 'Id Working Group',
            'id_department' => 'Id Department',
        ];
    }

    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['id' => 'id_department']);
    }
}
