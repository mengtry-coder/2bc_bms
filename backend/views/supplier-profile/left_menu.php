<?php 
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 

$class_id = Yii::$app->controller->action->id; 

?>
<div class="panel">
                    
    <div class="panel-heading">
        <h3 class="panel-title">Supplier</h3>
    </div>
    <div class="pad-btm"></div>
    <div class="nano list_height" style="height: 500px">
        <div class="nano-content">
            <div class="panel-body">
				<div class="list-group"> 
				    <a class="list-group-item <?= $class_id =='contact'?'active':'' ?>" href="<?= Url::toRoute(['supplier-profile/contact']) ?>">Contact</a>
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
    
    var list_height = $(window).height() - 205; 
    $(".list_height").css({"height": list_height});

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

JS;
$this->registerJs($script);
?>