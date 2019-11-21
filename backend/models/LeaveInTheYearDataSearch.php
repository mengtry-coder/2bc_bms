<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\LeaveInTheYearData;

/**
 * LeaveInTheYearDataSearch represents the model behind the search form of `backend\models\LeaveInTheYearData`.
 */
class LeaveInTheYearDataSearch extends LeaveInTheYearData
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'leave_type_value', 'id_leave_type', 'id_month_list', 'id_year_list', 'created_by', 'updated_by'], 'integer'],
            [['created_date', 'updated_date'], 'safe'],
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
        $query = LeaveInTheYearData::find();

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
            'leave_type_value' => $this->leave_type_value,
            'id_leave_type' => $this->id_leave_type,
            'id_month_list' => $this->id_month_list,
            'id_year_list' => $this->id_year_list,
            'created_date' => $this->created_date,
            'created_by' => $this->created_by,
            'updated_date' => $this->updated_date,
            'updated_by' => $this->updated_by,
        ]);

        return $dataProvider;
    }
}
