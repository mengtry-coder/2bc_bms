<?php

namespace backend\models;

use Yii;

class Expense extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'expense';
    }

    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/expense-attachment', // saved directory. default to '@runtime/upload'
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
            [['date', 'chart_of_account', 'id_related_profile', 'id_related_to', 'updated_date'], 'required'],
            [['date', 'clearing_date', 'created_date', 'updated_date', 'img_url'], 'safe'],
            [['chart_of_account', 'id_payment_method', 'created_by', 'updated_by', 'status', 'id_related_profile', 'id_related_to', 'type_id'], 'integer'],
            [['chart_of_account_amount', 'total_amount', 'paid_amount', 'balance_amount'], 'number'],
            [['doc_id'], 'string', 'max' => 50],
            [['cheque_number'], 'string', 'max' => 10],
            [['remark'], 'string', 'max' => 255],
            [['cheque_number', 'clearing_date'], 'required', 'when' => function ($model) {
                return $model->id_payment_method == 3;
                }, 'whenClient' => "function (attribute, value) {
                    return $('#expense-id_payment_method').val() == 3;
                }"
            ],
            ['is_bill', 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'doc_id' => 'Doc ID',
            'date' => 'Date',
            'id_related_to' => 'Related To',
            'id_related_profile' => 'Name',
            'chart_of_account' => 'Account',
            'chart_of_account_amount' => 'Account Amount',
            'id_payment_method' => 'Payment Method',
            'cheque_number' => 'Cheque Number',
            'clearing_date' => 'Clearing Date',
            'total_amount' => 'Amount',
            'paid_amount' => 'Paid',
            'balance_amount' => 'Balance',
            'remark' => 'Remark',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
            'is_bill' => 'Type',
        ];
    }

    public function getRelatedTo()
    {
        return $this->hasOne(ExpenseRelatedTo::className(),['id'=>'id_related_to']);
    
    }

    public function getPaymentMethod()
    {
        return $this->hasOne(PaymentMethod::className(),['id'=>'id_payment_method']);
    }

    public function getExpenseProfile()
    {
        if($this->id_related_to == 1){
            return $this->hasOne(SupplierProfile::className(),['id'=>'id_related_profile']);
        }elseif($this->id_related_to == 2){
            return $this->hasOne(CustomerProfile::className(),['id'=>'id_related_profile']);
        }elseif($this->id_related_to == 3){
            return $this->hasOne(Project::className(),['id'=>'id_related_profile']);
        }
        
    }

    public function getExpenseStatus()
    {
        return $this->hasOne(InvoiceStatus::className(),['id'=>'status']);
    }

    public function getSupplierProfile()
    {
        return $this->hasOne(SupplierProfile::className(),['id'=>'id_related_profile']);
    }

    public function getCustomerProfile()
    {
        return $this->hasOne(CustomerProfile::className(),['id'=>'id_related_profile']);
    }

    public function getProject()
    {
        return $this->hasOne(Project::className(),['id'=>'id_related_profile']);
    }

}
