<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use yii\bootstrap\Modal;
use yii\widgets\Pjax;
use backend\models\AccountType;
use backend\models\ChartAccount;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\BedTypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

    $this->title = 'Print Chart Account';

    $base_url =  Yii::getAlias('@web');
    
    $data = ChartAccount::find()->where(['!=','is_parent',0])->orderBy(['id_account_type'=>SORT_ASC])->asArray()->all();

    $border = "0";

    if($btn_doc == "excel"){

        $border = "1px";

        $date_title = date('d M Y');
        $title = 'Chart of Account';
        $delimiter = '-';
        $file_name =  strtolower(trim(preg_replace('/[\s-]+/', $delimiter, preg_replace('/[^A-Za-z0-9-]+/', $delimiter, preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $title))))), $delimiter)).'-upto-'.$date_title;

        header("Content-type: application/vnd.ms-excel;charset:UTF-8"); 
        header("Content-Disposition: attachment;filename=$file_name.xls");
    }
    
?>

<!DOCTYPE html>
<html>
<head>

    <style type="text/css">
        
        .form-inline,.summary,.btn_action,.pagination{
            display: none !important;
        }

        body {
            padding-top: -20px;
            margin: 0;
            padding: 0;
            background-color: white;
          /*  background-color: #FAFAFA;*/
            font: 10px "Tahoma";
        }

        .pageA4 {
            padding: 0.05cm;
            margin: 0cm auto;    
        }
        @media print {
            .page { 
                width: initial;
                min-height: initial;
                margin: initial;
                border: initial;
                border-radius: initial;
               
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        }

        <?php
    if ($btn_doc == "excel"){
    ?>
        TD{font-size: 12px;}
        TH{font-size: 12px;color:black;}

        table thead tr th{
            font-weight: inherit;
            font-size: 12px;
            padding: 5px;
        }
        td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow:ellipsis;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        tr, td {
            padding: 5px;
        }
    <?php
        }else{
    ?>   
        
        table {
            font-size: 10px;
            font-weight: inherit;       
            padding: 5px;
            width: 100%;
            border-collapse: collapse;
            border: 0.5px solid #afafaf; 
        }

        table, tr {
             border: 0.5px solid #afafaf;
             text-align: left;
             }

        table tbody tr, td {
            font-weight: inherit;        
            padding: 5px;
            border-collapse: collapse;
            border-color: #afafaf;
        }

        td{
            border: none !important;
            padding-left: 5px;
        }

        th {
            text-align: left;
            height: 25px;
            color:black; 
            padding-left: 5px;             
        }

    <?php
        }
    ?>

        .text-center{
            text-align: center;
        }
    </style>
</head>
<body onLoad="window.print();" onMouseMove="window.location='<?= $base_url; ?>/chart-account/index';" style="margin: 0px;">
    
    <div class="pageA4">
        <table border="<?=$border?>">
            <thead style='background-color: #e1e2e147 !important; color:#3d3d3d'>
                <tr style="">
                    <th width="5%" style="text-align:center;">#</th>
                    <th width="7%" style="text-align:left;">Number</th>
                    <th width="60%">Chart of Account</th>
                    <th width="23%">Account Type Name</th>
                    <th width="5%" class="text-center">Status</th>            
                </tr>
            </thead>
            <?php

            echo yii\widgets\ListView::Widget([
                'dataProvider'=> $dataProvider,
                'viewParams'=>[
                    'data' => $data
                ],
                
                'itemView'=>'_detail.php',    
            ]);

            ?>
        </table>
    </div>
</body>
</html>
<script type="text/javascript">
    var css = '@page { size: portrait; }',
    head = document.head || document.getElementsByTagName('head')[0],
    style = document.createElement('style');

style.type = 'text/css';
style.media = 'print';

if (style.styleSheet){
  style.styleSheet.cssText = css;
} else {
  style.appendChild(document.createTextNode(css));
}

head.appendChild(style);

// window.print();
</script>

<?php
// FUNCTION UNSET ARRAY
function arrayFilterByColumn($array,$column,$value){
    $result = [];
    if(!empty($array)){
        foreach ($array as $key => $arr) {
          // ini_set('memory_limit', '-1');
            if($arr[$column] == $value){
                array_push($result, $arr);

            }
        }
        return $result;
    }else{
        return [];
    }  
}

function findChild($array,$parent_id,$text_index){

    $url = Url::toRoute('/chart-account');
    $children = arrayFilterByColumn($array,'is_parent',$parent_id);    

    if(!empty($children)){
        $text_index += 50;
        foreach ($children as $key => $value) {
            //chartAccountNumber($children,$parent_id)
            echo '<tr>
                    <td style="border: none"></td>
                    <td style="text-align: left; text-indent: '.($text_index ).'px;">'
                        .$value['number_code'].
                    '</td>
                    <td style="text-align: left; text-indent: '.($text_index ).'px;">'
                        .$value['names'].
                    '</td>
                    <td style="text-align: left;">'
                        .AccountType::find()->where(['=', 'id', $value['id_account_type']])->one()->names.
                    '</td>
                    <td style="text-align: center;">';

                        if($value["status"]==1){
                            echo '<span class="label label-info">Active</span>';
                        }else{
                            echo '<span class="label label-warning">Inactive</span>';
                        }
                      
      
            findChild($array,$value['id'],$text_index);
        }
    }else{
    
        return false;
    }
}

// function btnAction($array,$parent_id){
//   $url = Url::toRoute('/chart-account');
//   $btnacton = arrayFilterByColumn($array,'is_parent',$parent_id);

//   if(!empty($btnacton)){
     
//     foreach ($btnacton as $key => $value) {  
     
//           echo '<td style="text-align: center;">';
//             echo '<button type="button" id="modalButtonView" class="btn btn-xs btn-default" value="'."$url".'/view&id='.$value['id'].'"><i class="fa fa-search"></i></button>';
//             echo '<button type="button" id="modalButtonView" class="btn btn-xs btn-default" value="'."$url".'/update&id='.$value['id'].'" style="margin:0px 5px;"><i class="fa fa-pencil"></i></button>';
//             echo '<a class="btn btn-xs btn-default" href="'."$url".'/delete&id='.$value['id'].'"data-method="post" data-confirm="Are you sure want to delete this record?" ><i class="fa fa-trash"></i></a>';
//           echo '</td>';
       
//       btnAction($array,$value['id']);
      
//     }
    
//   }else{
    
//     return false;
//   }
// }

function accountType($array,$parent_id){ 
  $recordStatus = arrayFilterByColumn($array,'is_parent',$parent_id);

  if(!empty($recordStatus)){
     
    foreach ($recordStatus as $key => $value) {  
     
          echo '<td style="padding: 7px !important; text-align: left;">';
               echo AccountType::find()->where(['=', 'id', $value['id_account_type']])->one()->names; 
          echo'</td>';     
  
      accountType($array,$value['id']);
      
    }
    
  }else{
    return false;
  }
}


function chartAccountNumber($array,$parent_id){ 
  $recordStatus = arrayFilterByColumn($array,'is_parent',$parent_id);

    if(!empty($recordStatus)){
     
        foreach ($recordStatus as $key => $value) {   
          
            echo '<td style="padding: 7px !important; text-align: center;">';
                echo empty($value['number_code'])==true?0:$value['number_code'];
            echo'</td>';     
      
            chartAccountNumber($array,$value['id']);
          
        }
    
    }else{
        return false;
    }
}

?>

