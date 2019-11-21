<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sop_set_up_assign_position".
 *
 * @property int $id
 * @property int $sop_set_up_id
 * @property int $id_position
 */
class SopSetUpAssignPosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sop_set_up_assign_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sop_set_up_id', 'id_position'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sop_set_up_id' => 'Sop Set Up ID',
            'id_position' => 'Id Position',
        ];
    }


    public function getPositionName()
    {
        return $this->hasOne(EmployeePosition::className(),['id'=>'id_position']);
    }
}
