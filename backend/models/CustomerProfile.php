<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer_profile".
 *
 * @property int $id
 * @property string $customer_name
 * @property string $company_name
 * @property string $phone_number
 * @property string $email_address
 * @property string $latitute
 * @property string $longitute
 * @property string $address
 * @property int $id_country
 * @property int $id_city
 * @property string $group_names
 * @property string $billing_address
 * @property int $id_billing_city
 * @property int $id_billing_country
 * @property string $shipping_address
 * @property int $id_shipping_city
 * @property int $id_shipping_country
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property string $img_url
 * @property string $updated_date
 * @property int $updated_by
 */
class CustomerProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $file;
    public static function tableName()
    {
        return 'customer_profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['customer_name', 'company_name', 'address','email_address'], 'required'],
            [['latitute', 'longitute'], 'number'],
            [['email_address'],'email'],
            [['customer_status','id_country', 'id_city', 'id_billing_city', 'id_billing_country', 'id_shipping_city', 'id_shipping_country', 'status', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['customer_name', 'company_name', 'address', 'group_names', 'billing_address', 'shipping_address'], 'string', 'max' => 250],
            [['phone_number','zip_code'], 'string', 'max' => 50],
            [['img_url', 'position'], 'string', 'max' => 255],
            [['email_address'],'unique'],
            [['email_address'],'unique','targetAttribute'=>['email_address'],'on'=>'new_record'],

            [['website_url', 'deactivated_at', 'deactivated_reason', 'deactivated_requested_by', 'deactivated_requested_contact_detail'], 'string'],
            [['accommodation_type', 'number_of_rooms', 'accomodation_status', 'passed_by', 'handle_by', 'deactivated_by', 'id_customer_type'], 'integer'],
            [['star_rating'], 'number'],
            [['sale_date', 'lived_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer_group' => 'Customer Group',
            'id_customer_type' => 'Customer Type',
            'customer_name' => 'Customer Name',
            'company_name' => 'Company Name',
            'phone_number' => 'Phone Number',
            'email_address' => 'Email Address',
            'latitute' => 'Latitute',
            'longitute' => 'Longitute',
            'address' => 'Address',
            'id_country' => 'Country',
            'id_city' => 'City',
            'group_names' => 'Group Names',
            'billing_address' => 'Billing Address',
            'id_billing_city' => 'Billing City',
            'id_billing_country' => 'Billing Country',
            'shipping_address' => 'Shipping Address',
            'id_shipping_city' => 'Shipping City',
            'id_shipping_country' => 'Shipping Country',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'img_url' => 'Img Url',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }
    public function getCustomerType()
    {
      return $this->hasOne(CustomerType::className(),['id'=>'id_customer_type']);
    }
    public function getCity()
    {
      return $this->hasOne(City::className(),['id'=>'id_city']);
    }
    // public function getCustomerProfileSolution()
    // {
    //   return $this->hasOne(CustomerProfileSolution::className(),['id_customer'=>'id']);
    // }
    // public function getCustomerGroupName()
    // {
    //     $id_customer_profile = $this->id;
    //     $customer_group = CustomerProfileGroup::find()->where(['id_customer_profile'=>$id_customer_profile])->all();
    //     $customer_group_code = "";
    //     foreach ($customer_group as $cg) {
    //         $group_code = CustomerGroupCode::findOne($cg["customer_group_code_id"])->customer_group_name;
    //         $group_code = "<span class=\"label label-info\">$group_code</span> ";
    //         $customer_group_code = $customer_group_code .  $group_code ;
    //     }
    //     return $customer_group_code;
    // }
}
