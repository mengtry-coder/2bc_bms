<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Bank;

/**
 * BankSearch represents the model behind the search form about `backend\models\Bank`.
 */
class BankSearch extends Bank
{
    /**
     * @inheritdoc
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id','account_type', 'default', 'updated_by'], 'integer'],
            [['bank_name','globalSearch', 'bank_address', 'account_name', 'account_number', 'remark', 'updated_date','status'], 'safe'],
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

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Bank::find();
        $query->joinWith(['accountType']);
        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [ 'pageSize' => $page_size ],
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
            'account_type' => $this->account_type,
            'default' => $this->default,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
            'status' => $this->status
        ]);

        $query->orFilterWhere(['like', 'bank.bank_address', $this->globalSearch])
            ->orFilterWhere(['like', 'bank.bank_name', $this->globalSearch])
            ->orFilterWhere(['like', 'bank_account_type.names', $this->globalSearch])
            ->orFilterWhere(['like', 'bank.account_name', $this->globalSearch])
            ->orFilterWhere(['like', 'bank.account_number', $this->globalSearch]);

        return $dataProvider;
    }
}
