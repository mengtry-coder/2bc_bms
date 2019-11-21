<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "proposal".
 *
 * @property int $id
 * @property string $name
 * @property int $related_id can be custmer id or lead
 * @property string $date
 * @property string $open_till
 * @property int $currency
 * @property int $discount_type
 * @property int $allow_comment
 * @property int $status
 * @property int $assigned
 * @property string $to
 * @property string $address
 * @property int $city
 * @property int $country
 * @property string $zin_code
 * @property string $email
 * @property string $phone
 */
class Proposal extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'proposal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['related_id', 'currency','id_lead_customer', 'discount_type', 'allow_comment', 'status', 'assigned','updated_by','created_by', 'id_discount', 'id_tax', 'is_tax'], 'integer'],
            [['date', 'open_till','updated_date','created_date'], 'safe'],
            [['total', 'discount_amount', 'tax_amount', 'sub_total', 'grand_total', 'discount_value'], 'number'],
            [['name','related_id','date','open_till','status'], 'required'],
            [['name', 'to', 'address', 'zip_code', 'email', 'phone','code','city', 'country',], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Proposal #',
            'name' => 'Subject',
            'related_id' => 'Related To',
            'id_lead_customer' => 'Lead / Customer',
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
        ];
    }
    public function getProposalStatus()
    {
        return $this->hasOne(ProposalStatus::className(),['id'=>'status']);
    }
    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'related_id']);
    }
}
