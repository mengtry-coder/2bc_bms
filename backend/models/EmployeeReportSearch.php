<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\EmployeeReport;

/**
 * EmployeeReportSearch represents the model behind the search form of `backend\models\EmployeeReport`.
 */
class EmployeeReportSearch extends EmployeeReport
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'nationality', 'id_country', 'id_city', 'id_department', 'id_position', 'created_by', 'updated_by', 'status', 'id_user_type'], 'integer'],
            [['id_prefix', 'first_name', 'last_name', 'join_date', 'date_of_birth', 'place_of_birth', 'sex', 'address', 'marital_status', 'phone_number', 'email', 'username', 'password', 'confirm_password', 'description', 'created_date', 'updated_date', 'img_url', 'job_description', 'employee_code', 'employee_joint_date'], 'safe'],
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
        $query = EmployeeReport::find();

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
            'join_date' => $this->join_date,
            'date_of_birth' => $this->date_of_birth,
            'nationality' => $this->nationality,
            'id_country' => $this->id_country,
            'id_city' => $this->id_city,
            'id_department' => $this->id_department,
            'id_position' => $this->id_position,
            'created_date' => $this->created_date,
            'created_by' => $this->created_by,
            'updated_date' => $this->updated_date,
            'updated_by' => $this->updated_by,
            'status' => $this->status,
            'id_user_type' => $this->id_user_type,
            'employee_joint_date' => $this->employee_joint_date,
        ]);

        $query->andFilterWhere(['like', 'id_prefix', $this->id_prefix])
            ->andFilterWhere(['like', 'first_name', $this->first_name])
            ->andFilterWhere(['like', 'last_name', $this->last_name])
            ->andFilterWhere(['like', 'place_of_birth', $this->place_of_birth])
            ->andFilterWhere(['like', 'sex', $this->sex])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'marital_status', $this->marital_status])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'confirm_password', $this->confirm_password])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'img_url', $this->img_url])
            ->andFilterWhere(['like', 'job_description', $this->job_description])
            ->andFilterWhere(['like', 'employee_code', $this->employee_code]);

        return $dataProvider;
    }
}
