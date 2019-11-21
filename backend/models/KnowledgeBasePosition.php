<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "knowledge_base_position".
 *
 * @property int $id
 * @property int $id_knowledge_base
 * @property string $id_position
 */
class KnowledgeBasePosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'knowledge_base_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_knowledge_base'], 'integer'],
            [['id_position'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_knowledge_base' => 'Id Knowledge Base',
            'id_position' => 'Id Position',
        ];
    }
}
