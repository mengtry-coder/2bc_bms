<?php

namespace backend\models;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SupplierProfile;

/**
 * SupplierProfileSearch represents the model behind the search form of `backend\models\SupplierProfile`.
 */
class SupplierProfileSearch extends SupplierProfile
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date, $tags; 
    public function rules()
    {
        return [
            [['id', 'status', 'created_by', 'updated_by', 'id_supplier_profile_type', 'id_city'], 'integer'],
            [['supplier_name', 'company_name', 'phone_number', 'email', 'address', 'created_date', 'updated_date', 'img_url', 'globalSearch','date_range','from_date','to_date'], 'safe'],
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
        $query = SupplierProfile::find();

        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'created_date' => SORT_DESC,
                ]
            ],
            'pagination' => [ 'pageSize' => $page_size ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
 

        $query
            ->andFilterWhere(['and',    
                ['=', 'id_city', $this->id_city], 
                ['=', 'status', $this->status], 
                ['=', 'id_supplier_profile_type', $this->id_supplier_profile_type],
            ])
            ->andFilterWhere(['or', 
                ['like', 'supplier_name', $this->globalSearch],
                ['like', 'company_name', $this->globalSearch],
                ['like', 'phone_number', $this->globalSearch],
                ['like', 'email', $this->globalSearch],
                ['like', 'address', $this->globalSearch],
            ]);
            

        return $dataProvider;
    }
}
