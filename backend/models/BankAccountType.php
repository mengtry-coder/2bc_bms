<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "bank_account_type".
 *
 * @property integer $id
 * @property string $names
 */
class BankAccountType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bank_account_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['names'], 'required'],
            [['names'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'names' => 'Names',
        ];
    }
}
