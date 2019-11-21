<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\LeaveApplication;

/**
 * LeaveApplicationSearch represents the model behind the search form of `backend\models\LeaveApplication`.
 */
class LeaveApplicationSearch extends LeaveApplication
{
    /**
     * {@inheritdoc}
     */
    public $date_range;
    public function rules()
    {
        return [
            [['id', 'id_approver', 'is_half_day', 'id_leave_type_name', 'created_by', 'updated_by'], 'integer'],
            [['start_date', 'end_date', 'leave_reason', 'reject_reason', 'id_leave_status', 'created_date', 'updated_date','date_range','id_employee'], 'safe'],
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
        $query = LeaveApplication::find();

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
            'id_approver' => $this->id_approver,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'is_half_day' => $this->is_half_day,
            'id_leave_type_name' => $this->id_leave_type_name,
            'created_by' => $this->created_by,
            'created_date' => $this->created_date,
            'updated_by' => $this->updated_by,
            'updated_date' => $this->updated_date,
        ]);

        $query->andFilterWhere(['like', 'leave_reason', $this->leave_reason])
            ->andFilterWhere(['like', 'reject_reason', $this->reject_reason])
            ->andFilterWhere(['like', 'id_leave_status', $this->id_leave_status]);

        return $dataProvider;
    }
}
