<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "employee_profile".
 *
 * @property int $id
 * @property string $id_prefix
 * @property string $first_name
 * @property string $last_name
 * @property string $join_date
 * @property string $date_of_birth
 * @property string $place_of_birth
 * @property string $sex
 * @property int $nationality
 * @property string $address
 * @property int $id_country
 * @property int $id_city
 * @property string $marital_status
 * @property string $phone_number
 * @property int $id_department
 * @property string $email
 * @property int $id_position
 * @property string $username
 * @property string $password
 * @property string $confirm_password
 * @property string $description
 * @property string $created_date
 * @property int $created_by
 * @property string $updated_date
 * @property int $updated_by
 * @property int $status
 * @property string $img_url
 * @property int $id_user_type
 * @property string $job_description
 * @property string $employee_code
 * @property string $employee_joint_date
 */
class EmployeeReport extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $shipping_to, $billing_to,$to_date,$date_range,$from_date,$globalSearch,$id_customer,$id_employee,$id_related_to;
    public static function tableName()
    {
        return 'employee_profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_prefix', 'first_name', 'last_name', 'nationality', 'address', 'username', 'password', 'confirm_password'], 'required'],
            [['join_date', 'date_of_birth', 'created_date', 'updated_date', 'employee_joint_date','from_date','to_date','id_employee','id_customer','id_related_to','date_range'], 'safe'],
            [['nationality', 'id_country', 'id_city', 'id_department', 'id_position', 'created_by', 'updated_by', 'status', 'id_user_type'], 'integer'],
            [['description', 'job_description'], 'string'],
            [['id_prefix'], 'string', 'max' => 50],
            [['first_name', 'last_name', 'place_of_birth', 'address', 'phone_number', 'email', 'username', 'password', 'confirm_password', 'img_url', 'employee_code'], 'string', 'max' => 255],
            [['sex'], 'string', 'max' => 8],
            [['marital_status'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_prefix' => 'Id Prefix',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'join_date' => 'Join Date',
            'date_of_birth' => 'Date Of Birth',
            'place_of_birth' => 'Place Of Birth',
            'sex' => 'Sex',
            'nationality' => 'Nationality',
            'address' => 'Address',
            'id_country' => 'Id Country',
            'id_city' => 'Id City',
            'marital_status' => 'Marital Status',
            'phone_number' => 'Phone Number',
            'id_department' => 'Id Department',
            'email' => 'Email',
            'id_position' => 'Id Position',
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
            'id_user_type' => 'Id User Type',
            'job_description' => 'Job Description',
            'employee_code' => 'Employee Code',
            'employee_joint_date' => 'Employee Joint Date',
        ];
    }
}
