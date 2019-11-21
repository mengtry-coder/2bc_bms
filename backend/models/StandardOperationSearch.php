<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\StandardOperation;

/**
 * StandardOperationSearch represents the model behind the search form of `backend\models\StandardOperation`.
 */
class StandardOperationSearch extends StandardOperation
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id','id_employee_position', 'id_standard_operation_step', 'created_by', 'status'], 'integer'],
            [['name', 'created_date', 'updated_date', 'updated_by','start_date','due_date','deadline','id_priority','id_related_to','id_related_profile'], 'safe'],
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
        $query = StandardOperation::find();

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
        $query->andFilterWhere([
            'id' => $this->id,  
            'id_employee_position' => $this->id_employee_position,
            'id_standard_operation_step' => $this->id_standard_operation_step,
            'created_date' => $this->created_date,
            'created_by' => $this->created_by,
            'updated_date' => $this->updated_date,
            'updated_by' => $this->updated_by,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
