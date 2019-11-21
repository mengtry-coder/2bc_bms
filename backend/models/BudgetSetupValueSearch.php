<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\BudgetSetupValue;

/**
 * BudgetSetupValueSearch represents the model behind the search form of `backend\models\BudgetSetupValue`.
 */
class BudgetSetupValueSearch extends BudgetSetupValue
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_budget_set_up', 'created_by', 'updated_by'], 'integer'],
            [['for_month', 'created_date', 'updated_date'], 'safe'],
            [['daily_budget', 'weekly_budget', 'monthly_budget'], 'number'],
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
        $query = BudgetSetupValue::find();

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
            'id_budget_set_up' => $this->id_budget_set_up,
            'daily_budget' => $this->daily_budget,
            'weekly_budget' => $this->weekly_budget,
            'monthly_budget' => $this->monthly_budget,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
        ]);

        $query->andFilterWhere(['like', 'for_month', $this->for_month]);

        return $dataProvider;
    }
}
