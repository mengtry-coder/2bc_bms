<?php
use common\models\App;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();
$report_title = 'Sale Report by Invoice';
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
        <font size="10" > SALE REPORT by INVOICE </font>
        <br>
        <font size="5" > From <?=$model->from_date;?> To <?=$model->to_date;?> </font>
    </p> 
    <table border="1px" width="100%">
        <thead border="1px">
            <tr border="1px">
                <th border="1px" align="center">No.</th>
                <th border="1px" align="left">Invoice</th>
                <th border="1px" align="center">Date</th>
                <th border="1px" align="left">Customer</th>
                <th border="1px" align="left">Project</th>
                <th border="1px" align="center">Status</th> 
                <th border="1px" align="right">Total</th>
                <th border="1px" align="right">Receive</th>
                <th border="1px" align="right">Balance</th>
                
            </tr>
        </thead>
        <tbody>
            <?php   
                $totalAmount = 0;
                $receiveAmount = 0;
                $balanceAmount = 0;
                $rang_no = 1;
                foreach($invoiceData as $key => $value){
                    $totalAmount += $value['total_amount'];
                    $receiveAmount += $value['receive_amount'];
                    $balanceAmount += $value['balance_amount'];
            ?>  
            <tr border="1px">
                <td border="1px" align="center"><?=$rang_no++;?></td>
                <td border="1px" align="left"><?=$value['doc_id'];?></td>
                <td border="1px" align="center"><?=$value['date'];?></td>
                <td border="1px" align="left"><?=$value['customer_name'];?></td>
                <td border="1px" align="left"><?=$value['project_name'];?></td>
                <td border="1px" align="center"><?=$value['status'];?></td>
                <td border="1px" align="right"><?='$ '.number_format($value['total_amount'],2);?></td>
                <td border="1px" align="right"><?='$ '.number_format($value['receive_amount'],2);?></td>
                <td border="1px" align="right"><?='$ '.number_format($value['balance_amount'],2);?></td> 
            </tr>
            <?php }?>
            <tr border="1px">
                <td border="1px"  colspan="6">
                    <div style="text-align:right;" align="right">Total</div>
                </td>
                <td border="1px" colspan="1">
                    <div style="text-align:right;" align="right"><?='$ '.number_format($totalAmount,2);?></div>
                </td>
                <td border="1px" colspan="1">
                    <div style="text-align:right;" align="right"><?='$ '.number_format($receiveAmount,2);?></div>
                </td>
                <td border="1px" colspan="1">
                    <div style="text-align:right;" align="right"><?='$ '.number_format($balanceAmount,2);?></div>
                </td>
            </tr>
        </tbody>
    </table>
    <?php 
    $timezone = date("D M j Y G:i:s"); 
    echo "<div class='text-sm text-left'>".$userData['first_name']." ".$userData['last_name'].", ". $timezone."</div>";
    ?>
 
</body>
</html>