<?php

use yii\helpers\Html; 
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use backend\models\Task;

$class_id = Yii::$app->controller->action->id; 

$this->registerCssFile(
    "@web/plugins/jquery-ui/jquery-ui.min.css", 
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/jquery-ui/jquery-ui.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

$this->title = 'Task Board';
$this->params['breadcrumbs'][] = ['label' => 'Project', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->project_name];
$this->params['breadcrumbs'][] = $this->title;


?>

<div class="project-profile">
    <?= $this->render('//project/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
        <p class="text-main text-bold"><?= $this->title; ?></p>
        <hr>

        <?php $form = ActiveForm::begin() ?>
            <div class="row">
                <div class="col-sm-4">

                    <!-- Upcoming Tasklist -->
                    <!---------------------------------->
                    <div>
                        <h4 class="text-main">Planning & Design</h4>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet.</p>
                        <hr>
                        <ul id="demo-tasklist-upcoming" class="sortable-list tasklist list-unstyled">
                            <?php 
                                $task_1 = Task::findAll(['id_related_to'=>1,'id_related_profile'=>$model->id]);
                                if(!empty($task_1)){
                                    foreach ($task_1 as $key => $value) {
                            ?>
                            <li id="<?= $value->id ?>" class="task-warning">
                                <input type="hidden" name="task_list_1[]" value="<?= $value->id ?>">
                                <p class="text-bold text-main text-sm"><?= $value->start_date ?> To <?= $value->start_date ?></p>
                                <p class="pad-btm bord-btm"><?= $value->task_name; ?></p>
                            </li>
                            <?php
                                    }
                                }
                            ?>
                        </ul>
                    </div>
                    <!---------------------------------->
        
        
                </div>
                <div class="col-sm-4">
        
                    <!-- Upcoming Tasklist -->
                    <!---------------------------------->
                    <div>
                        <h4 class="text-main header-title m-t-0">Development</h4>
                        <p class="text-muted text-sm">Vivamus elementum semper nisi vulputate eleifend tellus.</p>
                        <hr>
        
                        <ul id="demo-tasklist-inprogress" class="sortable-list tasklist list-unstyled">
                            <?php 
                                $task_2 = Task::findAll(['id_related_to'=>1,'id_related_profile'=>$model->id]);
                                if(!empty($task_2)){
                                    foreach ($task_2 as $key => $value) {
                            ?>
                            <li id="<?= $value->id ?>" class="task-mint">
                                <input type="hidden" name="task_list_2[]" value="<?= $value->id ?>">
                                <p class="text-bold text-main text-sm"><?= $value->start_date ?> To <?= $value->start_date ?></p>
                                <p class="pad-btm bord-btm"><?= $value->task_name; ?></p>
                            </li>
                            <?php
                                    }
                                }
                            ?>
                        </ul>
                    </div>
                    <!---------------------------------->
        
        
        
                </div>
                <div class="col-sm-4">
        
                    <!-- Upcoming Tasklist -->
                    <!---------------------------------->
                    <div>
                        <h4 class="text-main header-title m-t-0">Product Testing</h4>
                        <p class="text-muted text-sm">To an English person, it will seem like simplified.</p>
                        <hr>
        
                        <ul id="demo-tasklist-completed" class="sortable-list tasklist list-unstyled">
                            <?php 
                                $task_3 = Task::findAll(['id_related_to'=>1,'id_related_profile'=>$model->id]);
                                if(!empty($task_3)){
                                    foreach ($task_3 as $key => $value) {
                            ?>
                            <li id="<?= $value->id ?>" class="task-mint">
                                <input type="hidden" name="task_list_3[]" value="<?= $value->id ?>">
                                <p class="text-bold text-main text-sm"><?= $value->start_date ?> To <?= $value->start_date ?></p>
                                <p class="pad-btm bord-btm"><?= $value->task_name; ?></p>
                            </li>
                            <?php
                                    }
                                }
                            ?>                                        
                        </ul>
                    </div>
                    <!---------------------------------->
        
        
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Output</h3>
                </div>
                <div class="panel-body">
                    <p>Serializes the sortable's item id's into an array of string.</p>
                    <div id="demo-output" class="well mar-no"></div>
                </div>
            </div>
        
        <?php ActiveForm::end(); ?>
                
        </div>
    </div>

</div>

<?php 

$script = <<<JS

    // $(document).on('nifty.ready', function () {
            
            $("#demo-tasklist-upcoming, #demo-tasklist-inprogress, #demo-tasklist-completed").sortable({
                connectWith: ".tasklist",
                placeholder: "task-placeholder",
                forcePlaceholderSize: true,
                update: function (event, ui) {
                    var upcoming = $("#demo-tasklist-upcoming").sortable("toArray");
                    var inprogress = $("#demo-tasklist-inprogress").sortable("toArray");
                    var completed = $("#demo-tasklist-completed").sortable("toArray");
                    $("#demo-output").html("Upcoming: " + window.JSON.stringify(upcoming) + "<br/>" + "In Progress: " + window.JSON.stringify(inprogress) + "<br/>" + "Completed: " + window.JSON.stringify(completed));
                }
            }).disableSelection();
                
        // });


JS;

$this->registerJs($script);

?>
