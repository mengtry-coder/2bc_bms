<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sop_goal_setup_data".
 *
 * @property int $id
 * @property int $id_sop_set_up
 * @property int $id_month
 * @property string $daily
 * @property string $weekly
 * @property string $monthly
 */
class SopGoalSetupData extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sop_goal_setup_data';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_sop_set_up', 'id_month', 'actual_id_month', 'actual_monthly'], 'integer'],
            [['daily', 'weekly', 'monthly'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_sop_set_up' => 'Id Sop Set Up',
            'id_month' => 'Id Month',
            'daily' => 'Daily',
            'weekly' => 'Weekly',
            'monthly' => 'Monthly',
        ];
    }
    public function getMonthList()
    {
        return $this->hasOne(MonthList::className(),['id'=>'id_month']);
    }
}
