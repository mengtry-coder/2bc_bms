<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "event_list".
 *
 * @property int $id
 * @property string $img_url
 * @property string $event_name
 * @property int $number_of_audient
 * @property string $address
 * @property string $address_line_2
 * @property int $id_country
 * @property int $id_city
 * @property int $id_province
 * @property string $postal_code
 * @property int $prefix_phone_code
 * @property string $phone_number
 * @property int $prefix_phone_code_line_2
 * @property string $phone_number_line_2
 * @property string $email
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 * @property string $from_date
 * @property string $to_date
 */
class EventList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $membership_name,$id_membership_profile,$numParticipatoin;
    public static function tableName()
    {
        return 'event_list';
    }

    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/event-list', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
     }
    public function rules()
    {
        return [
            [['event_name', 'address'], 'required'],
            [['id_country', 'id_city','prefix_phone_code', 'prefix_phone_code_line_2', 'created_by', 'updated_by', 'status','authorized'], 'integer'],
            [['id_province', 'created_date', 'updated_date', 'from_date', 'to_date','membership_name','fee_for_membership','fee_for_subscriber','description'], 'safe'],
            [['img_url', 'event_name', 'address', 'address_line_2', 'postal_code', 'phone_number', 'phone_number_line_2', 'email'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'authorized' => 'Authorized',
            'fee_for_membership' => 'Fee for membership',
            'fee_for_subscriber' => 'Fee for subscriber',
            'id' => 'ID',
            'img_url' => 'Img Url',
            'event_name' => 'Event Name',
            'number_of_audient' => 'No.Pax',
            'address' => 'Address',
            'address_line_2' => 'Address Line 2',
            'id_country' => 'Country',
            'id_city' => 'City',
            'id_province' => 'Province',
            'postal_code' => 'Postal Code',
            'prefix_phone_code' => 'Prefix',
            'phone_number' => 'Phone Number',
            'prefix_phone_code_line_2' => 'Prefix',
            'phone_number_line_2' => 'Phone Number Line 2',
            'email' => 'Email',
            'description' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'from_date' => 'From Date',
            'to_date' => 'To Date',
        ];
    }

    public function getMembershipProfile()
    {
      return $this->hasOne(MembershipProfile::className(),['id'=>'id_membership_profile']);
    }
    public function getUpdatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }
    public function getCreatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }
    // public function getUpdatedBy()
    // {
    //   return $this->hasOne(User::className(),['id'=>'updated_by']);
    // }
    // public function getCreatedBy()
    // {
    //   return $this->hasOne(User::className(),['id'=>'created_by']);
    // }
    // public function getPaymentMethod()
    // {
    //   return $this->hasOne(PaymentMethod::className(),['id'=>'id_payment_method']);
    // }
    // public function getPaymentType()
    // {
    //   return $this->hasOne(PaymentType::className(),['id'=>'id_payment_type']);
    // }
    // public function getMembershipType()
    // {
    //   return $this->hasOne(MembershipType::className(),['id'=>'id_membership_type']);
    // }
    // public function getPrefix()
    // {
    //   return $this->hasOne(DataOptionPrefix::className(),['id'=>'id_prefix']);
    // }
}
