<?php 
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 

$class_id = Yii::$app->controller->action->id; 

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

?>
<div class="panel">
                    
    <div class="panel-heading">
        <h3 class="panel-title">Company Profile</h3>
    </div>
    <div class="pad-btm"></div>
    <div class="nano list_height" style="height: 500px">
        <div class="nano-content">
            <div class="panel-body">
				<div class="list-group"> 
                    <a class="list-group-item <?= $class_id =='index'?'active':'' ?>" href="<?= Url::toRoute(['company-profile/index']) ?>">Profile</a>
                    <a class="list-group-item <?= $class_id =='index-branch'?'active':'' ?>" href="<?= Url::toRoute(['company-profile/index-branch']) ?>">Branch</a>
                </div>
			</div>
		</div>
	</div>
</div>


<?php 

    Modal::begin([
        'header' => ' <h4 class="modal-title">Title</h4>',
        'id' => 'modal',
        'class' => 'modal fade',
        'size' => 'modal-custom-70',
    ]);
    echo "<div id='modalContent'></div>";
    Modal::end();

$script = <<<JS
    
    var list_height = $(window).height() - 215; 
    $(".list_height").css({"height": list_height});
    
    var pagination = $(".pagination").height();
    var extra_height = 0;
    if (isNaN(pagination)) {
        extra_height = 18;
    }
    extra_height = parseFloat(extra_height);

    var table_height = $(window).height() - 320 + extra_height;
    $(".fixedHeader").css({"height": table_height});

    var controller_id = "company-profile";
    $("#select_page_size").change(function(){
        var page_size = $("#select_page_size").val();
        var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
    });

    $(document).on("click","#modalButton",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        $("#modal").find(".modal-title").html($(this).data("title"));
    });

    $(document).on("click","#modalButtonUpdate",function () {
        $("#modal").modal("show")
            .find("#modalContent")
            .load($(this).attr("value"));
        $("#modal").find(".modal-title").html($(this).data("title"));
    });

    yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('button-delete')){
            swal({
                text: "Are you sure you want to delete this record?",
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
    };

JS;
$this->registerJs($script);
?>