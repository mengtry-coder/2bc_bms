<?php

namespace backend\models;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CustomerInvoice;

class CustomerInvoicePaymentSearch extends CustomerInvoice
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date;
    public function rules()
    {
        return [
            [['id', 'id_customer', 'id_payment_method', 'id_recurring_invoice', 'recurring_value', 'recurring_type', 'status', 'updated_by', 'created_by', 'currency', 'id_sale_agent', 'id_discount', 'id_tax', 'is_tax'], 'integer'],
            [['doc_id', 'date', 'due_date', 'admin_note', 'note', 'term_condition', 'updated_date', 'created_date', 'client_note', 'globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
            [['total_tax', 'total_amount', 'receive_amount', 'balance_amount', 'discount_value', 'discount_amount', 'tax_amount', 'sub_total'], 'number'],
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

    public function search($params)
    {
        $query = CustomerInvoice::find();
        $query->where(['>', 'receive_amount', 0]);
        $query->joinWith(['customer', 'project']);

        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'created_date' => SORT_DESC,
                ]
            ],
            'pagination' => [ 'pageSize' => $page_size ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->orFilterWhere(['between', 'customer_invoice.date', $this->from_date, $this->to_date])
            ->andFilterWhere(['or', 
                ['like', 'customer_invoice.doc_id', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'project.project_name', $this->globalSearch]
            ]);

        return $dataProvider;
    }
}
