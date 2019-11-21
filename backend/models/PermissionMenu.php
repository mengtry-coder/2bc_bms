<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "permission_menu".
 *
 * @property int $id
 * @property int $is_parent
 * @property int $parent_id
 * @property string $menu_name
 * @property string $menu_icon
 * @property string $menu_url
 * @property string $css_class
 * @property int $status
 */
class PermissionMenu extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'permission_menu';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['is_parent', 'parent_id', 'status', 'sort'], 'integer'],
            [['menu_name'], 'string', 'max' => 100],
            [['menu_icon'], 'string', 'max' => 50],
            [['extra_action'],'safe'],
            [['menu_url', 'css_class', 'controller', 'action'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'is_parent' => 'Is Parent',
            'parent_id' => 'Parent ID',
            'menu_name' => 'Menu Name',
            'menu_icon' => 'Menu Icon',
            'menu_url' => 'Menu Url',
            'css_class' => 'Css Class',
            'status' => 'Status',
        ];
    }
}
