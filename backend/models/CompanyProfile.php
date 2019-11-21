<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "company_profile".
 *
 * @property int $id
 * @property string $logo
 * @property string $names
 * @property string $email
 * @property string $tel
 * @property string $website
 * @property string $address
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 * @property string $vattin
 */
class CompanyProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'company_profile';
    }

    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'logo', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/company-profile', // saved directory. default to '@runtime/upload'
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
            [['names', 'email', 'tel', 'website'], 'required'],
            [['email'], 'email'],
            [['description','what_we_do','bill_and_payment', 'quotation_term_and_condition'], 'string'],
            [['created_date', 'updated_date'], 'safe'],
            [['created_by', 'updated_by', 'status'], 'integer'],
            [['logo', 'names', 'address'], 'string', 'max' => 255],
            [['mission', 'vision'], 'string', 'max' => 500],
            [['tel', 'website', 'mailing_address'], 'string', 'max' => 100],
            [['vattin'], 'string', 'max' => 50],
            [['credit_arrangment', 'cancellation_agreement', 'confidentiality'], 'string'],

            [['info_invoice', 'info_payment', 'info_expense', 'info_bill', 'info_pay_bill', 'info_opening_balance', 'info_journal_entry'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'logo' => 'Logo',
            'names' => 'Comapny Name',
            'email' => 'Email',
            'tel' => 'Tel',
            'website' => 'Website',
            'address' => 'Address',
            'description' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'vattin' => 'VATTIN',
        ];
    }
}
