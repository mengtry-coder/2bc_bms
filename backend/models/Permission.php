<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "permission".
 *
 * @property int $id
 * @property int $parent_id
 * @property string $menu_text
 * @property string $css_icon
 * @property string $menu_url
 * @property string $css_class
 * @property int $show_in_menu
 * @property string $controller
 * @property string $action
 * @property string $extra_action
 * @property int $sort_order
 */
class Permission extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'permission';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'show_in_menu', 'sort_order'], 'integer'],
            [['extra_action'], 'string'],
            [['menu_text', 'css_class'], 'string', 'max' => 500],
            [['css_icon'], 'string', 'max' => 50],
            [['menu_url', 'controller', 'action'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'menu_text' => 'Menu Text',
            'css_icon' => 'Css Icon',
            'menu_url' => 'Menu Url',
            'css_class' => 'Css Class',
            'show_in_menu' => 'Show In Menu',
            'controller' => 'Controller',
            'action' => 'Action',
            'extra_action' => 'Extra Action',
            'sort_order' => 'Sort Order',
        ];
    }
}
