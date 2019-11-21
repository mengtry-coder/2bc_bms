<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\FinanceChartOfAccount;

/**
 * FinanceChartOfAccountSearch represents the model behind the search form about `backend\models\FinanceChartOfAccount`.
 */
class FinanceChartOfAccountSearch extends FinanceChartOfAccount
{
    /**
     * @inheritdoc
     */
    public $date_range, $from_date, $to_date, $type, $customer,$status;
    public function rules()
    {
        return [
            // [['date_range'],'required'],
            [['id', 'account_type', 'chart_of_account'], 'integer'],
            [['date', 'transaction_type', 'doc_id', 'name', 'name_type', 'description', 'from_date', 'to_date','date_range'], 'safe'],
            [['debit', 'credit', 'balance'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = FinanceChartOfAccount::find();
        // ->where('(debit = 0 OR credit = 0)');

        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'date' => SORT_ASC,
                    'id' => SORT_ASC,
                    // 'date' => SORT_DESC,
                    // 'id' => SORT_DESC,
                ]
            ],
            'pagination' => [ 'pageSize' => $page_size ],

        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }
        if( 
            empty($this->date_range) && 
            empty($this->from_date) && 
            empty($this->to_date)
            
        ){
            $query->where(['finance_chart_of_account.id'=>0]);
        }

        $from_date ='';
        $to_date = '';
        if(!empty($this->date_range)){

            $day = date('w');
            $week_start = date('Y-m-d', strtotime('-'. (5-$day).' days'));
            $week_end = date('Y-m-d', strtotime('+'.(7-$day).' days'));

            $day = date('Y-m-d');
            $month_start = date('Y-m-01');
            $month_end = date("Y-m-t", strtotime($day));

            $year_start = date('Y-m-d', strtotime('01/01'));
            $year_end = date('Y-m-d', strtotime('12/31'));

            if($this->date_range == 'today'){
                $from_date = date('Y-m-d');
                $to_date = date('Y-m-d', strtotime(date('Y-m-d') . ' +1 day'));
            }
            else if ($this->date_range == 'week'){
                $from_date = $week_start;
                $to_date = $week_end;
            }
            else if ($this->date_range == 'month'){
                $from_date = $month_start;
                $to_date = $month_end;
            }
            else if ($this->date_range == 'year'){
                $from_date = $year_start;
                $to_date = $year_end;
            }
        }
        $query->andFilterWhere(['between', 'date', $this->from_date,$this->to_date])
            ->andFilterWhere(['like', 'transaction_type', $this->transaction_type])
            ->andFilterWhere(['like', 'doc_id', $this->doc_id])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['=', 'account_type', $this->account_type])
            ->andFilterWhere(['=', 'chart_of_account', $this->chart_of_account]);

        return $dataProvider;
    }
}
