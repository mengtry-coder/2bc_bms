<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "folder".
 *
 * @property int $id
 * @property string $folder_name
 * @property string $id_membership_profile
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class Folder extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'folder';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['folder_name'], 'required'],
            [['id_standard_operation_procedure_set_up','id_lead_profile','id_contract','id_project','id_customer_profile','status', 'created_by', 'updated_by','id_document_permission','id_event_list','id_employee_profile'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['folder_name', 'id_membership_profile'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'folder_name' => 'Folder Name',
            'id_membership_profile' => 'Id Membership Profile',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
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
