<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "proposal_note".
 *
 * @property int $id
 * @property int $id_proposal
 * @property int $id_user
 * @property string $note
 */
class ProposalNote extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'proposal_note';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_proposal', 'id_user'], 'integer'],
            [['note'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_proposal' => 'Id Proposal',
            'id_user' => 'Id User',
            'note' => 'Note',
        ];
    }
}
