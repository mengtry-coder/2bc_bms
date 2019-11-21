<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\User;

/**
 * UserSearch represents the model behind the search form of `backend\models\User`.
 */
class UserSearch extends User
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'user_type_id', 'id_employee', 'id_position', 'status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'gender'], 'integer'],
            [['email', 'password_hash', 'password_reset_token', 'auth_key', 'created_date', 'updated_date', 'deleted_at', 'first_name', 'last_name', 'telephone', 'img_url', 'username', 'globalSearch'], 'safe'],
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
        $query = User::find()->where(['!=', 'id', 1]);

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

        $query->orFilterWhere(
            ['like', 'email', $this->globalSearch]
        )
        ->andFilterWhere(['or',  
            ['=', 'user.id_position', $this->id_position],
            ['=', 'user.id_employee', $this->id_employee],
            ['=', 'user.user_type_id', $this->user_type_id],
            ['=', 'user.status', $this->status],
        ]);      

        return $dataProvider;
    }
}
