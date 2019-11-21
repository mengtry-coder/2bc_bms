<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "finance_journal_entry".
 *
 * @property int $id
 * @property string $doc_id
 * @property int $from_account
 * @property int $to_account
 * @property string $date
 * @property string $amount
 * @property string $amount_in_word
 * @property string $description
 * @property int $updated_by
 * @property string $updated_date
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 */
class FinanceJournalEntry extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_journal_entry';
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
            'amount' => 'Balance',
            'amount_in_word' => 'In Word',
            'description' => 'Memo',
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
