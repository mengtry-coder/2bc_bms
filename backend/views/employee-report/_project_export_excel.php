<?php
use common\models\App;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();
$report_title = 'PROJECT REPORT';
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
        <font size="10" >PROJECT REPORT</font>
        <br>
        <font size="5" > From <?=$model->from_date;?> To <?=$model->to_date;?> </font>
    </p> 
    <table border="1px" width="100%"> 
        <thead border="1px">
            <tr>
                <th border="1px" align="center">#</th>
                <th>Project Member</th>
                <th>Customer</th>
                <th>Project</th>
                <th border="1px" align="center">Start Date</th>
                <th border="1px" align="center">Deadline</th>
                <th border="1px" align="center">Project Progress</th>
                <th border="1px" align="right">Rate</th>
                <th>Priority</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php

                $i = 0;
                $status_1 = $status_2 = $status_3 = $status_4 = $status_5 = 0;
                foreach ($projectList as $n) {
                $i=$i+1;
                $id_project = $n['id'];
                $status = $n['status'];
                if($status ==1){
                    $status_1 = $status_1 + 1;
                }elseif ($status == 2) {
                    $status_2 = $status_2 + 1;
                }elseif ($status == 3) {
                    $status_3 = $status_3 + 1;
                }elseif ($status == 4) {
                    $status_4 = $status_4 + 1;
                }else{
                    $status_5 = $status_5 + 1;
                }
                $id_customer = $n['id_customer'];
            ?>
        <tr>
            <td border="1px" align="center"><?=$i; ?></td>
            <td >
                <?php
                    if ($model->id_employee == "") {
                    $project_member = Yii::$app->db->createCommand("
                    select CONCAT(a.first_name,' ', a.last_name ) as name
                    from employee_profile a inner join project_member b on a.id = b.id_employee where b.id_project = $id_project;
                    ")->queryAll();
                    }else{
                    $project_member = Yii::$app->db->createCommand("
                    select CONCAT(a.first_name,' ', a.last_name) as name
                    from employee_profile a where a.id = $model->id_employee;
                    ")->queryAll();

                    }

                    foreach ($project_member as $m) {
                    echo $m['name'].",<br/>";
                    }
                ?>
            </td>
            <td border="1px" align="left">
                <?=\backend\models\CustomerProfile::findOne($id_customer)->customer_name;?>
            </td>
            <td border="1px" align="left"><?=$n['project_name']; ?></td>
            <td border="1px" align="center"><?=$n['start_date']; ?></td>
            <td border="1px" align="center"><?=$n['deadline']; ?></td>
            <td border="1px" align="center"><?=$n['project_progress'] == "" ? "0" : $n['project_progress'];?>%</td>

            <td border="1px" align="right">$ <?=$n['rate'];?></td>
            <td border="1px" align="left">
                <?=\backend\models\Priority::findOne($n['id_priority'])->name;?>
            </td>
            <td border="1px" align="left">
                <?=\backend\models\ProjectStatus::findOne($n['status'])->name;?>
            </td>
        </tr>
        <?php };?>

        </tbody>
    </table>
    <hr/> 
    <div align="left">REPORT SUMMARY</div> 
    <table border="1px" align="right" width="40%">
        <tr style="background: #f3f3f3;">
            <th border="1px" align="center">Title</th>
            <th border="1px" align="center">Description</th>
        </tr>
        </tr>
        <tr>
            <td border="1px" align="center">Not Started: </td>
            <td border="1px" align="center"><strong><?=$status_1; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">In Progress: </td>
            <td border="1px" align="center"><strong><?=$status_2; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">On Hold: </td>
            <td border="1px" align="center"><strong><?=$status_3; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">Cancelled: </td>
            <td border="1px" align="center"><strong><?=$status_4; ?></strong></td>
        </tr>
        <tr>
            <td border="1px" align="center">Finished: </td>
            <td border="1px" align="center"><strong><?=$status_5; ?></strong></td>
        </tr>
        <tr border="1px">
            <td border="1px" align="center">Project Total: </td>
            <td border="1px" align="center"><strong><?=$i; ?></strong></td>
        </tr>
    </table> 
    <?php
    $timezone = date("D M j Y G:i:s");
    echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
    ?>
 
</body>
</html>