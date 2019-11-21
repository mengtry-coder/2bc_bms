<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "uploaded_file".
 *
 * @property integer $id
 * @property string $name
 * @property string $filename
 * @property integer $size
 * @property string $type
 * @property string $thumbnail
 * @property boolean $status
 */
class UploadedFile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'uploaded_file';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['size'], 'integer'],
            [['status'], 'boolean'],
            [['name'], 'string', 'max' => 64],
            [['filename'], 'string', 'max' => 256],
            [['type'], 'string', 'max' => 32],
            [['thumbnail'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'filename' => 'Filename',
            'size' => 'Size',
            'type' => 'Type',
            'thumbnail' => 'Thumbnail',
            'status' => 'Status',
        ];
    }
}
