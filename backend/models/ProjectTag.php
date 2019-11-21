<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "project_tag".
 *
 * @property int $id
 * @property int $id_project
 * @property int $id_tag
 */
class ProjectTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_project'], 'integer'],
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
            'id_project' => 'Id Project',
            'id_tag' => 'Id Tag',
        ];
    }
}
