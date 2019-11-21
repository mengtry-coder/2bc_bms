<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "membership_payment".
 *
 * @property int $id
 * @property int $id_membership_profile
 * @property string $amount
 * @property string $balance
 * @property int $id_payment_type
 * @property int $id_payment_method
 * @property int $id_membership_type
 * @property string $from_date
 * @property string $to_date
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 */
class MembershipPayment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $date_range,$id_membership;
    public static function tableName()
    {
        return 'membership_payment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            // [['id_membership_profile'], 'required'],
            [['id', 'id_membership_profile', 'id_payment_type', 'id_payment_method', 'id_membership_type', 'created_by', 'updated_by', 'status'], 'integer'],
            [['amount', 'balance','paid'], 'number'],
            [['from_date', 'to_date', 'created_date', 'updated_date','id_payment_for','date_range','id_membership'], 'safe'],
            [['description'], 'string', 'max' => 255],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_payment_for' => 'Payment For',
            'id' => 'ID',
            'id_membership_profile' => 'Membership Profile',
            'amount' => 'Amount',
            'balance' => 'Balance',
            'id_payment_type' => 'Payment Type',
            'id_payment_method' => 'Payment Method',
            'id_membership_type' => 'Membership Type',
            'from_date' => 'From Date',
            'to_date' => 'To Date',
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
    public function getPaymentFor()
    {
      return $this->hasOne(PaymentFor::className(),['id'=>'id_payment_for']);
    }
    public function getPaymentType()
    {
      return $this->hasOne(PaymentType::className(),['id'=>'id_payment_type']);
    }
    public function getMembershipType()
    {
      return $this->hasOne(MembershipType::className(),['id'=>'id_membership_type']);
    }

}
