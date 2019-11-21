<?php

namespace backend\models;
use Yii;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Proposal;

/**
 * ProposalSearch represents the model behind the search form of `backend\models\Proposal`.
 */
class ProposalSearch extends Proposal
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date, $date_type;
    public function rules()
    {
        return [
            [['id', 'related_id', 'currency', 'discount_type', 'allow_comment', 'status', 'assigned', 'city', 'country'], 'integer'],
            [['name', 'date', 'open_till', 'to', 'address', 'zip_code', 'email', 'phone', 'globalSearch', 'date_range', 'from_date', 'to_date','date_type'], 'safe'],
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
        $query = Proposal::find();
        $query->joinWith(['customer']);
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
                ['like', 'proposal.code', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'proposal.total', $this->globalSearch]
            ]);
        }else{
            $query->orFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['in', 'proposal.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['or',
                ['like', 'proposal.code', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'proposal.total', $this->globalSearch]
            ]);
        }


        return $dataProvider;
    }
}
