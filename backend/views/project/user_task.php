<?php 

use yii\widgets\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url; 

$this->title = 'All Task';
// $this->params['breadcrumbs'][] = ['label' => 'All Project', 'url' => ['#']];
$this->params['breadcrumbs'][] = $this->title;

?>


    <ul class="list-group">
    	<?php 
    		foreach ($model_task as $key => $value) {
    	?>
    		<li class="list-group-item">
    			<a href="<?= URL::toRoute(['project/my-task-checklist','id'=>$value['id']]) ?>" class="list-group-item btn-link">
	    			<span class="badge badge-primary"><?= $value['total_activity'] ?></span><?= $value['task_name'] .' | ' . 'Related to '. $value['related_to'] ?>
	    		</a>
    		</li>
    	<?php
    		}
    	?>                
    </ul>

<?php

$script = <<<JS
	
	$("#panel-title-user").text("Task List");

JS;

$this->registerJs($script);
?>