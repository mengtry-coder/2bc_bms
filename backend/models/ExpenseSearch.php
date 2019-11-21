<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Expense;

/**
 * ExpenseSearch represents the model behind the search form of `backend\models\Expense`.
 */
class ExpenseSearch extends Expense
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date; 
    public function rules()
    {
        return [
            [['id', 'chart_of_account', 'id_payment_method', 'created_by', 'updated_by', 'status'], 'integer'],
            [['doc_id', 'date', 'id_related_profile', 'cheque_number', 'clearing_date', 'remark', 'created_date', 'updated_date', 'globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
            [['chart_of_account_amount', 'total_amount', 'paid_amount', 'balance_amount'], 'number'],
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
        $query = Expense::find();
        $query->joinWith(['relatedTo', 'supplierProfile', 'customerProfile', 'project']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'date' => SORT_DESC,
                ]
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        if(Yii::$app->controller->id == 'project'){
            // $query->orFilterWhere(['like', 'expense.doc_id', $this->globalSearch])
            //     ['like', 'expense.date', $this->globalSearch],
            //     ['like', 'expense_related_to.name', $this->globalSearch],
            //     ['like', 'supplier_profile.supplier_name', $this->globalSearch],
            //     ['like', 'supplier_profile.company_name', $this->globalSearch],
            //     ['like', 'customer_profile.customer_name', $this->globalSearch],
            //     ['like', 'customer_profile.company_name', $this->globalSearch],
            //     ['like', 'project.project_name', $this->globalSearch],
            //     ['like', 'expense.remark', $this->globalSearch],
            //     ['=', 'project.id', $_GET['id_project']],
                // ========new fillter======

                $query->orFilterWhere(['between', 'date(expense.date)', $this->from_date, $this->to_date])
                ->andFilterWhere(['or', 
                    ['like', 'expense.doc_id', $this->globalSearch],
                    ['like', 'expense_related_to.name', $this->globalSearch],
                    ['like', 'supplier_profile.supplier_name', $this->globalSearch],
                    ['like', 'supplier_profile.company_name', $this->globalSearch],
                    ['like', 'customer_profile.customer_name', $this->globalSearch],
                    ['like', 'customer_profile.company_name', $this->globalSearch],
                    ['like', 'project.project_name', $this->globalSearch],
                    ['like', 'expense.remark', $this->globalSearch],
                    ['=', 'project.id', $_GET['id_project']],
                ]); 
        }else{
            // $query->orFilterWhere(['like', 'expense.doc_id', $this->globalSearch])
            //     ['like', 'expense.date', $this->globalSearch],
            //     ['like', 'expense_related_to.name', $this->globalSearch],
            //     ['like', 'supplier_profile.supplier_name', $this->globalSearch],
            //     ['like', 'supplier_profile.company_name', $this->globalSearch],
            //     ['like', 'customer_profile.customer_name', $this->globalSearch],
            //     ['like', 'customer_profile.company_name', $this->globalSearch],
            //     ['like', 'project.project_name', $this->globalSearch],
            //     ['like', 'expense.remark', $this->globalSearch],
       
        
        $query->orFilterWhere(['between', 'expense.date', $this->from_date, $this->to_date])
        ->andFilterWhere(['or', 
                ['like', 'expense.doc_id', $this->globalSearch],
                ['like', 'expense_related_to.name', $this->globalSearch],
                ['like', 'supplier_profile.supplier_name', $this->globalSearch],
                ['like', 'supplier_profile.company_name', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'project.project_name', $this->globalSearch],
                ['like', 'expense.remark', $this->globalSearch],
        ]); 
        }
        

        return $dataProvider;
    }
}
