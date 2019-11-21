<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "system_setting".
 *
 * @property int $id
 * @property int $active
 * @property string $description
 */
class SystemSetting extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'system_setting';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['active'], 'integer'],
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
            'active' => 'Active',
            'description' => 'Description',
        ];
    }
}
