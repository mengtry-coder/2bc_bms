<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "finance_chart_of_account".
 *
 * @property int $id
 * @property string $date
 * @property string $transaction_type 1 salary, 2 commission, 3 allowance, 4 bonus, 5 insurrance
 * @property string $doc_id
 * @property string $name
 * @property string $name_type
 * @property string $description
 * @property string $debit
 * @property string $credit
 * @property string $balance
 * @property int $account_type
 * @property int $chart_of_account
 * @property string $ending_balance
 * @property string $created_date
 * @property int $created_by
 * @property int $status
 * @property string $updated_date
 * @property int $updated_by
 */
class FinanceChartOfAccount extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_chart_of_account';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['date', 'created_date', 'updated_date', 'name'], 'safe'],
            [['debit', 'credit', 'balance'], 'number'],
            [['account_type', 'chart_of_account', 'created_by', 'status', 'updated_by'], 'integer'],
            [['transaction_type'], 'string', 'max' => 100],
            [['doc_id', 'name_type'], 'string', 'max' => 50],
            [['description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Date',
            'transaction_type' => 'Type',
            'doc_id' => 'Doc ID',
            'name' => 'Name',
            'name_type' => 'Name Type',
            'description' => 'Description',
            'debit' => 'Debit',
            'credit' => 'Credit',
            'balance' => 'Balance',
            'account_type' => 'Account Type',
            'chart_of_account' => 'Chart Of Account',
            'ending_balance' => 'Ending Balance',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'status' => 'Status',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
        ];
    }

    public function getTransactionType()
    {
        return $this->hasOne(BenefitType::className(),['id'=>'transaction_type']);
    }

    public function getChartOfAccount()
    {
        return $this->hasOne(ChartAccount::className(),['id'=>'chart_of_account']);
    }

    public function getAccountType()
    {
        return $this->hasOne(AccountType::className(),['id'=>'account_type']);
    }

    public function getUserCreated()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }

    public function getUserUpdated()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }

}
