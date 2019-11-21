<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "source".
 *
 * @property int $id
 * @property string $name
 * @property string $created_date
 * @property int $updated_by
 * @property int $created_by
 * @property string $updated_date
 * @property int $status
 */
class Source extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'source';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_date', 'updated_date'], 'safe'],
            [['updated_by', 'created_by', 'status'], 'integer'],
            [['name'], 'string', 'max' => 255],
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
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
        ];
    }
}
