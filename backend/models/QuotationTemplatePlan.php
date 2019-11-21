<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "quotation_template_plan".
 *
 * @property int $id
 * @property int $id_quotation_template
 * @property string $plan_title
 * @property string $plan_description
 * @property string $plan_fee
 */
class QuotationTemplatePlan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation_template_plan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_quotation_template', 'status'], 'integer'],
            [['plan_fee', 'setup_fee'], 'number'],
            [['plan_title'], 'string', 'max' => 100],
            [['plan_description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_quotation_template' => 'Id Quotation Template',
            'plan_title' => 'Plan Title',
            'plan_description' => 'Plan Description',
            'plan_fee' => 'Plan Fee',
        ];
    }
}
