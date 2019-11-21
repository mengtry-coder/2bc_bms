<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "budget_set_up_data".
 *
 * @property int $id
 * @property int $id_budget_set_up
 * @property int $id_month
 * @property string $daily
 * @property string $weekly
 * @property string $monthly
 */
class BudgetSetUpData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'budget_set_up_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_budget_set_up', 'id_month'], 'integer'],
            [['daily', 'weekly', 'monthly','quarterly'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_budget_set_up' => 'Id Budget Set Up',
            'id_month' => 'Id Month',
            'daily' => 'Daily',
            'quarterly' => 'Quarterly',
            'weekly' => 'Weekly',
            'monthly' => 'Monthly',
        ];
    }

    public function getMonthList()
    {
        return $this->hasOne(MonthList::className(),['id'=>'id_month']);
    }
}
