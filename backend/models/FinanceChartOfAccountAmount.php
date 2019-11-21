<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "finance_chart_of_account_amount".
 *
 * @property int $id
 * @property int $account_type
 * @property int $chart_of_account
 * @property string $ending_balance
 * @property string $name
 * @property string $name_type
 */
class FinanceChartOfAccountAmount extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'finance_chart_of_account_amount';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['account_type', 'chart_of_account'], 'integer'],
            [['ending_balance'], 'number'],
            [['name', 'name_type'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'account_type' => 'Account Type',
            'chart_of_account' => 'Chart Of Account',
            'ending_balance' => 'Ending Balance',
            'name' => 'Name',
            'name_type' => 'Name Type',
        ];
    }
}
