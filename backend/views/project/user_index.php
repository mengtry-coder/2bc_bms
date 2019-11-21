<?php 

use yii\widgets\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url; 

$this->title = 'All Project';
// $this->params['breadcrumbs'][] = ['label' => 'All Project', 'url' => ['#']];
$this->params['breadcrumbs'][] = $this->title;



?>


    <ul class="list-group">
    	<?php 
    		foreach ($model_project as $key => $value) {
    	?>
    		<li class="list-group-item">
    			<a href="<?= URL::toRoute(['project/my-task','id_project'=>$value['id']]) ?>" class="list-group-item btn-link">
	    			<span class="badge badge-primary"><?= $value['total_task'] ?></span><?= $value['project_name'] ?>
	    		</a>
    		</li>
    	<?php
    		}
    	?>                
    </ul>

