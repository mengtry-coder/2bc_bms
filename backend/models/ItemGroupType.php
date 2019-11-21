<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_group_type".
 *
 * @property int $id
 * @property string $name
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class ItemGroupType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_group_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['status', 'updated_by', 'created_by'], 'integer'],
            [['updated_date', 'created_date'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'required'],
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
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }
}
