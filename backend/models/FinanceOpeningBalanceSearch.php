<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\FinanceOpeningBalance;

/**
 * FinanceOpeningBalanceSearch represents the model behind the search form of `backend\models\FinanceOpeningBalance`.
 */
class FinanceOpeningBalanceSearch extends FinanceOpeningBalance
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date; 
    public function rules()
    {
        return [
            [['id', 'id_chart_of_account', 'updated_by', 'status', 'created_by'], 'integer'],
            [['doc_id', 'date', 'description', 'updated_date', 'created_date', 'globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
            [['amount'], 'number'],
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
        $query = FinanceOpeningBalance::find();
        $query->joinWith('account');

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
        $query->orFilterWhere(['between', 'finance_opening_balance.date', $this->from_date, $this->to_date])
        ->andFilterWhere(['or', 
            ['like', 'finance_opening_balance.doc_id', $this->globalSearch],
            ['like', 'chart_account.names', $this->globalSearch]
        ]); 

        return $dataProvider;
    }
}
