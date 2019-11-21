<?php

namespace backend\models;

use Yii;


class AccountType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'account_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['names'], 'required'],
            [['updated_by','created_by'], 'integer'],
            [['updated_date','status','is_parent','detail_type','created_date'], 'safe'],
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
            'is_parent' => 'Sub Account of Type',
            'names' => 'Account Type',
            'updated_by' => 'Update By',
            'updated_date' => 'Update Date',
        ];
    }
       public function getParentAccount()
   {
       return $this->hasOne(AccountType::className(),['id'=>'is_parent']);
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
