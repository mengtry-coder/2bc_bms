<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SopGoalSetup;

/**
 * SopGoalSetupSearch represents the model behind the search form of `backend\models\SopGoalSetup`.
 */
class SopGoalSetupSearch extends SopGoalSetup
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;   
    public function rules()
    {
        return [
            [['id', 'id_position', 'id_employee', 'id_sop_step', 'id_sop_step_list', 'quarter_1', 'quarter_2', 'quarter_3', 'quarter_4', 'status', 'created_by', 'updated_by'], 'integer'],
            [['note', 'created_date', 'updated_date','globalSearch'], 'safe'],
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
        $query = SopGoalSetup::find();
        $query->joinWith(['position','employee','sopStep','sopStepList']);

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
        // $query->andFilterWhere([
        //     'id' => $this->id,
        //     'id_position' => $this->id_position,
        //     'id_employee' => $this->id_employee,
        //     'id_sop_step' => $this->id_sop_step,
        //     'id_sop_step_list' => $this->id_sop_step_list,
        //     'quarter_1' => $this->quarter_1,
        //     'quarter_2' => $this->quarter_2,
        //     'quarter_3' => $this->quarter_3,
        //     'quarter_4' => $this->quarter_4,
        //     'status' => $this->status,
        //     'created_by' => $this->created_by,
        //     'created_date' => $this->created_date,
        //     'updated_by' => $this->updated_by,
        //     'updated_date' => $this->updated_date,
        // ]);

        // $query->andFilterWhere(['like', 'note', $this->note]);

        $query->andFilterWhere(['or', 
        // ['like', 'employee_position.name', $this->globalSearch],
        ['like', 'id_year', $this->globalSearch],
        ['like', 'employee_position.position_type', $this->globalSearch], 
        ['like', 'employee_profile.first_name', $this->globalSearch], 
        ['like', 'employee_profile.last_name', $this->globalSearch], 
        ['like', 'standard_operation_step.name', $this->globalSearch], 
        ['like', 'standard_operation_step_list.name', $this->globalSearch], 
    ]);  

        return $dataProvider;
    }
}
