<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "proposal_status".
 *
 * @property int $id
 * @property string $name
 * @property string $css_class
 */
class ProposalStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'proposal_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 255],
            [['css_class'], 'string', 'max' => 50],
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
            'css_class' => 'Css Class',
        ];
    }
}
