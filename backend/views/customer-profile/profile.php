<?php

use yii\helpers\Html; 
$class_id = Yii::$app->controller->action->id; 
// echo $class_id;
@$id_customer_profile = $_GET['id'];

$this->title = 'Customer Profile';
$this->params['breadcrumbs'][] = ['label' => 'Customer', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->company_name];
$this->params['breadcrumbs'][] = 'Profile';
?>
<div class="customer-profile-profile">
<?= $this->render('_form', [
        'model' => $model,
]) ?> 
</div>
 