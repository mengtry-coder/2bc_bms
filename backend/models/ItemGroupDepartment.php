<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_group_department".
 *
 * @property int $id
 * @property int $id_item_group
 * @property int $id_department
 */
class ItemGroupDepartment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_group_department';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_item_group', 'id_department'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_item_group' => 'Id Item Group',
            'id_department' => 'Id Department',
        ];
    }
}
