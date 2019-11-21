<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "lead_profile".
 *
 * @property int $id
 * @property string $lead_name
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
 * @property string $zip_code
 * @property int $customer_status
 * @property int $assigned_to
 * @property int $id_source
 */
class LeadProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $file;
    public static function tableName()
    {
        return 'lead_profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lead_name', 'company_name', 'address','email_address'], 'required'],
            [['latitute', 'longitute', 'star_rating'], 'number'],
            [['id_country', 'id_city', 'id_billing_city', 'id_billing_country', 'id_shipping_city', 'id_shipping_country', 'status', 'created_by', 'updated_by', 'customer_status', 'assigned_to', 'id_source', 'id_customer_type'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['lead_name', 'company_name', 'address', 'group_names', 'billing_address', 'shipping_address'], 'string', 'max' => 250],
            [['phone_number', 'zip_code'], 'string', 'max' => 50],
            [['note','img_url'], 'string', 'max' => 255],
            [['email_address'],'unique'],
            [['email_address'],'email'],

            // [['email_address'],'targetAttribute'=>['email_address'],'on'=>'new_record'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_customer_type' => 'Customer Type',
            'star_rating' => 'Rating',
            'lead_name' => 'Lead Name',
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
            'zip_code' => 'Zip Code',
            'customer_status' => 'Lead Status',
            'assigned_to' => 'Assigned To',
            'id_source' => 'Source',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::className(),['id_employee'=>'assigned_to']);
    } 
}
