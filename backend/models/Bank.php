<?php

namespace backend\models;

use Yii;

class Bank extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'bank';
    }

    public function rules()
    {
        return [
            [['bank_name', 'account_type', 'bank_address', 'account_name', 'account_number'], 'required'],
            [['account_type', 'default', 'updated_by'], 'integer'],
            [['remark'], 'string'],
            [['updated_date','status'], 'safe'],
          
            [['bank_address', 'account_name'], 'string', 'max' => 250],
            [['swift_code'], 'string', 'max' => 50],
            [['account_number'], 'string', 'max' => 200],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            
            'bank_name' => 'Bank Name',
            'account_type' => 'Account Type',
            'bank_address' => 'Address',
            'account_name' => 'Account Name',
            'account_number' => 'Account Number',
            'remark' => 'Remark',
            'default' => 'Default',
            'swift_code'=>'Swift Code',
            'updated_by' => 'Update By',
            'updated_date' => 'Update Date',
            'status' => 'Status'
        ];
    }
    public function getUserCreated()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }

    public function getUserUpdated()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            // format date to match Sql Server date
            if(empty($this->created_date)) {
                $this->created_date = date('Y-m-d H:i:s');
                $this->created_by = Yii::$app->user->getId();
                $this->updated_by = Yii::$app->user->getId();
                $this->updated_date = date('Y-m-d H:i:s');
            }
            return true;
        } else {
            return false;
        }
    }
  public function getAccountType()
  {
      return $this->hasOne(BankAccountType::className(),['id'=>'account_type']);
  }
}
