<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "finance_opening_balance".
 *
 * @property int $id
 * @property string $doc_id
 * @property int $id_chart_of_account
 * @property string $date
 * @property string $amount
 * @property string $description
 * @property int $updated_by
 * @property string $updated_date
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 */
class FinanceOpeningBalance extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_opening_balance';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['amount', 'id_chart_of_account'], 'required'],
            [['id_chart_of_account', 'updated_by', 'status', 'created_by'], 'integer'],
            [['date', 'updated_date', 'created_date'], 'safe'],
            [['amount'], 'number'],
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
            'id_chart_of_account' => 'Account',
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

    public function getAccount(){
        return $this->hasOne(ChartAccount::className(),['id'=>'id_chart_of_account']);
    }
}
