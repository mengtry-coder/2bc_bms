<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "membership_document".
 *
 * @property int $id
 * @property int $id_membership_profile
 * @property string $document_name
 * @property string $document_type
 * @property string $document_size
 * @property string $uploaded_date
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class MembershipDocument extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'membership_document';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_membership_profile'], 'required'],
            [['id_membership_profile', 'created_by', 'updated_by', 'status'], 'integer'],
            [['uploaded_date', 'created_date', 'updated_date'], 'safe'],
            [['document_name', 'document_type', 'description'], 'string', 'max' => 255],
            [['document_size'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_membership_profile' => 'Id Membership Profile',
            'document_name' => 'Document Name',
            'document_type' => 'Document Type',
            'document_size' => 'Document Size',
            'uploaded_date' => 'Uploaded Date',
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
