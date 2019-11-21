<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "chart_account".
 *
 * @property integer $id
 * @property string $names
 * @property integer $updated_by
 * @property string $updated_date
 */
class ChartAccount extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'chart_account';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['names','id_account_type'], 'required'],
            [['updated_by','id_is_parent','id_account_type','is_parent','id_bank','number_code'], 'integer'],
            [['updated_date','status','created_by','created_date'], 'safe'],
            [['names'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_bank'=>'Bank',
            'id_account_type'=> 'Account Type',
            'names' => 'Chart of Account',
            'updated_by' => 'Update By',
            'updated_date' => 'Update Date',
            'id_is_parent' => 'Sub Account Type',
            'is_parent' => 'Is Sub Chart of Account'
        ];
    }
    public function getUserCreated()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }
        public function getBank()
    {
      return $this->hasOne(Bank::className(),['id'=>'id_bank']);
    }
    public function getUserUpdated()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }
    
    public function getParentAccountType()
    {
       return $this->hasOne(AccountType::className(),['id'=>'id_is_parent']);
    }
    
    public function getAccountType()
    {
       return $this->hasOne(AccountType::className(),['id'=>'id_account_type']);
    }
    public function getParentChartAccount()
    {
        return $this->hasOne(ChartAccount::className(),['id'=>'is_parent']);
    }

       public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            // format date to match Sql Server date
            if(empty($this->is_parent)) {
                $this->is_parent = 0;
                if(empty($this->created_date)) {
                $this->created_date = date('Y-m-d H:i:s');
                $this->created_by = Yii::$app->user->getId();
                $this->updated_by = Yii::$app->user->getId();
                $this->updated_date = date('Y-m-d H:i:s');
            }
            }
            return true;
        } else {
            return false;
        }
    }
}
