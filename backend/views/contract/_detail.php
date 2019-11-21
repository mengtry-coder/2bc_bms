<?php

use yii\helpers\Html; 
$class_id = Yii::$app->controller->action->id; 
// echo $class_id;
@$id_contract = $_GET['id'];

$this->title = 'Contract';
$this->params['breadcrumbs'][] = ['label' => 'Contract', 'url' => ['index']]; 
$this->params['breadcrumbs'][] = 'Update';

$this->registerJsFile(
    '@web/plugins/ckeditor/ckeditor.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
?>
<div class="contract-profile">
<?= $this->render('_form', [
        'model' => $model,
        'model_item' => $model_item
]) ?> 
</div>
 