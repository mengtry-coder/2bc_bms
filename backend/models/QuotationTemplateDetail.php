<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "quotation_template_detail".
 *
 * @property int $id
 * @property int $id_quotation_template
 * @property string $title
 * @property string $description
 */
class QuotationTemplateDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation_template_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_quotation_template'], 'integer'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 255],
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
            'title' => 'Title',
            'description' => 'Description',
        ];
    }
}
