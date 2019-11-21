<?php

namespace backend\models;

use Yii;

class QuotationTemplate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quotation_template';
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
                'uploadPath' => '@backend/web/backend/uploads/quotation_template', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
    }

    public function rules()
    {
        return [
            [['description', 'inclusive_benefit', 'plan_detail'], 'string'],
            [['status', 'updated_by', 'created_by'], 'integer'],
            [['updated_date', 'created_date'], 'safe'],
            [['main_logo', 'name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'main_logo' => 'Main Logo',
            'name' => 'Name',
            'description' => 'Description',
            'inclusive_benefit' => 'Inclusive Benefit',
            'status' => 'Status',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
        ];
    }
}
