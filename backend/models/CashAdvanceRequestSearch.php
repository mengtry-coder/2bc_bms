<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CashAdvanceRequest;

/**
 * CashAdvanceRequestSearch represents the model behind the search form of `backend\models\CashAdvanceRequest`.
 */
class CashAdvanceRequestSearch extends CashAdvanceRequest
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_employee', 'id_pay_type', 'approved_by', 'status', 'created_by', 'updated_by'], 'integer'],
            [['date', 'amount_in_word', 'reason', 'created_date', 'updated_date'], 'safe'],
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
        $query = CashAdvanceRequest::find();

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
            'id_employee' => $this->id_employee,
            'amount' => $this->amount,
            'id_pay_type' => $this->id_pay_type,
            'approved_by' => $this->approved_by,
            'status' => $this->status,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
        ]);

        $query->andFilterWhere(['like', 'amount_in_word', $this->amount_in_word])
            ->andFilterWhere(['like', 'reason', $this->reason]);

        return $dataProvider;
    }
}
