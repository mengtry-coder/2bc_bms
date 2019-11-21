<?php
use common\models\App;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();
$report_title = 'TASK REPORT';
$delimiter = '-';
$file_name =  strtolower(trim(preg_replace('/[\s-]+/', $delimiter, preg_replace('/[^A-Za-z0-9-]+/', $delimiter, preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $report_title))))), $delimiter));
header("Content-type: application/vnd.ms-excel;charset:UTF-8"); 
header("Content-Disposition: attachment;filename=$file_name.xls");

$base_url =  Yii::getAlias('@web');
?>
<!DOCTYPE html>
<html>
<head>
    <title></title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
 
<body> 
    <p align="center">
        <font size="10" >TASK REPORT</font>
        <br>
        <font size="5" > From <?=$model->from_date;?> To <?=$model->to_date;?> </font>
    </p> 
    <table border="1px" width="100%">
        <thead border="1px">
            <tr>
                <th border="1px" align="center">#</th>
                <th border="1px" align="left">Task Name</th>
                <th border="1px" align="left">Related To</th>
                <th border="1px" align="left">Relate detail</th>
                <th border="1px" align="left">Assign To</th>
                <th border="1px" align="center">Start Date</th>
                <th border="1px" align="center">Due Date</th>
                <th border="1px" align="center">Deadline</th>
                <th border="1px" align="center">Repeat every </th>
                <th border="1px" align="left">Priority</th>
                <th border="1px" align="left">Status</th>
            </tr>
        </thead>
        <tbody border="1px">
            <?php
                $i = 0;
                $status_1 = $status_2 = $status_3 = $status_4 = $status_5 = 0;
                foreach ($taskList as $n) {
                $i = $i + 1;
                $id_task = $n['id'];
                $status = $n['status'];
                if($status ==1){
                    $status_1 = $status_1 + 1;
                }elseif ($status == 2) {
                    $status_2 = $status_2 + 1;
                }elseif ($status == 3) {
                    $status_3 = $status_3 + 1;
                }elseif ($status == 4) {
                    $status_4 = $status_4 + 1;
                }elseif ($status == 5) {
                    $status_5 = $status_5 + 1;
                }elseif ($status == 6) {
                    $status_6 = $status_6 + 1;
                }elseif ($status == 7) {
                    $status_7 = $status_7 + 1;
                }elseif ($status == 8) {
                    $status_8 = $status_8 + 1;
                }else{
                    $status_9 = $status_9 + 1;
                }

            ?>
        <tr>
            <td border="1px" align="center"><?=$i; ?></td>
            <td border="1px" align="center"><?=$n['task_name']; ?></td>
            <td border="1px" align="center">
                <?=\backend\models\TaskRelatedTo::findOne($n['id_related_to'])->name;?>
            </td>
            <td border="1px" align="center">
                <?php
                    if ($n['id_related_to'] == 1) {
                    echo \backend\models\Project::findOne($n['id_related_profile'])->project_name;
                    }
                ?>
            </td>
            <td >
                <?php
                    if ($model->id_employee == "") {
                    $mysql = "select CONCAT(a.first_name,' ', a.last_name ) as name
                    from employee_profile a left join task_member b on a.id = b.id_employee where b.id_task = $id_task;";
                    $task_member = Yii::$app->db->createCommand("
                    $mysql
                    ")->queryAll();
                    }else{
                    $task_member = Yii::$app->db->createCommand("
                    select CONCAT(a.first_name,' ', a.last_name) as name
                    from employee_profile a where a.id = $model->id_employee;
                    ")->queryAll();
                    }
                    foreach ($task_member as $m) {
                    echo $m['name'].",<br/>";
                    }
                ?>
            </td>
            <td border="1px" align="center"><?=$n['start_date']; ?></td>
            <td border="1px" align="center"><?=$n['due_date']; ?></td>
            <td border="1px" align="center"><?=$n['deadline']; ?></td>

            <td border="1px" align="center"><?php
            echo \backend\models\RepeaterType::findOne($n['id_repeater'])->name;?>
            </td>
            <td border="1px" align="left">
                <?=\backend\models\Priority::findOne($n['id_priority'])->name;?>
            </td>
            <td border="1px" align="left">
                <?=\backend\models\TaskStatus::findOne($n['status'])->name;?>
            </td>
        </tr>
        <?php };?>

        </tbody>
    </table> 
<hr>
    <table border="1px" width="100%">
        <tr style="background: #f3f3f3;">
            <th border="1px" align="center">Title</th>
            <th border="1px" align="center">Description</th>
            <th border="1px" align="center">Title</th>
            <th border="1px" align="center">Description</th>
        </tr>
        </tr>
        <tr>
            <td border="1px" align="center">None: </td>
            <td border="1px" align="center"><strong><?=$status_1; ?></strong></td>
            <td border="1px" align="center">Day: </td>
            <td border="1px" align="center"><strong><?=$status_2; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">Week: </td>
            <td border="1px" align="center"><strong><?=$status_3; ?></strong></td>
            <td border="1px" align="center">Month: </td>
            <td border="1px" align="center"><strong><?=$status_4; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">2 Weeks: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
            <td border="1px" align="center">1 Month: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">2 Months: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
            <td border="1px" align="center">3 Months: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">6 Months: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
            <td border="1px" align="center">2 Years: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
        </tr>
        <tr border="1px">
            <td border="1px" align="right" colspan="3">Task Total: </td>
            <td border="1px" align="center"><strong><?=$i; ?></strong></td>
        </tr>
    </table>
  
    <?php
    $timezone = date("D M j Y G:i:s");
    echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
    ?>
 
</body>
</html>