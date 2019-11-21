<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_profile_contact".
 *
 * @property int $id
 * @property int $id_customer
 * @property string $contact_name
 * @property string $position
 * @property string $email_address
 * @property string $phone
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property string $updated_date
 * @property int $updated_by
 * @property string $note
 */
class CustomerProfileContact extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $file;
    public static function tableName()
    {
        return 'customer_profile_contact';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer','contact_name'],'required'],
            [['id_customer', 'status', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['contact_name', 'position', 'email_address', 'phone', 'tel', 'department'], 'string', 'max' => 255],
            [['note'], 'string', 'max' => 500],
            [['email_address','id_customer'],'unique','targetAttribute'=>['email_address','id_customer'],'on'=>'new_record'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer' => 'Customer',
            'contact_name' => 'Contact Name',
            'position' => 'Position',
            'email_address' => 'Email Address',
            'phone' => 'Phone',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'note' => 'Note',
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
