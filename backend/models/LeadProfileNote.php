<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "lead_profile_note".
 *
 * @property int $id
 * @property string $note
 * @property string $created_date
 * @property int $updated_by
 * @property int $created_by
 * @property string $updated_date
 * @property int $status
 * @property int $id_lead_profile
 */
class LeadProfileNote extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lead_profile_note';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_date', 'updated_date'], 'safe'],
            [['updated_by', 'created_by', 'status', 'id_lead_profile'], 'integer'],
            [['note'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'note' => 'Note',
            'created_date' => 'Created Date',
            'updated_by' => 'Updated By',
            'created_by' => 'Created By',
            'updated_date' => 'Updated Date',
            'status' => 'Status',
            'id_lead_profile' => 'Id Lead Profile',
        ];
    }
}
