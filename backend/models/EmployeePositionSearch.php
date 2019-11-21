<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\EmployeePosition;

/**
 * EmployeePositionSearch represents the model behind the search form of `backend\models\EmployeePosition`.
 */
class EmployeePositionSearch extends EmployeePosition
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch; 
    public function rules()
    {
        return [
            [['id', 'created_by', 'updated_by', 'status'], 'integer'],
            [['position_type', 'description', 'created_date', 'updated_date','globalSearch'], 'safe'],
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
        $query = EmployeePosition::find();

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
        //     'created_date' => $this->created_date,
        //     'created_by' => $this->created_by,
        //     'updated_date' => $this->updated_date,
        //     'updated_by' => $this->updated_by,
        //     'status' => $this->status,
        // ]);

        // $query->andFilterWhere(['like', 'position_type', $this->position_type])
        //     ->andFilterWhere(['like', 'description', $this->description]);
            if ($this->globalSearch == "active" || $this->globalSearch == "Active") {
                $status =1;
            }else if($this->globalSearch == "inactive" || $this->globalSearch == "Inactive") {
                $status = 0;
            }else {
                $status = "";
            }

            $query->andFilterWhere(['or',  
            ['like', 'position_type', $this->globalSearch], 
            ['like', 'status', $status], 
            // 'status' => $this->status,

        ]);      

        return $dataProvider;
    }
}
