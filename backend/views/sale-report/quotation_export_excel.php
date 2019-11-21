<?php
use common\models\App;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
$userid  = Yii::$app->user->getId();
$command = Yii::$app->db->createCommand("select * from user where id = $userid");
$userData = $command->queryOne();
$report_title = 'Sale Report by Quotation';
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
        <font size="10" > SALE REPORT by QUOTATION </font>
        <br>
        <font size="5" > From <?=$model->from_date;?> To <?=$model->to_date;?> </font>
    </p> 
    <table border="1px" width="100%">
        <thead border="1px">
            <tr border="1px">
                <th border="1px" align="left">No.</th>
                <th border="1px" align="left">Code</th>
                <th border="1px" align="left">Customer</th>  
                <th border="1px" align="center">Date</th>
                <th border="1px" align="center">Open Till</th>
                <th border="1px" align="center">Is Converted</th> 
                <th border="1px" align="center">Status</th> 
                <th border="1px" align="right">Total</th> 
            </tr>
        </thead>
        <tbody>
            <?php  
                $total = 0; 
                $rang_no = 1;
                foreach($invoiceData as $key => $value){
                    $total += $value['total']; 
            ?>  
            <tr border="1px">
                <td border="1px" align="left"><?=$rang_no++;?></td>
                <td border="1px" align="left"><?=$value['code'];?></td>
                <td border="1px" align="left"><?=$value['customer_name'];?></td>
                <td border="1px" align="center"><?=$value['date'];?></td>
                <td border="1px" align="center"><?=$value['open_till'];?></td>
                <td border="1px" align="center"><?=$value['is_converted'];?></td>
                <td border="1px" align="center"><?=$value['status'];?></td>
                <td border="1px" align="right"><?='$ '.number_format($value['total'],2);?></td> 
            </tr>
            <?php }?>
            <tr border="1px">
                <td border="1px" align="right" colspan="7">
                    <div class="text-bold text-right">Total</div>
                </td>
                <td border="1px" align="right" colspan="1">
                    <div class="text-bold text-right"><?='$ '.number_format($total,2);?></div>
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