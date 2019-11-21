<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\LeadProfile;

/**
 * LeadProfileSearch represents the model behind the search form of `backend\models\LeadProfile`.
 */
class LeadProfileSearch extends LeadProfile
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date; 
    public function rules()
    {
        return [
            [['id', 'id_country', 'id_city', 'id_billing_city', 'id_billing_country', 'id_shipping_city', 'id_shipping_country', 'status', 'created_by', 'updated_by', 'customer_status', 'assigned_to', 'id_source'], 'integer'],
            [['lead_name', 'company_name', 'phone_number', 'email_address', 'address', 'group_names', 'billing_address', 'shipping_address', 'created_date', 'img_url', 'updated_date', 'zip_code','globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
            [['latitute', 'longitute'], 'number'],
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
        $query = LeadProfile::find();
        $query->joinWith(['user']);
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

        if(Yii::$app->user->identity->user_type_id == 1){
            
            $query->orFilterWhere(['between', 'date(lead_profile.created_date)', $this->from_date, $this->to_date])
            ->andFilterWhere(['or', 
                ['like', 'lead_profile.company_name', $this->globalSearch],
                ['like', 'lead_profile.lead_name', $this->globalSearch],
                ['like', 'lead_profile.phone_number', $this->globalSearch],
                ['like', 'lead_profile.email_address', $this->globalSearch],
                ['like', 'lead_profile.address', $this->globalSearch], 
            ]); 
        }else{
            $query->orFilterWhere(['between', 'date(lead_profile.created_date)', $this->from_date, $this->to_date])
            ->orFilterWhere(['in', 'lead_profile.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->orFilterWhere(['in', 'user.id', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['or', 
                ['like', 'lead_profile.company_name', $this->globalSearch],
                ['like', 'lead_profile.lead_name', $this->globalSearch],
                ['like', 'lead_profile.phone_number', $this->globalSearch],
                ['like', 'lead_profile.email_address', $this->globalSearch],
                ['like', 'lead_profile.address', $this->globalSearch], 
            ]); 
        }
                
        return $dataProvider;
    }
}
