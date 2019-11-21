<?php
use common\models\App;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();
$report_title = 'EMPLOYEE REPORT';
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
        <font size="10" >EMPLOYEE REPORT</font>
        <br>
        <font size="5" > From <?=$model->from_date;?> To <?=$model->to_date;?> </font>
    </p> 
    <table border="1px" width="100%">
        <thead  border="1px">
            <tr border="1px">
                <th border="1px" align="center">#</th>
                <th border="1px" align="center">Employee</th>
                <th border="1px" align="center">Position</th>
                <th border="1px" align="center">Department</th>
                <th border="1px" align="center">Email</th>
                <th border="1px" align="center">Phone Number</th>
                <th border="1px" align="center">DOB</th>
                <th border="1px" align="center">Join Date</th>
                <th border="1px" align="center">Status</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $i = 0;
                $status_1 = $status_2 = $status_3 = $status_4 = $status_5 = 0;
                foreach ($employeeList as $n) {
                $i=$i+1;
                $id_employee = $n['id'];
                $employee_name = $n['first_name'] ." ". $n['last_name'];
                $status = $n['status'];
                if($status ==1){
                    $status_1 = $status_1 + 1;
                }elseif ($status == 2) {
                    $status_2 = $status_2 + 1;
                }
                $id_employee = $n['id'];
            ?>
        <tr border="1px">
            <td border="1px" align="center"><?=$i; ?></td>
            <td border="1px" align="center"><?=$employee_name; ?></td>
            <td border="1px" align="center">
                <?=\backend\models\EmployeePosition::findOne($n['id_position'])->position_type;?>
            </td>
            <td border="1px" align="center">

                <?php
                $id_department = \backend\models\EmployeePosition::findOne($n['id_position'])->id_department;
                echo \backend\models\Department::findOne($id_department)->name;?>
            </td>
            <td border="1px" align="center"><?=$n['email']; ?></td>
            <td border="1px" align="center"><?=$n['phone_number']; ?></td>
            <td border="1px" align="center"><?=$n['date_of_birth']; ?></td>
            <td border="1px" align="center"><?=$n['join_date']; ?></td>
            <td border="1px" align="center">
                <?=$n['status'] = 1 ? "Active" : "Inactive";  ?>
            </td>
        </tr>
        <?php };?>
        </tbody>
    </table>  
    <div align="left">REPORT SUMMARY</div> 
    <table border="1px" align="right" width="40%">
        <thead  border="1px"> 
            <tr align="right" border="1px" bgcolor="#f3f3f3">
                <th border="1px" align="center">Title</th>
                <th border="1px" align="center">Description</th>
            </tr>
        </thead> 
        <tbody border="1px">
            <tr align="right" border="1px">
                <td border="1px" align="center">Active: </td>
                <td border="1px" align="center"><strong><?=$status_1; ?></strong></td>
            </tr>
            <tr align="right" border="1px">
                <td border="1px" align="center">Inactive: </td>
                <td border="1px" align="center"><strong><?=$status_2; ?></strong></td>
            </tr>
            <tr align="right" border="1px">
                <td border="1px" align="center">Total: </td>
                <td border="1px" align="center"><strong><?=$i; ?></strong></td>
            </tr>
        </tbody>
    </table> 
    
    <?php 
    $timezone = date("D M j Y G:i:s"); 
    echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
    ?>
 
</body>
</html>