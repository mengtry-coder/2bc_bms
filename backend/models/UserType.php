<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "user_type".
 *
 * @property int $id
 * @property bool $status
 * @property string $user_type_name
 * @property int $default_view_id
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 */
class UserType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_type_name'],'required'],
            [['status'], 'boolean'],
            [['default_view_id', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['user_type_name'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'status' => 'Status',
            'user_type_name' => 'User Type Name',
            'default_view_id' => 'Default View ID',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
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
