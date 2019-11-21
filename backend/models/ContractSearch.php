<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Contract;

/**
 * ContractSearch represents the model behind the search form of `backend\models\Contract`.
 */
class ContractSearch extends Contract
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date, $date_type;
    public function rules()
    {
        return [
            [['id', 'id_customer', 'id_contract_type', 'status', 'updated_by', 'created_by'], 'integer'],
            [['subject', 'start_date', 'end_date', 'description', 'updated_date', 'created_date'], 'safe'],
            [['contract_value'], 'number'],
            [['globalSearch', 'date_range', 'date_type', 'from_date', 'to_date'], 'safe'],
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
        $query = Contract::find();
        $query->joinWith(['bank', 'customer','item', 'contractType']);

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

        if ($this->date_type == "created_date") {
            $date_type = 'date(contract.created_date)';
        }else {
            $date_type = $this->date_type;
        }

        if(Yii::$app->user->identity->user_type_id == 1){
            $query->orFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['or',
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'item.description', $this->globalSearch],
                ['like', 'contract_type.name', $this->globalSearch],
                ['like', 'bank.bank_name', $this->globalSearch],
                ['like', 'bank.account_number', $this->globalSearch],
                ['like', 'bank.account_name', $this->globalSearch],
            ]);
        }else{
            $query->orFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['in', 'contract.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['or',
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'item.description', $this->globalSearch],
                ['like', 'contract_type.name', $this->globalSearch],
                ['like', 'bank.bank_name', $this->globalSearch],
                ['like', 'bank.account_number', $this->globalSearch],
                ['like', 'bank.account_name', $this->globalSearch],
            ]);
        }

        return $dataProvider;
    }
}
