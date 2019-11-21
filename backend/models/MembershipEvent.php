<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "membership_event".
 *
 * @property int $id
 * @property int $id_membership_profile
 * @property int $id_event_list
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
 */
class MembershipEvent extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $membership_name,$phone_number1,$phone_number2;
    public static function tableName()
    {
        return 'membership_event';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    { 
        return [ 
            [['number_of_audient','id_membership_profile', 'id_event_list'], 'required'],
            [['id_membership_profile', 'id_event_list', 'number_of_audient', 'id_country', 'id_city','prefix_phone_code', 'prefix_phone_code_line_2', 'created_by', 'updated_by', 'status','id_payment_type','id_payment_method','approval_status'], 'integer'],
            [['paid','created_date', 'updated_date','from_date','to_date','register_date','amount','balance','membership_name','phone_number1','phone_number2','event_fee','description','member_description'], 'safe'],
            [['address', 'address_line_2', 'postal_code', 'phone_number', 'phone_number_line_2', 'id_province','email'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'member_description' => 'Description',
            'id_payment_type' => 'Payment Type',
            'id_payment_method' => 'Payment Method',
            'phone_number1' => 'Phone Number',
            'phone_number2' => 'Phone Number Line 2',
            'id' => 'ID',
            'id_membership_profile' => 'Membership Profile',
            'id_event_list' => 'Event List',
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
    public function getPaymentMethod()
    {
      return $this->hasOne(PaymentMethod::className(),['id'=>'id_payment_method']);
    }
    public function getPaymentType()
    {
      return $this->hasOne(PaymentType::className(),['id'=>'id_payment_type']);
    }
    public function getMembershipType()
    {
      return $this->hasOne(MembershipType::className(),['id'=>'id_membership_type']);
    }
    public function getEventList()
    {
      return $this->hasOne(EventList::className(),['id'=>'id_event_list']);
    }
    public function getMembershipProfile()
    {
      return $this->hasOne(MembershipProfile::className(),['id'=>'id_membership_profile']);
    }
    public function getPrefix()
    {
      return $this->hasOne(DataOptionPrefix::className(),['id'=>'id_prefix']);
    }
}
