<?php

use yii\helpers\Html; 
use yii\helpers\Url;
use yii\bootstrap\Modal;

// @$id_project = $_GET['id_project'];

if(isset($_GET['id_project'])){
    @$id_project = $_GET['id_project'];
}

if(isset($_GET['id'])){
    @$id_project = $_GET['id'];
}

$model = \backend\models\Project::findOne($id_project);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>

    <div class="btn-group dropdown pull-right">
        <button class="btn btn-mint btn-active-mint btn-labeled dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
            <i class="btn-label demo-pli-dot-vertical"></i> More
        </button>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a class="button-pin" data-value="<?= Url::to(['project/pin', 'id' => $model->id]); ?>" title="Pin Project" data-confirm="Are you sure want to pin this project?" data-method="post"><?= $model->is_pin == 1 ?'Unpin Project': 'Pin Project' ?></a></li>
            <li><a href="#" value="<?= Url::to(['project/copy', 'id' => $model->id]); ?>" data-title="Copy Project : <?= $model->project_name ?>" id='modalButton'>Copy Project</a></li>
            <li><a href="#" value="<?= Url::to(['project/update', 'id' => $model->id]); ?>" data-title="Update Project : <?= $model->project_name ?>" id='modalButton'>Update Project</a></li>
            <li class="divider"></li>
            <li><a class="button-delete" data-value="<?= Url::to(['project/delete', 'id' => $model->id]); ?>" title="Delete" data-confirm="Are you sure want to delete this file?" data-method="post">Delete Project</a></li>
        </ul>
    </div>
    <button class="btn btn-purple btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['customer-invoice/create','project_id'=>$id_project]) ?>" data-title="New Invoice" id='modalButtonInvoice'>
        <i class="btn-label demo-pli-coin"></i> Invoice Project
    </button>
    <button class="btn btn-dark btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['expense/create','project_id'=>$id_project]) ?>" data-title="New Expense" id='modalButtonInvoice'>
        <i class="btn-label demo-pli-basket-coins"></i> Expense Project
    </button>
    <button class="btn btn-info btn-labeled pull-right mar-rgt" value="<?= Url::toRoute(['task/create','source_id'=>$id_project, 'type'=>1]) ?>" data-title="New Task" id='modalButtonInvoice'>
        <i class="btn-label demo-psi-file-add"></i> New Task
    </button>
<style type="text/css">
    .modal-task {
        width: 60% !important;
    }
    .modal-invoice {
        width: 95% !important;
    }
</style>
<?php 

    Modal::begin([
        'header' => ' <h4 class="modal-title">Title</h4>',
        'id' => 'modal',
        'class' => 'modal fade',
        'size' => 'modal-task',
        ]);
    echo "<div id='modalContent'></div>";
    Modal::end();

$script = <<<JS

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        var title = $(this).data("title");
        $("#modal").find(".modal-title").html(title);
        $(".modal-dialog").removeClass("modal-invoice").addClass("modal-task");
    });

    $(document).on("click","#modalButtonInvoice",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        var title = $(this).data("title");
        $("#modal").find(".modal-title").html(title);
        $(".modal-dialog").removeClass("modal-task").addClass("modal-invoice");
    });

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-delete')){
            swal({
                text: "Are you sure you want to delete this project?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
        else if($(this).hasClass('button-pin')){
            if("$model->is_pin" == 1){
                var pin_string = 'unpin';
            }else{
                var pin_string = 'pin';
            }
            swal({
                text: "Are you sure you want to "+pin_string+" this project?",
                icon: "warning",
                buttons: true,
                buttons: [
                    'No',
                    'Yes'
                ],
                dangerMode: false
            }).then(function(isConfirm) {
                if (isConfirm) {
                    $.post(val); // <--- submit form programmatically
                    $('#overlay').css({'display':'block','z-index':'9999'});
                }
            });
        }
        else{
            var i = confirm(message);
            if(i == 1 ){
                $.post($(this).attr('href'));
            }else{
                return false;
            }
        }
    };

JS;

$this->registerJs($script);

?>