<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "quotation".
 *
 * @property int $id
 * @property string $name
 * @property int $id_customer 1= lead 2 = customer
 * @property string $date
 * @property string $open_till
 * @property int $currency
 * @property int $discount_type
 * @property int $allow_comment
 * @property int $status
 * @property int $assigned
 * @property string $to
 * @property string $address
 * @property string $city
 * @property string $country
 * @property string $zip_code
 * @property string $email
 * @property string $phone
 * @property string $code
 * @property string $total
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $id_discount
 * @property string $discount_value
 * @property string $discount_amount
 * @property int $id_tax
 * @property int $is_tax
 * @property string $tax_amount
 * @property string $sub_total
 * @property int $is_converted_from_proposal
 * @property string $grand_total
 * @property int $id_project
 */
class Quotation extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer', 'currency', 'discount_type', 'allow_comment', 'status', 'assigned', 'created_by', 'updated_by', 'id_discount', 'id_tax', 'is_tax', 'is_converted_from_proposal', 'id_project'], 'integer'],
            [['date', 'open_till', 'created_date', 'updated_date', 'close_sale_date'], 'safe'],
            [['date', 'open_till','id_customer', 'assigned','status'], 'required'],
            [['total', 'discount_value', 'discount_amount', 'tax_amount', 'sub_total', 'grand_total'], 'number'],
            [['name', 'to', 'address', 'city', 'country', 'zip_code', 'email', 'phone', 'code'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'id_customer' => 'Customer',
            'date' => 'Date',
            'open_till' => 'Open Till',
            'currency' => 'Currency',
            'discount_type' => 'Discount Type',
            'allow_comment' => 'Allow Comment',
            'status' => 'Status',
            'assigned' => 'Assigned',
            'to' => 'To',
            'address' => 'Address',
            'city' => 'City',
            'country' => 'Country',
            'zip_code' => 'Zip Code',
            'email' => 'Email',
            'phone' => 'Phone',
            'code' => 'Code',
            'total' => 'Total',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'id_discount' => 'Id Discount',
            'discount_value' => 'Discount Value',
            'discount_amount' => 'Discount Amount',
            'id_tax' => 'Id Tax',
            'is_tax' => 'Is Tax',
            'tax_amount' => 'Tax Amount',
            'sub_total' => 'Sub Total',
            'is_converted_from_proposal' => 'Is Converted',
            'grand_total' => 'Grand Total',
            'id_project' => 'Project',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::className(),['id_employee'=>'assigned']);
    } 
    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_customer']);
    }

    public function getEmployee()
    {
        return $this->hasOne(EmployeeProfile::className(),['id'=>'assigned']);
    }

    public function getProject()
    {
        return $this->hasOne(Project::className(),['id'=>'id_project']);
    }

    public function getQuotationStatus()
    {
        return $this->hasOne(QuotationStatus::className(),['id'=>'status']);
    }
}
