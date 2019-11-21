<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "document_format".
 *
 * @property int $id
 * @property int $id_type
 * @property string $name
 */
class DocumentFormat extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'document_format';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_type'], 'integer'],
            [['name'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_type' => 'Id Type',
            'name' => 'Name',
        ];
    }
}
