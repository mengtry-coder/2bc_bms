<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\MembershipPayment;

/**
 * MembershipPaymentSearch represents the model behind the search form of `backend\models\MembershipPayment`.
 */
class MembershipPaymentSearch extends MembershipPayment
{
    /**
     * {@inheritdoc}
     */
    public $globalSearch, $date_range;
    public function rules()
    {
        return [
            [['id', 'id_membership_profile', 'id_payment_type', 'id_payment_method', 'id_membership_type', 'created_by', 'updated_by', 'status'], 'integer'],
            [['amount', 'balance'], 'number'],
            [['from_date', 'to_date', 'description', 'created_date', 'updated_date', 'globalSearch'], 'safe'],
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
        $query = MembershipPayment::find();
        $query->joinWith(['paymentType', 'paymentFor']);

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


        $query
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'membership_payment.from_date', $this->globalSearch],
                    ['id_membership_profile'=> $this->id_membership_profile]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'membership_payment.to_date', $this->globalSearch],
                    ['id_membership_profile'=> $this->id_membership_profile]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'payment_for.names', $this->globalSearch],
                    ['id_membership_profile'=> $this->id_membership_profile]
                ]
            )
            ->orFilterWhere(
                [
                    'and',
                    ['like', 'payment_type.names', $this->globalSearch],
                    ['id_membership_profile'=> $this->id_membership_profile]
                ]
            )
        ;
        return $dataProvider;
    }
}
