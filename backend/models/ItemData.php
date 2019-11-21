<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_data".
 *
 * @property int $id
 * @property int $id_item
 * @property int $id_data
 * @property string $description
 */
class ItemData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_item', 'id_data', 'status'], 'integer'],
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
            'id_item' => 'Id Item',
            'id_data' => 'Id Data',
            'description' => 'Description',
        ];
    }
}
