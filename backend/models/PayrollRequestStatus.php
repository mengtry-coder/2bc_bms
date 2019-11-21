<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "payroll_request_status".
 *
 * @property int $id
 * @property string $name
 * @property string $css_class
 * @property int $status
 */
class PayrollRequestStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payroll_request_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['status'], 'integer'],
            [['name', 'css_class'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'css_class' => 'Css Class',
            'status' => 'Status',
        ];
    }
}
