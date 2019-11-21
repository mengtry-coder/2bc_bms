<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_group_template_data".
 *
 * @property int $id
 * @property int $id_item_group
 * @property int $id_data
 * @property string $description
 */
class ItemGroupTemplateData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_group_template_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_item_group', 'id_data'], 'integer'],
            [['description'], 'string', 'max' => 255],
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
            'id_data' => 'Id Data',
            'description' => 'Description',
        ];
    }
}
