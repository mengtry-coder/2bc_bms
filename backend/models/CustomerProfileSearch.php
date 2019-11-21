<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CustomerProfile;

/**
 * CustomerProfileSearch represents the model behind the search form of `backend\models\CustomerProfile`.
 */
class CustomerProfileSearch extends CustomerProfile
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date; 
    public function rules()
    {
        return [
            [['id', 'id_country', 'id_city', 'id_billing_city', 'id_billing_country', 'id_shipping_city', 'id_shipping_country', 'status', 'created_by', 'updated_by','id_customer_type'], 'integer'],
            [['customer_name', 'company_name', 'phone_number', 'email_address', 'address', 'group_names', 'billing_address', 'shipping_address', 'created_date', 'img_url', 'updated_date', 'globalSearch', 'date_range', 'from_date', 'to_date'], 'safe'],
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
        $query = CustomerProfile::find();
        // $query->joinWith(['customerType','itemGroup']);
        // $query->joinWith(['customerType','customerProfileSolution']);
        $query->joinWith(['customerType']);
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
     

        // $query->andFilterWhere(['like', 'customer_name', $this->customer_name])
        //     ->andFilterWhere(['like', 'company_name', $this->company_name])
        //     ->andFilterWhere(['like', 'phone_number', $this->phone_number])
        //     ->andFilterWhere(['like', 'email_address', $this->email_address])
        //     ->andFilterWhere(['like', 'address', $this->address])
        //     ->andFilterWhere(['like', 'group_names', $this->group_names])
        //     ->andFilterWhere(['like', 'billing_address', $this->billing_address])
        //     ->andFilterWhere(['like', 'shipping_address', $this->shipping_address])
        //     ->andFilterWhere(['like', 'img_url', $this->img_url]);


            // if($this->globalSearch == "active" || $this->globalSearch == "Active"){
            //     $status = 1;
            // }else if($this->globalSearch == "inactive" || $this->globalSearch == "Inactive"){
            //     $status = 0;
            // }else {
            //     $status = "";
            // }


            // $query->orFilterWhere(['between', 'date(created_date)', $this->from_date, $this->to_date])
            // ->andFilterWhere(['or', 
            //     ['like', 'company_name', $this->globalSearch],
            //     ['like', 'customer_type.name', $this->globalSearch],
            //     ['like', 'phone_number', $this->globalSearch],
            //     ['like', 'email_address', $this->globalSearch],
            //     ['like', 'address', $this->globalSearch], 
            //     ['=', 'customer_profile.status', $status], 
            // ]);   
        if(Yii::$app->user->identity->user_type_id == 1){
            $query->orFilterWhere(
                ['like', 'company_name', $this->globalSearch],
                ['like', 'customer_name', $this->globalSearch],
                ['like', 'phone_number', $this->globalSearch],
                ['like', 'email_address', $this->globalSearch],
                ['like', 'address', $this->globalSearch] 
            )
            ->andFilterWhere(['and',    
                ['=', 'customer_profile.id_city', $this->id_city], 
                ['=', 'customer_profile.status', $this->status], 
                ['=', 'customer_profile.id_customer_type', $this->id_customer_type],
                ]); 
        }else{
            $query->orFilterWhere(
                ['like', 'company_name', $this->globalSearch],
                ['like', 'customer_name', $this->globalSearch],
                ['like', 'phone_number', $this->globalSearch],
                ['like', 'email_address', $this->globalSearch],
                ['like', 'address', $this->globalSearch] 
            )
            ->andFilterWhere(['in', 'customer_profile.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['and',    
                ['=', 'customer_profile.id_city', $this->id_city], 
                ['=', 'customer_profile.status', $this->status], 
                ['=', 'customer_profile.id_customer_type', $this->id_customer_type],
                ]); 
        }    

        return $dataProvider;
    }
}
