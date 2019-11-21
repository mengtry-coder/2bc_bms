<?php

namespace backend\models;

use Yii;  
/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property int $user_type_id
 * @property string $email
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $auth_key
 * @property int $status
 * @property int $created_by
 * @property string $created_date
 * @property string $updated_date
 * @property int $updated_by
 * @property int $is_deleted
 * @property string $deleted_at
 * @property int $deleted_by
 * @property string $first_name
 * @property string $last_name
 * @property int $gender
 * @property string $telephone
 * @property string $img_url
 * @property string $username
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

    public static function tableName()
    {
        return 'user';
    }
    public $password,$confirm_password;
    /**
     * {@inheritdoc}
     */
    public function behaviors(){
        return [
            [
                'class' => 'mdm\upload\UploadBehavior',
                'attribute' => 'file', // required, use to receive input file
                'savedAttribute' => 'img_url', // optional, use to link model with saved file.
                'uploadPath' => 'backend/uploads/users',
                // 'uploadPath' => 'backend/uploads/users', // saved directory. default to '@runtime/upload'
                'autoSave' => true, // when true then uploaded file will be save before ActiveRecord::save()
                'autoDelete' => true, // when true then uploaded file will deleted before ActiveRecord::delete()
            ],
        ];
     }

    public function rules()
    {
        return [
            [['username', 'id_employee', 'user_type_id'],'required'],
            [['password'], 'required', 'on' => 'create'],
            [['user_type_id', 'status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by','membership_id', 'img_url', 'id_employee'], 'integer'],
            [['created_date', 'updated_date', 'deleted_at'], 'safe'],
            [['email', 'password_hash', 'password_reset_token', 'auth_key'], 'string', 'max' => 500],
            [['first_name', 'last_name', 'telephone', 'username', 'gender'], 'string', 'max' => 50],
            [['username'], 'unique'],
            ['confirm_password', 'compare', 'compareAttribute' => 'password', 'message'=>"Passwords don't match."],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_type_id' => 'User Type',
            'email' => 'Email',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'auth_key' => 'Auth Key',
            'status' => 'Status',
            'created_by' => 'Created By',
            'created_date' => 'Created Date',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'is_deleted' => 'Is Deleted',
            'deleted_at' => 'Deleted At',
            'deleted_by' => 'Deleted By',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'gender' => 'Gender',
            'telephone' => 'Telephone',
            'img_url' => 'Img Url',
            'username' => 'Username',
            'id_employee' => 'Employee',
            'user_type_id' => 'User Type'
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }

    public function getUpdatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'updated_by']);
    }
    public function getCreatedBy()
    {
      return $this->hasOne(User::className(),['id'=>'created_by']);
    }
    public function getUserType()
    {
      return $this->hasOne(UserType::className(),['id'=>'user_type_id']);
    }

    public function getEmployee()
    {
      return $this->hasOne(EmployeeProfile::className(),['id'=>'id_employee']);
    }


    public static function getUserPermission($controller_id){
        $user_id = Yii::$app->user->getId();
        $user = User::findOne($user_id); 
        if($user){
            $user_type_id = $user->user_type_id;

            $sql = "SELECT
                        -- b.extra_action ,
                        c.extra_action,
                        c.contoller
                    FROM permission_action AS a
                    -- INNER JOIN permission_action_data AS b ON a.id = b.id_permission_action
                    LEFT JOIN permission_menu AS c ON a.permission_menu_id = c.id
                    WHERE a.user_type_id = :user_type_id
                    AND c.contoller = :controller_id
                    ";

            // $command =  Yii::$app->getDb()->createCommand("select a.action, a.extra_action from tbl_permission a where a.id in (select b.permission_id from tbl_user_type_permission b where b.user_type_id = :user_type_id) and a.controller = :controller_id");
            $command = Yii::$app->db->createCommand($sql);
            $command->bindParam(":user_type_id", $user_type_id);
            $command->bindParam(":controller_id", $controller_id);
            $list = $command->queryAll();

            $array = array('login', 'error', 'logout','form-view', 'validation','depend','dependent', 'dependend', 'pdf','remove-file');
            foreach ($list as $row)
            {
                // array_push($array,$row["extra_action"]);
                $extra_actions = explode(",", $row["extra_action"]);
                foreach ($extra_actions as $ex){
                    array_push($array,$ex);
                } 
            }
     
            return $array;
        } else {
            return  array('login');

        }
    }

}
