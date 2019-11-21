<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "membership_type".
 *
 * @property int $id
 * @property string $membership_type
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class MembershipType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'membership_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_date', 'updated_date'], 'safe'],
            [['created_by', 'updated_by', 'status'], 'integer'],
            [['membership_type', 'description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'membership_type' => 'Membership Tye',
            'description' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
        ];
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
