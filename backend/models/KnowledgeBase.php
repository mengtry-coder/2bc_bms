<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "knowledge_base".
 *
 * @property int $id
 * @property string $name
 * @property resource $slug
 * @property int $group
 * @property int $internal_article 1= yes, 0 = No
 * @property int $disabled
 * @property string $discription
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class KnowledgeBase extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'knowledge_base';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'],'required'],
            [['group', 'internal_article', 'disabled', 'created_by', 'updated_by'], 'integer'],
            [['description','short_description'], 'string'],
            [['created_date', 'updated_date'], 'safe'],
            [['name', 'slug'], 'string', 'max' => 255],
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
            'slug' => 'Slug',
            'group' => 'Group',
            'internal_article' => 'Internal Article',
            'disabled' => 'Disabled',
            'discription' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }
}
