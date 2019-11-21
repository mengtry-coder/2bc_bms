
<?php
use yii\bootstrap\NavBar;
use yii\bootstrap\Nav;
use backend\models\Customer;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use backend\models\UploadedFile;
use backend\models\Project;
use backend\models\Task;
$base_url =  Yii::getAlias('@web');
$this->beginContent('@app/views/layouts/main.php');
$employee_list = ArrayHelper::map(\backend\models\EmployeeProfile::find()
    ->all(), 'id', function($model){return $model->id_prefix . ' '. $model->first_name . ' ' . $model->last_name;});
    $smMenu = 1;
    $request = Yii::$app->request;
    $id_employee_profiles = $request->get('id',0);
    if($id_employee_profiles !=0){
        $id_employee_profile = $id_employee_profiles;
    }else{
        $id_employee_profile = $request->get('id_employee_profile');
    }
    $controllerName = Yii::$app->controller->id;
    $actionName = Yii::$app->controller->action->id;

    $empProfile = Yii::$app->db->createCommand("
        select employee_profile.* ,
        employee_position.position_type as position_name
        from employee_profile
        left join employee_position on employee_position.id = employee_profile.id_position
        where employee_profile.id = $id_employee_profile
    ");
    $empProfile = $empProfile->queryOne();

    $id_image_employee = $empProfile['img_url'];
    $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
    $command->bindParam(':id', $id_image_employee);
    $my_id = $command->queryOne();
    if ($my_id == '') {
    $my_id = 1;
    }
    if($id_image_employee == ''){
    $id_image_employee = 1;
    $my_id = $id_image_employee;
    }
    $img_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;
    $img_url = $base_url."/".$img_url;
    // echo $img_url;

    // start count project
    $idEmployee = Yii::$app->db->createCommand('
        select id_project from project_member where id_employee = "'.$id_employee_profile.'"
    ')->queryAll();
    $idProject = [];
    foreach ($idEmployee as $row)
    {
    $explode = explode(",", $row["id_project"]);
        foreach ($explode as $id){
        array_push($idProject,$id);
        }
    }
    $countAllProject = Project::find()->where(['in','project.id',$idProject])->count();
    $countCompletedProject = Project::find()->where(['project.status'=>5])->andWhere(['in','project.id',$idProject])->count();
    // end count project
    // start count task
    $idEmployeeInTask = Yii::$app->db->createCommand('
        select id_task from task_member where id_employee = "'.$id_employee_profile.'"
    ')->queryAll();
    $idTask = [];
    foreach ($idEmployeeInTask as $row)
    {
    $explode = explode(",", $row["id_task"]);
        foreach ($explode as $id){
        array_push($idTask,$id);
        }
    }
    $countAllTask = Task::find()->where(['in','task.id',$idTask])->count();
    $countCompletedTask = Task::find()->where(['task.status'=>5])->andWhere(['in','task.id',$idTask])->count();
    // end count task
?>
<style>
.panel-eo {
    border-color: #f87232;
}
.widget-img {
    position: absolute;
    width: 100px;
    height: 100px;
    left: 50%;
    margin-left: -50px;
    top: -56px;
}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="panel widget">
            <div class="widget-header bg-purple" style="min-height: 130px;">
                <img class="widget-bg img-responsive" src="<?= $base_url;?>/img/bg-img/angkor1.jpg" alt="Image" onError="this.onerror=null;this.src='<?=$base_url?>/backend/uploads/empty-avatar.png';">
            </div>
            <div class="widget-body text-center" style="background-color: #038ac1;">
            <img alt="Profile Picture" class="widget-img img-circle img-border-light" src="<?= $img_url; ?>" onError="this.onerror=null;this.src='<?=$base_url?>/backend/uploads/empty-avatar.png';">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-4" style="margin-top: -15px; text-align: right;">
                        <p class="mar-no text-main" style="color: white;">Related <?=$countAllProject;?> Project(s)</p>
                        <p class="mar-no text-main" style="color: white;">Completed <?=$countCompletedProject;?> Project(s)</p>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <h4 class="mar-no text-main" style="color: white;"><?= $empProfile['id_prefix'] ." ".$empProfile['first_name']." ".$empProfile['last_name'];?></h4>
                        <p class="text-muted mar-no" style="color: #ffffffb5;"><?= $empProfile['position_name'];?></p>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4" style="margin-top: -15px; text-align: left;">
                    <p class="mar-no text-main" style="color: white;">Related <?=$countAllTask;?> Task(s)</p>
                        <p class="mar-no text-main" style="color: white;">Completed <?=$countCompletedTask;?> Task(s)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-2 col-sm-3">
        <div class="panel">
            <div class="panel-heading panel-eo">
                <h3 class="panel-title" style="font-weight: 500;">Employee Menu</h3>
            </div>
            <div class="panel-body">
                <!--Link Items-->
                <!--===================================================-->
                <div class="list-group">
                    <a class="list-group-item emNavActiveOnAction_profile" href="<?= Url::toRoute('employee-profile/profile?id='.$id_employee_profile.'&smMenu='.$smMenu) ?>">Profile</a>
                    <a class="list-group-item emNavActive_project" href="<?= Url::toRoute('project/index/?id_employee_profile='.$id_employee_profile.'&smMenu='.$smMenu) ?>">Project</a>
                    <a class="list-group-item emNavActive_task" href="<?= Url::toRoute('task/index/?id_employee_profile='.$id_employee_profile.'&smMenu='.$smMenu) ?>">Task</a>
                    <a class="list-group-item emNavActive_knowledge-base" href="<?= Url::toRoute('knowledge-base/index?id_employee_profile='.$id_employee_profile.'&smMenu='.$smMenu) ?>">Knowledge Base</a>
                    <a class="list-group-item emNavActiveOnAction_document" href="<?= Url::toRoute('employee-profile/document?id_employee_profile='.$id_employee_profile.'&smMenu='.$smMenu) ?>">Document</a>
                </div>
                <!--===================================================-->

            </div>
        </div>
    </div>
    <div class="col-md-10 col-sm-9">
        <div class="panel">
            <div class="panel-heading panel-eo">
                <div class="panel-control">
                    <button class="btn btn-default" data-panel="fullscreen">
                        <i class="icon-max demo-psi-maximize-3"></i>
                        <i class="icon-min demo-psi-minimize-3"></i>
                    </button>
                </div>
                <h3 class="panel-title" style="font-weight: 500;"><?=$this->title;?></h3>
            </div>
            <div class="panel-body">
                <?= $content;?>
            </div>
        </div>
    </div>
</div>
<?php $this->endContent(); ?>
<style media="screen">
 .emNavActive_<?=$controllerName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 .emNavActiveOnAction_<?=$actionName;?>{
    color: #f87232 !important;
    font-weight: 500;
 }
 </style>
