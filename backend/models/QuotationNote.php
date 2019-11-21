<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "quotation_note".
 *
 * @property int $id
 * @property int $id_quotation
 * @property int $id_user
 * @property string $note
 */
class QuotationNote extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation_note';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_quotation', 'id_user'], 'integer'],
            [['note'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_quotation' => 'Id Quotation',
            'id_user' => 'Id User',
            'note' => 'Note',
        ];
    }
}
