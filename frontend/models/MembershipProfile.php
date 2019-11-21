<?php

namespace frontend\models;

use Yii;
/**
 * This is the model class for table "membership_profile".
 *
 * @property int $id
 * @property int $id_prefix
 * @property string $first_name
 * @property string $last_name
 * @property string $company_name
 * @property string $passport_no
 * @property string $date_of_birth
 * @property string $place_of_birth
 * @property string $sex
 * @property int $nationality
 * @property string $address
 * @property string $address_line_2
 * @property int $id_country
 * @property int $id_city
 * @property int $id_province
 * @property string $postal_code
 * @property int $marital_status
 * @property int $prefix_phone_code
 * @property string $phone_number
 * @property int $prefix_phone_code_line_2
 * @property string $phone_number_line_2
 * @property string $email
 * @property string $website
 * @property string $contact_person
 * @property string $position
 * @property string $mot_licence_no
 * @property string $year_of_establishment
 * @property string $type_of_business
 * @property string $username
 * @property string $password
 * @property string $confirm_password
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class MembershipProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'membership_profile';
    }

    public function behaviors(){
      return [
          [
              'class' => 'mdm\upload\UploadBehavior',
              'attribute' => 'file', // required, use to receive input file
              'savedAttribute' => 'img_url', // optional, use to link model with saved file.
              'uploadPath' => 'frontend/uploads/membership-profile', // saved directory. default to '@runtime/upload'
              'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
              'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
          ],
      ];
   }

    public function rules()
    {
        return [
            [['username'], 'unique'],
            [['email'],'email'],
            [['id_prefix', 'first_name', 'last_name', 'date_of_birth', 'company_name', 'nationality', 'address', 'marital_status', 'username','membership_type', 'email'], 'required'],
            [['id_prefix', 'nationality', 'id_country', 'id_city', 'marital_status', 'prefix_phone_code', 'prefix_phone_code_line_2', 'created_by', 'updated_by', 'status','membership_type'], 'integer'],
            [['date_of_birth', 'created_date', 'updated_date','img_url'], 'safe'],
            [['id_province','first_name', 'last_name', 'company_name', 'passport_no', 'place_of_birth', 'address', 'address_line_2', 'postal_code', 'phone_number', 'phone_number_line_2', 'email', 'website', 'contact_person', 'position', 'mot_licence_no', 'year_of_establishment', 'type_of_business', 'username', 'password', 'confirm_password', 'description'], 'string', 'max' => 255],
            [['sex'], 'string', 'max' => 8],
            ['confirm_password', 'compare', 'compareAttribute'=>'password', 'message'=>"Passwords don't match" ],
            [['confirm_password'], 'required', 'when' => function ($model) {
                return $model->password != '';
                }, 'whenClient' => "function (attribute, value) {
                    return $('#membershipprofile-password').val() != '';
                }"
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_prefix' => 'Prefix',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'company_name' => 'Company Name',
            'passport_no' => 'Passport No',
            'date_of_birth' => 'Date Of Birth',
            'place_of_birth' => 'Place Of Birth',
            'sex' => 'Sex',
            'nationality' => 'Nationality',
            'address' => 'Address',
            'address_line_2' => 'Address Line 2',
            'id_country' => 'Country',
            'id_city' => 'City',
            'id_province' => 'Province',
            'postal_code' => 'Postal Code',
            'marital_status' => 'Marital Status',
            'prefix_phone_code' => 'Prefix',
            'phone_number' => 'Phone Number',
            'prefix_phone_code_line_2' => 'Prefix',
            'phone_number_line_2' => 'Phone Number Line 2',
            'email' => 'Email',
            'website' => 'Website',
            'contact_person' => 'Contact Person',
            'position' => 'Position',
            'mot_licence_no' => 'MOT Licence',
            'year_of_establishment' => 'Year Of Establishment',
            'type_of_business' => 'Type Of Business',
            'username' => 'Username',
            'password' => 'Password',
            'confirm_password' => 'Confirm Password',
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
    public function getPrefix()
    {
      return $this->hasOne(DataOptionPrefix::className(),['id'=>'id_prefix']);
    }
    
    public function getMaritalStatus()
    {
      return $this->hasOne(MaritalStatus::className(),['id'=>'marital_status']);
    }

    public function getCity()
    {
      return $this->hasOne(City::className(),['id'=>'id_city']);
    }

    public function getCountry()
    {
      return $this->hasOne(Country::className(),['id'=>'id_country']);
    }

}
