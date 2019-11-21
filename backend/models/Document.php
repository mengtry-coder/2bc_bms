<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "document".
 *
 * @property int $id
 * @property string $file_name
 * @property double $file_size
 * @property int $id_folder
 * @property int $id_membership_profile
 * @property string $file_path
 * @property string $thumbnail
 * @property string $description
 * @property int $created_by
 * @property string $created_date
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class Document extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'document';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['file_name', 'file_path', 'created_by', 'created_date'], 'required'],
            [['file_size'], 'number'],
            [['id_standard_operation_procedure_set_up','id_lead_profile','id_contract','id_project','id_employee_profile','id_folder','id_event_list','id_membership_profile', 'created_by', 'updated_by', 'status','document_permission','file_extention'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['file_name', 'file_path', 'thumbnail', 'description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'file_name' => 'File Name',
            'file_size' => 'File Size',
            'id_folder' => 'Id Folder',
            'id_membership_profile' => 'Id Membership Profile',
            'file_path' => 'File Path',
            'thumbnail' => 'Thumbnail',
            'description' => 'Description',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
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
