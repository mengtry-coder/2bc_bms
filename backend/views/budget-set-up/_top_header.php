<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;

// @$id_project = $_GET['id_project'];



if(isset($_GET['id'])){
    @$budget_setup_id = $_GET['id'];
}

$model = \backend\models\BudgetSetUp::findOne($budget_setup_id);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>
    <button class="btn btn-info btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['budget-set-up/update','id'=>$model->id, 'type'=>1]) ?>" data-title="Update Bedget Setup" id='modalButton'>
        <i class="btn-label demo-psi-file-add"></i> Update Bedget Setup
    </button>
    <button class="btn btn-warning btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['budget-set-up/create','type'=>1]) ?>" data-title="New Bedget Setup" id='modalButton'>
        <i class="btn-label demo-pli-coin"></i> New Bedget Setup
    </button>
<style type="text/css">
    .modal-task {
        width: 60% !important;
    }
    .modal-invoice {
        width: 95% !important;
    }
</style>
