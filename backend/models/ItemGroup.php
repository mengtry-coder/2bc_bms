<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "item_group".
 *
 * @property int $id
 * @property string $name
 */
class ItemGroup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_group';
    }

    /**
     * {@inheritdoc}
     */
    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'main_logo', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/quotation_template', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
    }
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name', 'main_logo', 'setup_label', 'full_name'], 'string', 'max' => 255],
            [['plan_detail', 'description', 'inclusive_benefit'], 'string'],
            [['status', 'order_by'], 'integer'],
            [['credit_arrangment', 'cancellation_agreement', 'confidentiality'], 'string'],
            [['name'], 'unique'],
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
        ];
    }
}
