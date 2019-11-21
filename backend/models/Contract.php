<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "contract".
 *
 * @property int $id
 * @property int $id_customer
 * @property string $subject
 * @property string $contract_value
 * @property int $id_contract_type
 * @property string $start_date
 * @property string $end_date
 * @property string $description
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class Contract extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'contract';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_customer','id_contract_type', 'id_bank'], 'required'],
            [['id_customer', 'id_contract_type', 'status', 'updated_by', 'created_by'], 'integer'],
            [['contract_value'], 'number'],
            [['description','start_date', 'end_date', 'updated_date', 'created_date'], 'safe'],
            [['subject','signature', 'doc_id'], 'string', 'max' => 255],
            [['credit_arrangment', 'cancellation_agreement', 'confidentiality'], 'string'],

            [['id_discount', 'id_tax', 'is_tax'], 'integer'],
            [['discount_value', 'discount_amount', 'tax_amount', 'sub_total', 'total_amount'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'credit_arrangment' => 'CREDIT ARRANGEMENTS and PAYMENT', 
            'cancellation_agreement' => 'CANCELLATION / TERMINATION CONTRACT AGREEMENT',
            'confidentiality' => 'CONFIDENTIALITY',
            'discount_type' => 'Disc. Type',
            'id_item' => 'Item',
            'id_bank' => 'Bank',
            'id' => 'ID',
            'id_customer' => 'Customer',
            'subject' => 'Subject',
            'contract_value' => 'Contract Value',
            'id_contract_type' => 'Contract Type',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'description' => 'Description',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getItem()
    {
        return $this->hasOne(Item::className(),['id'=>'id_item']);
    } 

    public function getBank()
    {
        return $this->hasOne(Bank::className(),['id'=>'id_bank']);
    } 

    public function getContractType()
    {
        return $this->hasOne(ItemGroup::className(),['id'=>'id_contract_type']);
    }

    public function getCustomer()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_customer']);
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
