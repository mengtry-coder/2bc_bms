<?php

namespace backend\models;

use Yii;

class EmployeeProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    // public $signature_url;
    public static function tableName()
    {
        return 'employee_profile';
    }
    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/employee-profile', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'signature', // required, use to receive input file
                'savedAttribute' => 'signature_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/employee-profile', // saved directory. default to '@runtime/upload'
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
            [['id_prefix', 'first_name', 'last_name', 'id_department', 'id_position'], 'required'],
            [['date_of_birth','join_date', 'created_date', 'updated_date','employee_code','employee_joint_date','job_description'], 'safe'],
            [['nationality', 'id_country', 'id_city', 'created_by', 'updated_by', 'status', 'id_user_type','id_department', 'id_working_group'], 'integer'],
            [['id_prefix'], 'string', 'max' => 50],
            [['email'],'email'],
            [['basic_salary'], 'number'],
            // [['basic_salary'], 'default', 'value'=> 0],
            [['first_name', 'last_name', 'place_of_birth', 'address', 'phone_number', 'id_position', 'username', 'password', 'confirm_password', 'description', 'img_url','signature_url'], 'string', 'max' => 255],
            [['sex'], 'string', 'max' => 8],
            [['marital_status'], 'string', 'max' => 20],
            [['file', 'signature'], 'file', 'extensions' => 'png, jpg', 'maxSize' => 512000, 'tooBig' => 'Limit is 500KB', 'message'=>"File upload limit is 500KB."],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'join_date' => 'Joint Date',
            'id' => 'ID',
            'id_working_group' => 'Working Group',
            'id_user_type' => 'User Type',
            'id_department' => 'Department',
            'id_prefix' => 'Prefix',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'date_of_birth' => 'Date Of Birth',
            'place_of_birth' => 'Place Of Birth',
            'sex' => 'Sex',
            'nationality' => 'Nationality',
            'address' => 'Address',
            'id_country' => 'Country',
            'id_city' => 'City',
            'marital_status' => 'Marital Status',
            'phone_number' => 'Phone Number',
            'email' => 'Email',
            'id_position' => 'Position',
            'username' => 'Username',
            'password' => 'Password',
            'confirm_password' => 'Confirm Password',
            'description' => 'Description',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'img_url' => 'Img Url',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::className(),['id_employee'=>'id']);
    }

    public function getPosition()
    {
        return $this->hasOne(EmployeePosition::className(),['id'=>'id_position']);
    }
    public function getDepartment()
    {
        return $this->hasOne(Department::className(),['id'=>'id_department']);
    }
}
