<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\grid\GridView;
use backend\models\EmployeeProfile;
use yii\helpers\ArrayHelper;


$class_id = Yii::$app->controller->action->id;
$employee = Yii::$app->db->createCommand("SELECT CONCAT(id_prefix,' ',first_name,' ',last_name) as name FROM employee_profile WHERE id = $model->id_employee")->queryScalar();
$this->title =  $employee." / Budget Setup for ".$model->year;

$this->params['breadcrumbs'][] = ['label' => 'Budget Setup', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$budget_setup_id_list = \backend\models\BudgetSetUpData::find()->where(['id_budget_set_up'=>$model->id])->all();
if(isset($_GET['id'])){
    @$id_project = $_GET['id'];
}

function calculateProgress($current, $all){
    if($all == 0){
        $all = 1;
    }
    $result = ($current / $all) * 100;
    return number_format($result,2);
}

?>

<style type="text/css">
    .header_detail {
    color: #fff;
    background: #f87233;
    padding: 10px;
    margin-top: -40px;
    }
    .wr-content {
      border: 1px solid #ededed;
      padding: 20px;
      height: 110px;
      overflow-x: hidden;
      overflow-y: auto;
    }
    h3.panel-title {
    background: #e8e8e8;
    }
    .panel-title-inline {
        font-size: 16px;
    }
    .modal-ml{
        width: 60%;
    }

    .col-xs-5r,
    .col-sm-5r,
    .col-md-5r,
    .col-lg-5r {
        position: relative;
        min-height: 1px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .col-xs-5r {
        width: 20%;
        float: left;
    }

    @media (min-width: 768px) {
        .col-sm-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 992px) {
        .col-md-5r {
            width: 20%;
            float: left;
        }
    }

    @media (min-width: 1200px) {
        .col-lg-5r {
            width: 20%;
            float: left;
        }
    }
    .media-body span {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100px;
    }
</style>

<div class="employee-profile-profile">
    <?= $this->render('//budget-set-up/_top_tab'); ?>

    <div class="panel" style="border-top-left-radius: 0px;">
        <div class="panel-body">
            <?= $this->render('//budget-set-up/_top_header'); ?>
            <p class="text-main text-bold"><?= $this->title; ?></p>
        <hr>
        <div class="row  panel">
            <div class="panel-bodyx">
              <div class="col-md-6">
                <div class="panel-heading">
                    <h3 class="panel-title">OVERVIEW</h3>
                </div>
                <table class="table table-striped table-hover" width="100%" cellspacing="0"><thead>
                <tr>
                  <th>Employee</th>
                  <td>
                    <?=$employee;?>
                  </td>
                  <th>Year</th>
                  <td><?=$model->year; ?></td>
                </tr>
                <tr>
                  <th>Budget Value</th>
                  <td><?=$model->unit_type;?> <?= number_format($model->budget_value, 2); ?></td>
                  <th>Actual Value</th>
                  <td><?=$model->unit_type;?> <?= number_format($model->actual, 2); ?></td>
                </tr>
                <tr>
                  <th>Under / Over</th>
                  <td><?=$model->unit_type;?> <?= number_format($model->under_or_over, 2); ?></td>
                  <th>status</th>
                  <td><?= $model->status == 1 ? "Active" : "Inactive"; ?></td>
                </tr>
               </table>
              </div>
              <div class="wr-note">
                <div class="panel-body">
                  <div class="col-md-6">
                    <div class="panel-heading" style="margin-top: -15px;">
                        <h3 class="panel-title">NOTE:</h3>
                    </div>
                    <div class="panel-body wr-content">
                      <?=$model->note; ?>

                    </div>
                  </div>
                </div>
              </div>

            </div>
        </div>
        <h3 class="text-center header_detail">Budet Plan Detail:</h3>

            <div class="row task-overview">
                <div class="panel">
                    <div class="panel-body">
                         <div class="row">
                            <div class="col-md-12">
                              <div class="row">


                                  <table class="table table-striped table-hover list-detail" width="100%" cellspacing="0"><thead>
                                    <tr style="background: #24476a;color: #fff;">
                                      <th>No</th>
                                      <th>Month</th>
                                      <th>Daily</th>
                                      <th>Weekly</th>
                                      <th>Monthly</th>
                                    </tr>
                                      <?php
                                      $i = 0;
                                      foreach ($budget_setup_id_list as $n):
                                        $i = $i+1;
                                        ?>
                                        <tr>

                                        <td>
                                          <?php echo $i; ?>
                                        </td>
                                        <td>
                                          <?php
                                          $id_month = $n['id_month'];
                                          echo \backend\models\MonthList::findOne(['id'=>$id_month])->name;?>
                                        </td>
                                        <td>
                                          <?=$model->unit_type; ?> <?= number_format($n['daily'], 2); ?>
                                        </td>
                                        <td>
                                          <?=$model->unit_type; ?> <?= number_format($n['weekly'], 2); ?>
                                        </td>
                                        <td>
                                          <?=$model->unit_type; ?> <?= number_format($n['monthly'], 2); ?>
                                        </td>
                                      </tr>
                                      <?php if ($i == 3): ?>
                                        <tr style="background: #f7f7f7;font-weight: bold;">
                                          <td colspan="4" class="text-right" style="text-align: right;">Quarterly:</td>
                                          <td><?=$model->unit_type; ?> <?= number_format($model->quarter_1, 2);?></td>
                                        </tr>
                                      <?php endif; ?>
                                      <?php if ($i == 6): ?>
                                        <tr style="background: #f7f7f7;font-weight: bold;">
                                          <td colspan="4" class="text-right" style="text-align: right;">Quarterly:</td>
                                          <td><?=$model->unit_type; ?> <?= number_format($model->quarter_2, 2);?></td>
                                        </tr>
                                      <?php endif; ?>
                                      <?php if ($i == 9): ?>
                                        <tr style="background: #f7f7f7;font-weight: bold;">
                                          <td colspan="4" class="text-right" style="text-align: right;">Quarterly:</td>
                                          <td><?=$model->unit_type; ?> <?= number_format($model->quarter_3, 2);?></td>
                                        </tr>
                                      <?php endif; ?>
                                      <?php if ($i == 12): ?>
                                        <tr style="background: #f7f7f7;font-weight: bold;">
                                          <td colspan="4" class="text-right" style="text-align: right;">Quarterly:</td>
                                          <td><?=$model->unit_type; ?> <?= number_format($model->quarter_4, 2);?></td>
                                        </tr>
                                      <?php endif; ?>
                                      <?php endforeach; ?>
                                      <tr style="background: #24476a;font-weight: bold;color: #fff;">
                                        <td colspan="4" class="text-right" style="text-align: right;">Yearly:</td>
                                        <td><?=$model->unit_type; ?> <?= number_format($model->budget_value, 2);?></td>
                                      </tr>
                                  </table>

                            </div>

                            </div>
                        </div>
                        <br>

                    <?php
                        Modal::begin([
                            'header' => ' <h4 class="modal-title">'.'Budget Setup'.'</h4>',
                            'id' => 'modal',
                            'class' => 'modal fade',
                            'size' => 'modal-lg',
                        ]);
                        echo "<div id='modalContent'></div>";
                        Modal::end();

                    ?>

                </div>

            </div>
        </div>
    </div>
</div>

<style media="screen">
a.<?=$class_id;?>{cursor: default; background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a:hover{background-color: white !important; border-bottom: 2px solid white !important;}
  .fa_style li a{background-color: #dbe3ec;transition: background-color,0.3s;}
  .modal-dialog.modal-lg {
    width: 90%;
}
.list-detail td{ text-align: center;}
.list-detail th{color: #fff !important; text-align: center;}
.panel-title{
    background-color: #25476a !important;
    border-color: #25476a;
    color: #fff;
}
</style>

<?php
$this->registerJs('
        var controller_id = "project";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&id_project='.$model->id.'&page_size="+page_size);
        });

        $(document).on("click","#modalButton, #modalButtonView, #modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
            var title = $(this).data("title");
            $("#modal").find(".modal-title").html(title);
        });

    ');
?>
