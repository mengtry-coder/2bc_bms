<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Project;
use Yii;
/**
 * ProjectSearch represents the model behind the search form of `backend\models\Project`.
 */
class ProjectSearch extends Project
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date, $date_type; 
    public function rules()
    {
        return [
            [['id', 'id_customer', 'is_calculate', 'id_billing_type', 'id_priority', 'status', 'updated_by', 'created_by'], 'integer'],
            [['project_name', 'start_date', 'due_date', 'deadline', 'description', 'updated_date', 'created_date', 'globalSearch', 'date_range','date_type', 'from_date', 'to_date'], 'safe'],
            [['project_progress', 'rate', 'estimated_hour'], 'number'],
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
        $query = Project::find();
        $query->joinWith(['customer', 'projectStatus', 'projectPriority','member']);

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

        if ($this->date_type == "created_date") {
            $date_type = 'date(project.created_date)';
        }else {
            $date_type = $this->date_type;
        }
        
        if(empty($this->date_type)){
            $query
            ->andFilterWhere(['or', 
                ['between', 'start_date', $this->from_date, $this->to_date],
                ['between', 'due_date', $this->from_date, $this->to_date],
                ['between', 'deadline', $this->from_date, $this->to_date],
                ['between', 'date(project.created_date)', $this->from_date, $this->to_date],
            ])
            ->andFilterWhere(['or', 
                ['like', 'priority.name', $this->globalSearch],
                ['like', 'project.project_name', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'project.description', $this->globalSearch], 
            ])
            ->andFilterWhere(['in', 'project_member.id', \common\models\GlobalFunction::WorkingGroup()])
            ->orFilterWhere(['in', 'project.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ;  
        }else{
            $query->andFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['or', 
                ['like', 'priority.name', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'project.description', $this->globalSearch], 
            ]);  
        }

        // print_r($query->createCommand()->getRawSql());
        
    
        return $dataProvider;
    }
}
