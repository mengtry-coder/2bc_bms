<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "expense_data".
 *
 * @property int $id
 * @property int $id_expense
 * @property int $chart_of_account
 * @property string $description
 * @property string $amount
 * @property int $status
 */
class ExpenseData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'expense_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_expense', 'chart_of_account', 'status'], 'integer'],
            [['amount'], 'number'],
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
            'id_expense' => 'Id Expense',
            'chart_of_account' => 'Chart Of Account',
            'description' => 'Description',
            'amount' => 'Amount',
            'status' => 'Status',
        ];
    }

    public function getChartOfAccount()
    {
        return $this->hasOne(ChartAccount::className(),['id'=>'chart_of_account']);
    }
}
