<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\MembershipProfile;

/**
 * MembershipProfileSearch represents the model behind the search form of `backend\models\MembershipProfile`.
 */
class MembershipProfileSearch extends MembershipProfile
{
    /**
     * {@inheritdoc}
     */

    public $globalSearch;

    public function rules()
    {
        return [
            [['id', 'id_prefix', 'nationality', 'id_country', 'id_city', 'id_province', 'marital_status', 'prefix_phone_code', 'prefix_phone_code_line_2', 'created_by', 'updated_by', 'status','membership_type'], 'integer'],
            [['first_name', 'last_name', 'company_name', 'passport_no', 'date_of_birth', 'place_of_birth', 'sex', 'address', 'address_line_2', 'postal_code', 'phone_number', 'phone_number_line_2', 'email', 'website', 'contact_person', 'position', 'mot_licence_no', 'year_of_establishment', 'type_of_business', 'username', 'password', 'confirm_password', 'description', 'created_date', 'updated_date'], 'safe'],
            [['globalSearch'], 'safe']
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
        // $query = MembershipProfile::find()->Where(['membership_type'=>1]);
        $query = MembershipProfile::find();
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


        $query->orFilterWhere(['like', 'first_name', $this->globalSearch])
        ->orFilterWhere(['like', 'company_name', $this->globalSearch])
        ->orFilterWhere(['like', 'last_name', $this->globalSearch]);

        return $dataProvider;
    }
}
