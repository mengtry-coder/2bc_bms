<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SupplierProfileContact;

/**
 * SupplierProfileContactSearch represents the model behind the search form of `backend\models\SupplierProfileContact`.
 */
class SupplierProfileContactSearch extends SupplierProfileContact
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'supplier_id', 'gender_id', 'position_id', 'department_id', 'status', 'created_by', 'updated_by'], 'integer'],
            [['prefix', 'name', 'date_of_birth', 'mobile', 'credit_note', 'email', 'description', 'created_date', 'updated_date', 'globalSearch'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SupplierProfileContact::find();
        $query->joinWith(['position', 'department']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $main_table = SupplierProfile::findOne(['id'=>Yii::$app->request->get('id')]);

        $query
        ->orFilterWhere(
            [
                'and',
                ['like', 'supplier_position.name', $this->globalSearch],
                ['supplier_id'=> $main_table->id]
            ]
        )
        ->orFilterWhere(
            [
                'and',
                ['like', 'supplier_department.name', $this->globalSearch],
                ['supplier_id'=> $main_table->id]
            ]
        )
        ->orFilterWhere(
            [
                'and',
                ['like', 'supplier_profile_contact.name', $this->globalSearch],
                ['supplier_id'=> $main_table->id]
            ]
        )
        ->orFilterWhere(
            [
                'and',
                ['like', 'supplier_profile_contact.email', $this->globalSearch],
                ['supplier_id'=> $main_table->id]
            ]
        )
        ->orFilterWhere(
            [
                'and',
                ['like', 'supplier_profile_contact.mobile', $this->globalSearch],
                ['supplier_id'=> $main_table->id]
            ]
        );

        return $dataProvider;
    }
}
