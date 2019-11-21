<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "supplier_profile_tag".
 *
 * @property int $id
 * @property int $id_supplier
 * @property int $id_tag
 */
class SupplierProfileTag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'supplier_profile_tag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_supplier'], 'integer'],
            [['id_tag'],'string', 'max'=>50]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_supplier' => 'Id Supplier',
            'id_tag' => 'Id Tag',
        ];
    }
}
