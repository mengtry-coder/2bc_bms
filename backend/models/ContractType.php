<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "contract_type".
 *
 * @property int $id
 * @property string $name
 * @property string $note
 * @property int $created_by
 * @property string $created_date
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 * @property string $contract_description
 */
class ContractType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'contract_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['created_by', 'updated_by', 'status'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
            [['contract_description'], 'string'],
            [['name'], 'string', 'max' => 100],
            [['note'], 'string', 'max' => 250],
            [['credit_arrangment', 'cancellation_agreement', 'confidentiality'], 'string'],
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
            'id' => 'ID',
            'name' => 'Contract Name',
            'note' => 'Note',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'contract_description' => 'Contract Description',
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
