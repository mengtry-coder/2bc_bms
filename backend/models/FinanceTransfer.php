<?php

namespace backend\models;

use Yii;

class FinanceTransfer extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_transfer';
    }

    public function rules()
    {
        return [
            [['amount', 'from_account', 'to_account'], 'required'],
            [['from_account', 'to_account', 'updated_by', 'status', 'created_by'], 'integer'],
            [['date', 'updated_date', 'created_date'], 'safe'],
            [['amount'], 'number', 'min'=>0.01],
            [['doc_id'], 'string', 'max' => 50],
            [['description'], 'string', 'max' => 255],
            [['amount_in_word'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'doc_id' => 'Doc. ID',
            'from_account' => 'From',
            'to_account' => 'To',
            'date' => 'Date',
            'amount' => 'Amount',
            'amount_in_word' => 'In Word',
            'description' => 'Description',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }

    public function getFromAccount(){
        return $this->hasOne(ChartAccount::className(),['id'=>'from_account']);
    }

    public function getToAccount(){
        return $this->hasOne(ChartAccount::className(),['id'=>'to_account']);
    }
}
