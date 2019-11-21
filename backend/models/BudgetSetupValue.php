<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "budget_setup_value".
 *
 * @property int $id
 * @property int $id_budget_set_up
 * @property string $for_month
 * @property string $daily_budget
 * @property string $weekly_budget
 * @property string $monthly_budget
 * @property int $created_by
 * @property string $created_date
 * @property int $updated_by
 * @property string $updated_date
 */
class BudgetSetupValue extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'budget_setup_value';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_budget_set_up', 'created_by', 'updated_by','status'], 'integer'],
            [['daily_budget', 'weekly_budget', 'monthly_budget'], 'number'],
            [['created_date', 'updated_date'], 'safe'],
            [['for_month'], 'string', 'max' => 255],
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
            'for_month' => 'For Month',
            'daily_budget' => 'Daily Budget',
            'weekly_budget' => 'Weekly Budget',
            'monthly_budget' => 'Monthly Budget',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
        ];
    }
}
