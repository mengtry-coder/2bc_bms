<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Payroll;

/**
 * PayrollSearch represents the model behind the search form of `backend\models\Payroll`.
 */
class PayrollSearch extends Payroll
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'chart_of_account', 'chart_of_account_option', 'status', 'updated_by', 'created_by'], 'integer'],
            [['doc_id', 'date', 'pay_for', 'amount_in_word', 'amount_in_word_option', 'updated_date', 'created_date'], 'safe'],
            [['amount', 'amount_option'], 'number'],
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
        $query = Payroll::find();

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
            'date' => $this->date,
            'chart_of_account' => $this->chart_of_account,
            'amount' => $this->amount,
            'chart_of_account_option' => $this->chart_of_account_option,
            'amount_option' => $this->amount_option,
            'status' => $this->status,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
        ]);

        $query->andFilterWhere(['like', 'doc_id', $this->doc_id])
            ->andFilterWhere(['like', 'pay_for', $this->pay_for])
            ->andFilterWhere(['like', 'amount_in_word', $this->amount_in_word])
            ->andFilterWhere(['like', 'amount_in_word_option', $this->amount_in_word_option]);

        return $dataProvider;
    }
}
