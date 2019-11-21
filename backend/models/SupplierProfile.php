<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "supplier_profile".
 *
 * @property int $id
 * @property string $supplier_name
 * @property string $company_name
 * @property string $phone_number
 * @property string $email
 * @property string $address
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property string $updated_date
 * @property int $updated_by
 * @property string $img_url
 */
class SupplierProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'supplier_profile';
    }

    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/supplier-profile', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['supplier_name', 'company_name', 'phone_number', 'id_supplier_profile_type', 'id_city'], 'required'],
            [['status', 'created_by', 'updated_by', 'id_supplier_profile_type', 'id_city'], 'integer'],
            [['created_date', 'updated_date', 'file'], 'safe'],
            [['supplier_name', 'company_name', 'address'], 'string', 'max' => 250],
            [['phone_number', 'email'], 'string', 'max' => 50],
            [['email'], 'email'],
            [['img_url'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_city' => 'City',
            'supplier_name' => 'Supplier Name',
            'id_supplier_profile_type' => 'Type',
            'company_name' => 'Company Name',
            'phone_number' => 'Phone Number',
            'email' => 'Email',
            'address' => 'Address',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'img_url' => 'Img Url',
        ];
    }

    public function getSupplierProfileType()
    {
        return $this->hasOne(SupplierProfileType::className(),['id'=>'id_supplier_profile_type']);
    }
}
