<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "country".
 *
 * @property int $id
 * @property int $id_area
 * @property string $names
 * @property string $code
 * @property string $description
 * @property string $img
 * @property string $video_link
 * @property double $latitude
 * @property double $longitude
 * @property int $updated_by
 * @property string $updated_date
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 *
 * @property City[] $cities
 */
class Country extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'country';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_area', 'updated_by', 'status', 'created_by'], 'integer'],
            [['names'], 'required'],
            [['description'], 'string'],
            [['latitude', 'longitude'], 'number'],
            [['updated_date', 'created_date'], 'safe'],
            [['names', 'img'], 'string', 'max' => 250],
            [['code'], 'string', 'max' => 100],
            [['video_link'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_area' => 'Id Area',
            'names' => 'Names',
            'code' => 'Code',
            'description' => 'Description',
            'img' => 'Img',
            'video_link' => 'Video Link',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCities()
    {
        return $this->hasMany(City::className(), ['id_country' => 'id']);
    }
    public function getUpdatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }
    public function getCreatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
