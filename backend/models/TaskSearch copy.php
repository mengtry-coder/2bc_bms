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
            [['task_name', 'start_date', 'due_date', 'deadline', 'description', 'updated_date', 'created_date', 'globalSearch', 'department', 'position'], 'safe'],
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
        $query->joinWith(['member']);

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

        if(Yii::$app->controller->id == 'project'){
            $id_project = $_GET['id_project'];
            $query->orFilterWhere(
                [
                    'and',
                    ['like', 'task_name', $this->globalSearch],
                    ['id_related_profile'=> $id_project]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'description', $this->globalSearch],
                    ['id_related_profile'=> $id_project]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'start_date', $this->globalSearch],
                    ['id_related_profile'=> $id_project]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'deadline', $this->globalSearch],
                    ['id_related_profile'=> $id_project]
                ]
            )
            ;
        }
        else if(Yii::$app->controller->id == 'task')
        {
            if(Yii::$app->user->identity->user_type_id == 1){
                $query->orFilterWhere(['like', 'task_name', $this->globalSearch])
                ->andFilterWhere(['=', '(SELECT employee_profile.id_department from employee_profile WHERE employee_profile.id = task_member.id_employee)', $this->department])
                ->andFilterWhere(['=', '(SELECT employee_profile.id_position from employee_profile WHERE employee_profile.id = task_member.id_employee)', $this->position])
                ->orFilterWhere(['like', 'description', $this->globalSearch]);
            }else{
                $query->orFilterWhere(['like', 'task_name', $this->globalSearch])
                ->andFilterWhere(['=', '(SELECT employee_profile.id_department from employee_profile WHERE employee_profile.id = task_member.id_employee)', $this->department])
                ->andFilterWhere(['=', '(SELECT employee_profile.id_position from employee_profile WHERE employee_profile.id = task_member.id_employee)', $this->position])
                ->andFilterWhere(['in', 'task.created_by', \common\models\GlobalFunction::WorkingGroup()])
                ->orFilterWhere(['like', 'description', $this->globalSearch]);
            }
        }


        // print_r($query->createCommand()->getRawSql());

        return $dataProvider;
    }
}
