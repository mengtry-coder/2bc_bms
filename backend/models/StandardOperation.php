<?php

namespace backend\models;

use Yii;

class StandardOperation extends \yii\db\ActiveRecord
{
   
    public $by_related_to,$by_assigned,$priority,$id_emp_position;
    public static function tableName()
    {
        return 'standard_operation';
    }
 
    public function rules()
    { 
        return [
            [['id_employee_position','name','id_standard_operation_step','start_date'],'required'],
            [['id_employee_position', 'id_standard_operation_step', 'created_by', 'status','id_emp_position'], 'integer'],
            [['created_date', 'updated_date', 'updated_by','description','start_date','due_date','deadline','id_priority','id_related_to','id_related_profile','is_done','description','by_related_to','by_assigned','priority','id_task','task_status'], 'safe'],
            [['name'], 'string', 'max' => 255],
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
            'id_employee_position' => 'Employee Possition',
            'id_standard_operation_step' => 'Standard Operation Step',
            'created_date' => 'Created Date',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'updated_by' => 'Updated By',
            'status' => 'Status',
            'id_priority' => 'Priority',
            'id_related_to' => 'Related To',
            'id_related_profile' => 'Related To Profile',
        ];
    }
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(),['id'=>'created_by']);
    }
}
