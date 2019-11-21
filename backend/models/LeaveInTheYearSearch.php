<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\LeaveInTheYear;

/**
 * LeaveInTheYearSearch represents the model behind the search form of `backend\models\LeaveInTheYear`.
 */
class LeaveInTheYearSearch extends LeaveInTheYear
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_year_list', 'status', 'created_by', 'updated_by'], 'integer'],
            [['name', 'created_date', 'updated_date'], 'safe'],
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
        $query = LeaveInTheYear::find();

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
            'id_year_list' => $this->id_year_list,
            'status' => $this->status,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
