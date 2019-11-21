<?php

use yii\helpers\Html; 
$class_id = Yii::$app->controller->action->id; 
// echo $class_id;
@$id_employee_profile = $_GET['id'];

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Employee Profile';
$this->params['breadcrumbs'][] = ['label' => 'Employee', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_prefix." ".$model->first_name." ".$model->last_name];
$this->params['breadcrumbs'][] = 'Profile';
?>
<div class="employee-profile-profile">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?> 
</div>
 