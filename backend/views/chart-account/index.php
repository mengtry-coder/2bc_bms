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

    $this->title = 'Chart of Account';
    $this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
    $this->params['breadcrumbs'][] = $this->title;

    $data = ChartAccount::find()->where(['!=','is_parent',0])->orderBy(['id_account_type'=>SORT_ASC])->asArray()->all();

    $count = $dataProvider->getCount();

?>
 
<?php
   Modal::begin([
       'header' => 'Chart of Account',
       'id' => 'modal',
       'size' => 'modal-lg',
   ]);
   echo "<div id='modalContent'></div>";
   Modal::end();
?>
<style type="text/css">
    #footer {
        position: relative !important;
    }
</style>
<div class="panel">
    <div class="panel-body">

        <div class="row">
            <div class="col-md-12">
            <?= $this->render('_search', ['model' => $searchModel]); ?>
                
            </div>
        </div>
        <br>
      
        <table class="tablesaw table-hover table m-b-0 tablesaw-swipe">
            <thead>
                <tr style="">
                    <th style="text-align:center;">#</th>
                    <th style="text-align:left;">Number</th>
                    <th>Chart of Account</th>
                    <th>Account Type</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Actions</th>
                </tr>
            </thead>
            <?php

            echo yii\widgets\ListView::Widget([
                'dataProvider'=> $dataProvider,
                'viewParams'=>[
                    'data' => $data
                ],
                // 'itemView'=>'_chart_account_detail.php',
                'itemView'=>'_detail.php',
                'layout' => "{items}</table>
                    <table width='100%'>
                        <tr>
                            <td style='width:33%; text-align:left;' colspan='2'>
                                <label class='form-inline'>
                                    Show ".
                                Html::dropDownList('page_size',
                                $page_size,
                                Yii::$app->params['page_size'],
                                array('class' => 'form-control', 'id' => 'select_page_size'))."
                                </label>
                            </td>
                            <td style='width:33%; text-align:center;' colspan='2'>{summary}</td>
                            <td style='width:33%; text-align:right;' colspan='2'>{pager}</td>
                        </tr>
                    </table>",
                'pager' => [
                        'firstPageLabel' => 'First',
                        'lastPageLabel' => 'Last',
                        'maxButtonCount' => 5,
                    ],
            ]);

            ?>

        </table>
    </div>
</div>
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
                    <td></td>
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
            echo    '</td>
                    <td style="text-align: center;">
                        <button type="button" id="modalButtonUpdate" class="btn btn-xs btn-default" value="'."$url".'/update?id='.$value['id'].'">
                            <i class="fa fa-pencil"></i>
                        </button>
                        <a class="btn btn-xs btn-default" href="'."$url".'/delete?id='.$value['id'].'"data-method="post" data-confirm="Are you sure want to delete this record?">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>';          
      
            findChild($array,$value['id'],$text_index);
        }
    }else{
    
        return false;
    }
}

function btnAction($array,$parent_id){
  $url = Url::toRoute('/chart-account');
  $btnacton = arrayFilterByColumn($array,'is_parent',$parent_id);

  if(!empty($btnacton)){
     
    foreach ($btnacton as $key => $value) {  
     
          echo '<td style="text-align: center;">';
            echo '<button type="button" id="modalButtonUpdate" class="btn btn-xs btn-default" value="'."$url".'/update?id='.$value['id'].'"><i class="fa fa-pencil"></i></button>';
            echo '<a class="btn btn-xs btn-default" href="'."$url".'/delete?id='.$value['id'].'"data-method="post" data-confirm="Are you sure want to delete this record?" ><i class="fa fa-trash"></i></a>';
          echo '</td>';
       
      btnAction($array,$value['id']);
      
    }
    
  }else{
    
    return false;
  }
}

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

function recordStatus($array,$parent_id){ 
  $recordStatus = arrayFilterByColumn($array,'is_parent',$parent_id);

    if(!empty($recordStatus)){
     
        foreach ($recordStatus as $key => $value) {
          
              echo '<td style="padding: 7px !important; text-align: center;">';
                  $status = $value["status"]==1? '<span class="label label-info">Active</span>':'<span class="label label-warning">Inactive</span>'; 
                  echo "$status";
              echo'</td>';    
      
          recordStatus($array,$value['id']);
          
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

<!-- maco====== -->

<?php
    $this->registerJs('
        var controller_id = "chart-account";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });

        $(".modal-dialog").removeClass("modal-xl").addClass("modal-md");

    ');

$script = <<<JS
    
    $('#btn_print').on('click',function(){
        $('input[name=btn_doc]').val("print");
        $('#chart_account_search').submit();
        return false;
    });

    $('#btn_pdf').on('click',function(){
        $('input[name=btn_doc]').val("pdf");
        $('#chart_account_search').submit();
        return false;
    });
    $('#btn_excel').on('click',function(){
        $('input[name=btn_doc]').val("excel");
        $('#chart_account_search').submit();
        return false;
    });

    $("#btn_print,#btn_pdf,#btn_excel").attr('disabled',true).css("cursor", "no-drop");
    
    var rowCount = '$count'    

    if(rowCount > 0){        
        $("#btn_print").removeAttr('disabled').css("cursor", "pointer");
    }else{        
        $("#btn_print").attr('disabled',true).css("cursor", "no-drop");        
    }

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
    });

    $(document).on("click","#modalButtonUpdate",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
    });

JS;

$this->registerJs($script);

?>
