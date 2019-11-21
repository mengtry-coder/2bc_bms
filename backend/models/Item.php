<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item".
 *
 * @property int $id
 * @property string $description
 * @property string $long_description
 * @property string $rate
 * @property int $id_tax
 * @property int $id_group
 * @property int $unit
 * @property int $status
 * @property int $updated_by
 * @property string $updated_date
 * @property int $created_by
 * @property string $created_date
 */
class Item extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['rate', 'setup_fee'], 'number'],
            [['id_tax', 'id_group', 'unit', 'status', 'updated_by', 'created_by'], 'integer'],
            [['updated_date', 'created_date', 'long_description', 'short_description'], 'safe'],
            [['description', 'rate','id_group'], 'required'],
            [['description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'description' => 'Item Name',
            'long_description' => 'Long Description',
            'rate' => 'Rate - USD (Base Currency)',
            'id_tax' => 'Tax',
            'id_group' => 'Group',
            'unit' => 'Unit',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }
    public function getItemGroup()
    {
      return $this->hasOne(ItemGroup::className(),['id'=>'id_group']);
    }
}
