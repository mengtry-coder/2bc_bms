<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_note".
 *
 * @property int $id
 * @property int $id_project
 * @property int $id_user
 * @property string $note
 */
class ProjectNote extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_note';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project', 'id_user'], 'integer'],
            [['note'], 'string'],
            [['note'], 'required'],
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
            'id_user' => 'Id User',
            'note' => 'Note',
        ];
    }
}
