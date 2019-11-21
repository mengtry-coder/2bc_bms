<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\EventList;

/**
 * EventListSearch represents the model behind the search form of `backend\models\EventList`.
 */
class EventListSearch extends EventList
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'number_of_audient', 'id_country', 'id_city', 'id_province', 'prefix_phone_code', 'prefix_phone_code_line_2', 'created_by', 'updated_by', 'status'], 'integer'],
            [['img_url', 'event_name', 'address', 'address_line_2', 'postal_code', 'phone_number', 'phone_number_line_2', 'email', 'description', 'created_date', 'updated_date', 'from_date', 'to_date'], 'safe'],
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
        $query = EventList::find();

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
            'number_of_audient' => $this->number_of_audient,
            'id_country' => $this->id_country,
            'id_city' => $this->id_city,
            'id_province' => $this->id_province,
            'prefix_phone_code' => $this->prefix_phone_code,
            'prefix_phone_code_line_2' => $this->prefix_phone_code_line_2,
            'created_date' => $this->created_date,
            'created_by' => $this->created_by,
            'updated_date' => $this->updated_date,
            'updated_by' => $this->updated_by,
            'status' => $this->status,
            'from_date' => $this->from_date,
            'to_date' => $this->to_date,
        ]);

        $query->andFilterWhere(['like', 'img_url', $this->img_url])
            ->andFilterWhere(['like', 'event_name', $this->event_name])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'address_line_2', $this->address_line_2])
            ->andFilterWhere(['like', 'postal_code', $this->postal_code])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'phone_number_line_2', $this->phone_number_line_2])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
