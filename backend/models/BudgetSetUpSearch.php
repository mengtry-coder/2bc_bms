<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\BudgetSetUp;

/**
 * BudgetSetUpSearch represents the model behind the search form of `backend\models\BudgetSetUp`.
 */
class BudgetSetUpSearch extends BudgetSetUp
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'id_employee', 'year', 'status', 'created_by', 'updated_by'], 'integer'],
            [['budget_value', 'actual', 'under_or_over'], 'number'],
            [['created_date', 'updated_date', 'globalSearch'], 'safe'],
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
        $query = BudgetSetUp::find();
        $query->joinWith('employee');

        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'year' => SORT_ASC,
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

        if(Yii::$app->user->identity->user_type_id == 1){
            $query->andFilterWhere(['or',
                ['like', 'employee_profile.first_name', $this->globalSearch],
                ['like', 'employee_profile.last_name', $this->globalSearch],
                ['like', 'budget_set_up.year', $this->globalSearch],
            ]);
        }else{
            $query->andFilterWhere(['in', 'budget_set_up.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['or',
                ['like', 'employee_profile.first_name', $this->globalSearch],
                ['like', 'employee_profile.last_name', $this->globalSearch],
                ['like', 'budget_set_up.year', $this->globalSearch],
            ]);
        }


        return $dataProvider;
    }
}
