<?php 

use yii\widgets\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url; 
use dominus77\sweetalert2\assets\SweetAlert2Asset;

SweetAlert2Asset::register($this);

$this->title = $model_task->task_name;
$this->params['breadcrumbs'][] = ['label' => 'All Task', 'url' => ['project/my-task','user'=>Yii::$app->user->getId()]];
$this->params['breadcrumbs'][] = $this->title;

?>
<style type="text/css">
    .row_line {
        padding-bottom: 15px;
    }
    .form-control-static {
        border: 1px solid rgba(0, 0, 0, 0.07);
        padding-left: 5px;
    }
    .sticky {
        position: fixed;
        top: 0;
        width: 100%;
        background: #fff;
        z-index: 9999;
        box-shadow: 0px 1px 10px rgba(204, 204, 204, 0.75);
        left: 0;
        padding-left: 2%;
        padding-right: 2%;
        transition: .5s;
        -webkit-transition: .5s;
    }
</style>
        <div id="headerFixed" class="fixed-header">
            <h3>Check List</h3>
            <div class="progress progress-lg">
                <div style="width: 0%;" id="check_list_progress" class="progress-bar progress-bar-info">0%</div>
            </div>
            <input type="hidden" name="task_progress">
        </div>

        <div class="calculate_item">
            <?php 
                if(!empty($model_item)){
                $i = 0;
                foreach ($model_item as $key => $value) {
                    $i++;
            ?>
                <div class="row row_line" data-id="<?= $value->id ?>" id="row_line_<?= $value->id ?>">
                    <div class="col-md-12 col-xs-12 text-left bord-all pad-all">
                        <input class="magic-checkbox checklist_box" <?= $value->status == 1 ?"checked":'' ?> value="1" name="checklist_box[]" type="checkbox" data-id="<?= $value->id ?>" id="checkbox_list_<?= $value->id ?>">
                        <label for="checkbox_list_<?= $value->id ?>" data-id="<?= $value->id ?>"><?= $value->description ?></label>
                        <input type="hidden" name="check_list_status[]" value="<?= $value->status ?>" data-id="<?= $value->id ?>" id="check_list_status_<?= $value->id ?>">
                    </div>
                </div>
            <?php 
                }
                }
            ?>
        </div>


<?php

$script = <<<JS

    window.onscroll = function() {headerFixed()};

    var header = document.getElementById("headerFixed");
    var sticky = header.offsetTop;

    function headerFixed() {
      if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
      } else {
        header.classList.remove("sticky");
      }
    }


    checkListProgress();

    function checkListProgress(){

        var numberOfChecked = $('.checklist_box:checkbox:checked').length;
        var totalCheckboxes = $('.checklist_box:checkbox').length;
        if(totalCheckboxes == 0){
            totalCheckboxes = 1;
        }
        var percentage = (numberOfChecked / totalCheckboxes ) * 100;
        percentage = parseFloat(percentage).toFixed(2);

        $("#check_list_progress").text(percentage +"%");
        $("#check_list_progress").css("width", percentage+"%");

        $(".checklist_box").change(function(){
            var numberOfChecked = $('.checklist_box:checkbox:checked').length;
            var totalCheckboxes = $('.checklist_box:checkbox').length;
            if(totalCheckboxes == 0){
                totalCheckboxes = 1;
            }
            var percentage = (numberOfChecked / totalCheckboxes ) * 100;
            percentage = parseFloat(percentage).toFixed(2);

            $("#check_list_progress").text(percentage +"%");
            $("#task_progress").val(percentage);
            $("#check_list_progress").css("width", percentage+"%");
            
            var id = $(this).data('id');
            if($(this).is(':checked')){
                $("#check_list_status_"+id).val(1);
            }else{
                $("#check_list_status_"+id).val(0);
            }

        });
    
    }


    $(".checklist_box").click(function(){

        if($(this).is(':checked')){
            var id_activity = $(this).data('id');
            var id_task = $task_id;
            $.ajax({
                url: '',
                type: 'post',
                data: {
                    id_activity: id_activity,
                    id_task: id_task,
                    action: 'add_activity'
                },
                success: function(data){
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });

                    Toast.fire({
                        type: 'success',
                        title: 'Update successfully'
                    })
                },
                error:function(response){
                    console.log(response);
                }
            })
        }else{
            var id_activity = $(this).data('id');
            var id_task = $task_id;
            $.ajax({
                url: '',
                type: 'post',
                data: {
                    id_activity: id_activity,
                    id_task: id_task,
                    action: 'remove_activity'
                },
                success: function(data){
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });

                    Toast.fire({
                        type: 'warning',
                        title: 'Update successfully'
                    })
                },
                error:function(response){
                    console.log(response);
                }

            })
        }

    });

    (function($) {
  $.fn.nodoubletapzoom = function() {
      $(this).bind('touchstart', function preventZoom(e) {
        var t2 = e.timeStamp
          , t1 = $(this).data('lastTouch') || t2
          , dt = t2 - t1
          , fingers = e.originalEvent.touches.length;
        $(this).data('lastTouch', t2);
        if (!dt || dt > 500 || fingers > 1) return; // not double-tap

        e.preventDefault(); // double tap - prevent the zoom
        // also synthesize click events we just swallowed up
        $(this).trigger('click').trigger('click');
      });
  };
})(jQuery);

JS;

$this->registerJs($script);
?>