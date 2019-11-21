<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tax".
 *
 * @property int $id
 * @property string $tax_name
 * @property string $value
 */
class Tax extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tax';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['value'], 'number'],
            [['tax_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tax_name' => 'Tax Name',
            'value' => 'Value',
        ];
    }
}
