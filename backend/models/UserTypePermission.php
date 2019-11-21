<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "user_type_permission".
 *
 * @property int $id
 * @property int $user_type_id
 * @property int $permission_id
 */
class UserTypePermission extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_type_permission';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_type_id', 'permission_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_type_id' => 'User Type ID',
            'permission_id' => 'Permission ID',
        ];
    }
}
