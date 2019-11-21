<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "working_group_data".
 *
 * @property int $id
 * @property int $id_working_group
 * @property int $id_user
 */
class WorkingGroupData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'working_group_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_working_group', 'id_user'], 'integer'],
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
            'id_user' => 'Id User',
        ];
    }
}
