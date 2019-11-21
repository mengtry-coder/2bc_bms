<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "standard_operation_member".
 *
 * @property int $id
 * @property int $id_standard_operation
 * @property int $id_position
 * @property int $id_employee
 */
class StandardOperationMember extends \yii\db\ActiveRecord
{ 
    public static function tableName()
    {
        return 'standard_operation_member';
    }
 
    public function rules()
    {
        return [
            [['id_standard_operation', 'id_position', 'id_employee'], 'integer'],
        ];
    }
 
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_standard_operation' => 'Id Standard Operation',
            'id_position' => 'Id Position',
            'id_employee' => 'Id Employee',
        ];
    }
}
