<?php

namespace backend\models;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Item;

/**
 * ItemSearch represents the model behind the search form of `backend\models\Item`.
 */
class ItemSearch extends Item
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch; 
    public function rules()
    {
        return [
            [['id', 'id_tax', 'id_group', 'unit', 'status', 'updated_by', 'created_by'], 'integer'],
            [['description', 'long_description', 'updated_date', 'created_date', 'globalSearch'], 'safe'],
            [['rate'], 'number'],
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
        $query = Item::find();
        $query->joinWith(['itemGroup']);
        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id_group' => SORT_ASC,
                    'id' => SORT_ASC,
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

        // grid filtering conditions
        // $query->andFilterWhere([
        //     'id' => $this->id,
        //     'rate' => $this->rate,
        //     'id_tax' => $this->id_tax,
        //     'id_group' => $this->id_group,
        //     'unit' => $this->unit,
        //     'status' => $this->status,
        //     'updated_by' => $this->updated_by,
        //     'updated_date' => $this->updated_date,
        //     'created_by' => $this->created_by,
        //     'created_date' => $this->created_date,
        // ]);

        // $query->andFilterWhere(['like', 'description', $this->description])
        //     ->andFilterWhere(['like', 'long_description', $this->long_description]);

            $query->andFilterWhere(['or', 
                ['like', 'item.description', $this->globalSearch],
                ['like', 'item.rate', $this->globalSearch],
                ['like', 'item_group.name', $this->globalSearch],
            ]);     

        return $dataProvider;
    }
}
