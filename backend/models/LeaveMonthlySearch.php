<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\LeaveMonthly;

/**
 * LeaveMonthlySearch represents the model behind the search form of `backend\models\LeaveMonthly`.
 */
class LeaveMonthlySearch extends LeaveMonthly
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_employee', 'id_month', 'id_year', 'status', 'updated_by', 'created_by'], 'integer'],
            [['updated_date', 'created_date'], 'safe'],
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
        $query = LeaveMonthly::find();

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

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_employee' => $this->id_employee,
            'id_month' => $this->id_month,
            'id_year' => $this->id_year,
            'status' => $this->status,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
        ]);

        return $dataProvider;
    }
}