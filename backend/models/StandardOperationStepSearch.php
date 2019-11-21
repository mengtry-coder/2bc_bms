<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\StandardOperationStep;

/**
 * StandardOperationStepSearch represents the model behind the search form of `backend\models\StandardOperationStep`.
 */
class StandardOperationStepSearch extends StandardOperationStep
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;   
    public function rules()
    {
        return [
            [['id', 'id_employee_position', 'created_by', 'status', 'sort'], 'integer'],
            [['name', 'created_date', 'updated_date', 'updated_by', 'css','globalSearch'], 'safe'],
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
        $query = StandardOperationStep::find();
        $query->joinWith(['possition']);

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
        //     'id_employee_position' => $this->id_employee_position,
        //     'created_date' => $this->created_date,
        //     'created_by' => $this->created_by,
        //     'updated_date' => $this->updated_date,
        //     'updated_by' => $this->updated_by,
        //     'status' => $this->status,
        //     'sort' => $this->sort,
        // ]);

        // $query->andFilterWhere(['like', 'name', $this->name])
        //     ->andFilterWhere(['like', 'css', $this->css]);

            $query->andFilterWhere(['or', 
            // ['like', 'employee_position.name', $this->globalSearch],
            ['like', 'standard_operation_step.name', $this->globalSearch],
            ['like', 'employee_position.position_type', $this->globalSearch], 
        ]);  

        return $dataProvider;
    }
}
