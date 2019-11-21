<?php

use yii\helpers\Html; 
$class_id = Yii::$app->controller->action->id; 
// echo $class_id;
@$id_customer_profile = $_GET['id'];

$this->title = 'Lead Profile';
$this->params['breadcrumbs'][] = ['label' => 'Lead', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->lead_name];
$this->params['breadcrumbs'][] = 'Profile';
?>
<div class="customer-profile-profile">
<?= $this->render('_form', [
        'model' => $model,
]) ?> 
</div>
 