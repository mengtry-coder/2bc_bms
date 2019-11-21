<?php

namespace backend\models;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CustomerPayment;

/**
 * CustomerPaymentSearch represents the model behind the search form of `backend\models\CustomerPayment`.
 */
class CustomerPaymentSearch extends CustomerPayment
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date; 
    public function rules()
    {
        return [
            [['id', 'id_customer_invoice', 'id_payment_method', 'status', 'updated_by', 'created_by'], 'integer'],
            [['doc_id', 'date', 'cheque_number', 'clearing_date', 'note', 'updated_date', 'created_date', 'globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
            [['receive_amount'], 'number'],
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
        $query = CustomerPayment::find();
        $query->joinWith(['customerInvoice']);
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

        // $query->andFilterWhere(['like', 'doc_id', $this->doc_id])
        //     ->andFilterWhere(['like', 'cheque_number', $this->cheque_number])
        //     ->andFilterWhere(['like', 'note', $this->note]);


            $query->orFilterWhere(['between', 'customer_payment.created_date', $this->from_date, $this->to_date])
            ->andFilterWhere(['or', 
                ['like', 'customer_payment.doc_id', $this->globalSearch],
                ['like', 'customer_payment.cheque_number', $this->globalSearch],
                ['like', 'customer_invoice.doc_id', $this->globalSearch],
                ['like', 'customer_payment.note', $this->globalSearch]
            ]);

        return $dataProvider;
    }
}
