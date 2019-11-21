<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Quotation;

/**
 * QuotationSearch represents the model behind the search form of `backend\models\Quotation`.
 */
class QuotationSearch extends Quotation
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range, $from_date, $to_date, $date_type;
    public function rules()
    {
        return [
            [['id', 'id_customer', 'currency', 'discount_type', 'allow_comment', 'status', 'assigned', 'created_by', 'updated_by', 'id_discount', 'id_tax', 'is_tax', 'is_converted_from_proposal', 'id_project'], 'integer'],
            [['name', 'date', 'open_till', 'to', 'address', 'city', 'country', 'zip_code', 'email', 'phone', 'code', 'created_date', 'updated_date', 'globalSearch', 'date_range', 'from_date', 'to_date','date_type'], 'safe'],
            [['total', 'discount_value', 'discount_amount', 'tax_amount', 'sub_total', 'grand_total'], 'number'],
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
        $query = Quotation::find();
        $query->joinWith(['customer','quotationStatus', 'user']);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        if ($this->date_type == "created_date") {
            $date_type = 'date(quotation.created_date)';
        }else {
            $date_type = $this->date_type;
        }

        if(Yii::$app->user->identity->user_type_id == 1){
            $query->orFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->andFilterWhere(['or',
                ['like', 'quotation.code', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'quotation_status.name', $this->globalSearch],
                ['like', 'quotation.total', $this->globalSearch]
            ]);
        }else{
            $query->orFilterWhere(['between', $date_type, $this->from_date, $this->to_date])
            ->orFilterWhere(['in', 'quotation.created_by', \common\models\GlobalFunction::WorkingGroup()])
            ->orFilterWhere(['in', 'user.id', \common\models\GlobalFunction::WorkingGroup()])
            // ->orFilterWhere(['in', '(SELECT user.id FROM user WHERE user.id_employee = quotation.assigned)', \common\models\GlobalFunction::WorkingGroup()])
            ->andFilterWhere(['or',
                ['like', 'quotation.code', $this->globalSearch],
                ['like', 'customer_profile.customer_name', $this->globalSearch],
                ['like', 'customer_profile.company_name', $this->globalSearch],
                ['like', 'quotation_status.name', $this->globalSearch],
                ['like', 'quotation.total', $this->globalSearch]
            ]);
        }

        return $dataProvider;
    }
}
