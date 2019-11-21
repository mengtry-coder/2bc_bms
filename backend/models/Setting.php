<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "setting".
 *
 * @property int $id
 * @property string $names
 * @property string $value
 * @property string $description
 * @property int $status
 * @property string $type
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class Setting extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'setting';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['names','value'],'required'],
            [['value'], 'string'],
            [['status', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['names', 'description', 'type'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'names' => 'Names',
            'value' => 'Value / Label',
            'description' => 'Description',
            'status' => 'Status',
            'type' => 'Type',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }
}
