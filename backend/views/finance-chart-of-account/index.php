<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\FinanceChartOfAccountSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Finance Chart Of Accounts';
$this->params['breadcrumbs'][] = ['label' => 'Report', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="finance-chart-of-account-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <div class="panel"> 
        <div class="panel-body">  
            <div class="row">
                <div class="col-md-12">
                    <?php echo $this->render('_search', ['model' => $searchModel]); ?>
                </div>
            </div> 
        <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Finance Chart Of Accounts'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-md',
            ]);
            echo "<div id='modalContent'></div>";
            Modal::end();
        
        ?>
        <div class="table-responsive">
                <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'tableOptions' => [ 
                    'class' => 'table table-striped table-hover',
                    'cellspacing'=>'0',
                    'width'=>'100%', 
                    ],
                'layout'=>"
                    {items}
                        <div class='col-md-5 '>
                            <label class='form-inline'>
                                Show ".
                            Html::dropDownList('page_size',
                            $page_size,
                            Yii::$app->params['page_size'],
                            array('class' => 'form-control', 'id' => 'select_page_size'))."
                            </label>
                        </div>
                        <div class='col-md-2' style='padding-top: 5px;'>
                            {summary}
                        </div>
                        <div class='col-md-5' style='text-align: right;'>
                            {pager}
                        </div>
                        ",
                'pager' => [
                    'firstPageLabel' => 'First',
                    'lastPageLabel' => 'Last',
                    'maxButtonCount' => 5,
                ],
                
                'rowOptions'=>function($model){
                    if($model->status == 0){
                        return ['class' => 'danger'];
                    }
                },
        
                'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                [
                    'attribute'=>'date',
                    'format' => ['date', 'php:d-M-Y'],
                    'contentOptions' =>['class'=>'text-center'],
                    'headerOptions' =>['class'=>'text-center'],
                ],
                'transaction_type', 
                'doc_id',
                [
                'attribute' => 'account_type',
                    'format'=>'raw',
                    'contentOptions' => ['class'=>'max-character', 'style'=>'max-width:100px;'],
                    'value' => function($model){
                        return "<span data-toggle='tooltip' title='".$model->accountType->names."'>" . $model->accountType->names . "</span>";
                        // return $model->reference;
                    }
                ],
                [
                    'attribute' => 'chart_of_account',
                    'format'=>'raw',
                    'contentOptions' => ['class'=>'max-character', 'style'=>'max-width:100px;'],
                    'value' => function($model){
                        if(!empty($model->chartOfAccount)){
                            return "<span data-toggle='tooltip' title='".$model->chartOfAccount->names."'>" . $model->chartOfAccount->names . "</span>";
                        }else {
                            return $model->chart_of_account;
                        }
                    }
                ],
                [
                    'attribute' => 'name',
                    'format'=>'raw',
                    'contentOptions' => ['class'=>'max-character', 'style'=>'max-width:100px;'],
                    'value'=> function($model){
                        if($model->name_type == 'customer'){
                            $supplier = \backend\models\CustomerProfile::find()->where(['id'=>$model->name])->one();
                            $display_name = $supplier->customer_name . ' ('.$supplier->company_name . ')';
                        }
                        else if($model->name_type == 'supplier'){
                            $supplier = \backend\models\SupplierProfile::find()->where(['id'=>$model->name])->one();
                            $display_name = $supplier->supplier_name . ' ('.$supplier->company_name . ')';
                        }
                        else if($model->name_type == 'project'){
                            $supplier = \backend\models\Project::find()->where(['id'=>$model->name])->one();
                            $display_name = $supplier->project_name;
                        }
                        else if($model->name_type == 'employee'){
                            $supplier = \backend\models\EmployeeProfile::find()->where(['id'=>$model->name])->one();
                            $display_name = $supplier->id_prefix . ' '. $supplier->first_name . ' ' . $supplier->last_name;
                        }
                        else{
                            $display_name = 'N/A';
                        }
                        return "<span data-toggle='tooltip' title='".$display_name."'>" . $display_name . "</span>";
                    }
                ],

                [
                    'attribute' => 'debit',
                    'value' => function($model){
                        return number_format($model->debit,2).' $';
                    },
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                [
                    'attribute' => 'credit',
                    'value' => function($model){
                        return number_format($model->credit,2).' $';
                    },
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                [
                    'attribute' => 'balance',
                    'value' => function($model){
                        return number_format($model->balance,2).' $';
                    },
                    'contentOptions' => ['class' => 'text-right'],
                    'headerOptions' => ['class' => 'text-right'],
                ],
                ],
            ]); ?>
                                
            </div>
        </div>
    </div>
</div>

<?php
$this->registerJs('
        var controller_id = "finance-chart-of-account";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });
        
        $(document).ready(function(){
            $("[data-toggle=\'tooltip\']").tooltip(); 
        });

        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

    ');
?>
