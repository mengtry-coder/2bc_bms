<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ProjectTimesheet;
use Yii;
/**
 * ProjectTimesheetSearch represents the model behind the search form of `backend\models\ProjectTimesheet`.
 */
class ProjectTimesheetSearch extends ProjectTimesheet
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch;
    public function rules()
    {
        return [
            [['id', 'id_project', 'id_task', 'status', 'updated_by', 'created_by', 'id_employee'], 'integer'],
            [['start_date', 'start_time', 'end_date', 'end_time', 'note', 'updated_date', 'created_date', 'globalSearch'], 'safe'],
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
        $query = ProjectTimesheet::find();
        $query->joinWith(['member', 'task']);

        // add conditions that should always apply here

        $page_size = Yii::$app->session['page_size'];
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'start_date' => SORT_DESC,
                    'start_time' => SORT_DESC,
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

        // ->orFilterWhere(
        //         [
        //             'and',
        //             ['like', 'deadline', $this->globalSearch],
        //             ['id_related_profile'=> $id_project]
        //         ]
        //     )


        // $query->orFilterWhere(['like', 'project_timesheet.start_date', $this->globalSearch])
        //     ->orFilterWhere(['like', 'project_timesheet.start_time', $this->globalSearch])
        //     ->orFilterWhere(['like', 'project_timesheet.end_date', $this->globalSearch])
        //     ->orFilterWhere(['like', 'project_timesheet.end_time', $this->globalSearch])
        //     ->orFilterWhere(['like', 'task.task_name', $this->globalSearch])
        //     ->orFilterWhere(['like', 'employee_profile.id_prefix', $this->globalSearch])
        //     ->orFilterWhere(['like', 'employee_profile.first_name', $this->globalSearch])
        //     ->orFilterWhere(['like', 'employee_profile.last_name', $this->globalSearch])
        //     ->orFilterWhere(['like', 'project_timesheet.note', $this->globalSearch]);

        $query->orFilterWhere(['and', ['like', 'project_timesheet.start_date', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'project_timesheet.start_time', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'project_timesheet.end_date', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'project_timesheet.end_time', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'task.task_name', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'employee_profile.id_prefix', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'employee_profile.first_name', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'employee_profile.last_name', $this->globalSearch], ['id_project'=>$this->id_project]])
            ->orFilterWhere(['and', ['like', 'project_timesheet.note', $this->globalSearch], ['id_project'=>$this->id_project]]);

        return $dataProvider;
    }
}
