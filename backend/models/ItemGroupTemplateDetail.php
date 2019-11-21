<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_group_template_detail".
 *
 * @property int $id
 * @property int $id_item_group
 * @property string $title
 * @property string $description
 */
class ItemGroupTemplateDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_group_template_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_item_group', 'id_item_group_type'], 'integer'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 255],
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
            'title' => 'Title',
            'description' => 'Description',
        ];
    }

    public function getItemGroupData()
    {
        return $this->hasOne(ItemGroupData::className(), ['id' => 'id_item_group_type']);
    }
}
