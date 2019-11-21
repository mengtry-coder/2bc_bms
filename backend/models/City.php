<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "city".
 *
 * @property int $id
 * @property int $id_country
 * @property string $code
 * @property string $names
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
 * @property Country $country
 */
class City extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'city';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_country', 'updated_by', 'status', 'created_by'], 'integer'],
            [['code', 'names'], 'required'],
            [['latitude', 'longitude'], 'number'],
            [['updated_date', 'created_date'], 'safe'],
            [['code'], 'string', 'max' => 100],
            [['names', 'img'], 'string', 'max' => 250],
            [['description'], 'string', 'max' => 255],
            [['video_link'], 'string', 'max' => 50],
            [['id_country'], 'exist', 'skipOnError' => true, 'targetClass' => Country::className(), 'targetAttribute' => ['id_country' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_country' => 'Country',
            'code' => 'Code',
            'names' => 'Names',
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
    public function getCountry()
    {
        return $this->hasOne(Country::className(), ['id' => 'id_country']);
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
