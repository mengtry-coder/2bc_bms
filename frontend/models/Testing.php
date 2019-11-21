<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "testing".
 *
 * @property int $id
 * @property string $Testing
 * @property bool $status
 */
class Testing extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'testing';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id'], 'integer'],
            [['status'], 'boolean'],
            [['Testing'], 'string', 'max' => 255],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'Testing' => 'Testing',
            'status' => 'Status',
        ];
    }
}
