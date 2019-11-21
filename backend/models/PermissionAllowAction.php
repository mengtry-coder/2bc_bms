<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "permission_allow_action".
 *
 * @property int $id
 * @property string $name
 * @property string $action
 * @property string $extra_action
 */
class PermissionAllowAction extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'permission_allow_action';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['extra_action'], 'string'],
            [['name', 'action'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'action' => 'Action',
            'extra_action' => 'Extra Action',
        ];
    }
}
