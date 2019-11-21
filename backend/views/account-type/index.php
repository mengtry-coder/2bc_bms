<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use yii\bootstrap\Modal;
use yii\widgets\Pjax;
$class_id = Yii::$app->controller->id;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\BedTypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Account Type';
$this->params['breadcrumbs'][] = ['label' => 'Finance', 'url' => '#'];
$this->params['breadcrumbs'][] = $this->title;
?>
<?php
Modal::begin([
   'header' => 'Account Type',
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
                <tr>
                    <th style="text-align:center;">#</th>
                    <th>Account Type</th>
                    <th class="text-center">Status</th>
                    <th class="text-center"​ width="15%">Actions</th>
                </tr>
            </thead>

        <?php

            echo yii\widgets\ListView::Widget([
                'dataProvider'=> $dataProvider,
                'itemView'=>'_account_detail.php',
                'layout' => "{items}</table>
                    <table width='100%' >
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
    $this->registerJs('
     var controller_id = "account-type";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });

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

    ');
?>
