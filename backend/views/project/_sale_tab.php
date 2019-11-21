<?php 
use yii\helpers\Html;
use yii\helpers\Url;

$class_id = Yii::$app->controller->action->id; 

@$id_project = $_GET['id_project'];

?>

<div class="list-group"> 
    <a class="list-group-item <?= $class_id =='sale-invoice'?'active':'' ?>" href="<?= Url::toRoute(['project/sale-invoice', 'id_project'=>$id_project]) ?>">Invoice</a>
    <a class="list-group-item <?= $class_id =='sale-payment'?'active':'' ?>" href="<?= Url::toRoute(['project/sale-payment', 'id_project'=>$id_project]) ?>">Payment</a>
    <a class="list-group-item <?= $class_id =='sale-quotation'?'active':'' ?>" href="<?= Url::toRoute(['project/sale-quotation', 'id_project'=>$id_project]) ?>">Quotation</a>
    <a class="list-group-item <?= $class_id =='sale-expense'?'active':'' ?>" href="<?= Url::toRoute(['project/sale-expense', 'id_project'=>$id_project]) ?>">Expense</a>
</div>