<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ChartAccount;

/**
 * ChartAccountSearch represents the model behind the search form about `backend\models\ChartAccount`.
 */
class ChartAccountSearch extends ChartAccount
{
    /**
     * @inheritdoc
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'updated_by','id_bank'], 'integer'],
            [['names','number_code', 'updated_date', 'globalSearch'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
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
        $query = ChartAccount::find()->where(['is_parent' => 0])->orderBy(['id_account_type'=>SORT_ASC]);

        // add conditions that should always apply here
        $page_size = Yii::$app->session['page_size'];

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
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
        //     'is_parent' => 0,
        //     'updated_by' => $this->updated_by,
        //     'updated_date' => $this->updated_date,
        // ]);

        $query->andFilterWhere(['like', 'names', $this->globalSearch]);

        return $dataProvider;
    }
}
