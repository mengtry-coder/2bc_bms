<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "permission_action".
 *
 * @property int $id
 * @property int $user_type_id
 * @property int $permission_menu_id
 */
class PermissionAction extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'permission_action';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_type_id', 'permission_menu_id','is_show_menu'], 'integer'],
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
            'permission_menu_id' => 'Permission Menu ID',
        ];
    }
}
