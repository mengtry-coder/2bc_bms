<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\StandardOperationProcedureSetUp;

/**
 * StandardOperationProcedureSetUpSearch represents the model behind the search form of `backend\models\StandardOperationProcedureSetUp`.
 */
class StandardOperationProcedureSetUpSearch extends StandardOperationProcedureSetUp
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'status', 'created_by', 'updated_by'], 'integer'],
            [['name', 'created_date', 'updated_date','globalSearch'], 'safe'],
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
        $query = StandardOperationProcedureSetUp::find();
        $query->joinWith(['createdBy', 'position']);


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

        if( 
            Yii::$app->user->identity->user_type_id != 1
        ){
            $query->where(['sop_set_up_assign_position.id_position' => Yii::$app->user->identity->id_position]);
        }

        $query->orFilterWhere(['like', 'standard_operation_procedure_set_up.name', $this->globalSearch])
        ->orFilterWhere(['like', 'user.first_name', $this->globalSearch])
        ->orFilterWhere(['like', 'user.last_name', $this->globalSearch]);
        $query->groupBy('standard_operation_procedure_set_up.id');

        return $dataProvider;
    }
}
