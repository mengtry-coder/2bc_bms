<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_member".
 *
 * @property int $id
 * @property int $id_project
 * @property int $id_employee
 */
class ProjectMember extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_member';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project', 'id_employee'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_project' => 'Id Project',
            'id_employee' => 'Id Employee',
        ];
    }
}
