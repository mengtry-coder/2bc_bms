<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CustomerInvoiceData;

/**
 * CustomerInvoiceDataSearch represents the model behind the search form of `backend\models\CustomerInvoiceData`.
 */
class CustomerInvoiceDataSearch extends CustomerInvoiceData
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_customer_invoice', 'qty'], 'integer'],
            [['item', 'description'], 'safe'],
            [['rate', 'amount'], 'number'],
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
        $query = CustomerInvoiceData::find();

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
            'id_customer_invoice' => $this->id_customer_invoice,
            'qty' => $this->qty,
            'rate' => $this->rate,
            'amount' => $this->amount,
        ]);

        $query->andFilterWhere(['like', 'item', $this->item])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
