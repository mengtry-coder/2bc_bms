<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Task;
use Yii;
/**
 * TaskSearch represents the model behind the search form of `backend\models\Task`.
 */
class TaskSearch extends Task
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $department, $position,$date_range, $from_date, $to_date, $date_type; 

    public function rules()
    {
        return [
            [['id', 'id_priority', 'id_repeater', 'id_related_to', 'id_related_profile', 'status', 'updated_by', 'created_by'], 'integer'],
            [['task_name', 'start_date', 'due_date', 'deadline', 'description', 'updated_date', 'created_date', 'globalSearch', 'department', 'position','date_range','date_type', 'from_date', 'to_date'], 'safe'],
            [['id_billing_type', 'rate'], 'number'],
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
        $query = Task::find();
        // $query->joinWith(['member']);
        $query->joinWith(['member', 'taskStatus', 'taskPriority']);


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
            $date_type = 'date(task.created_date)';
        }else {
            $date_type = $this->date_type;
        }

        if(empty($this->date_type)){
         
            $query
            ->andFilterWhere(['or', 
                ['between', 'start_date', $this->from_date, $this->to_date],
                ['between', 'due_date', $this->from_date, $this->to_date],
                ['between', 'deadline', $this->from_date, $this->to_date],
                ['between', 'date(task.created_date)', $this->from_date, $this->to_date],
            ])
            ->andFilterWhere(['in', 'task_member.id', \common\models\GlobalFunction::WorkingGroup()])
            ->orFilterWhere(['in', 'task.created_by', \common\models\GlobalFunction::WorkingGroup()])
            
            ; 
        }else{
            
            $query->andFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['in', 'created_by', \common\models\GlobalFunction::WorkingGroup()])
        
            ->andFilterWhere(['or', 
            ['like', 'task.task_name', $this->globalSearch],

                ['like', 'priority.name', $this->globalSearch],
                // ['like', 'member.member_name', $this->globalSearch],
                ['like', 'task.description', $this->globalSearch], 
            ]);  
        }


        // print_r($query->createCommand()->getRawSql());
        // exit();

        return $dataProvider;
    }
}
