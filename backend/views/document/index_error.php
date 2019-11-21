<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal; 
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

$base_url = Yii::getAlias('@web');
$request = Yii::$app->request;
$id_customer_profile = $request->get('id_customer_profile',0);
$this->title = 'Customer Document'; 
$this->params['breadcrumbs'][] = ['label' => 'Document']; 
$folder_data = ArrayHelper::map(\backend\models\Folder::find()
	->where(['status' => 1])
	->andWhere(['id_customer_profile' => $id_customer_profile])
	->all(), 'id', 'folder_name'); 
 
$url = Url::toRoute(['document/document']);


?>
<style>
    .modal-lg{
        width: 90%;
    }
	.text_limit_length {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 280px;
		float: left;
		margin-top: 5px;
	}
	.pad-ver {
		padding-top: 10px;
		padding-bottom: 10px;
	}

	.btnfolder{
		/* cursor: pointer; */
		background-color: #f9f9f9;
		color: #7d8a91;
		padding: 4px 4px;
		border-radius: 4px;
		font-size: 12px;
		line-height: 1.475;
		vertical-align: middle;
		transition: all 0.25s;
		border: 0px;
	} 
	.list-group-item:hover{
		background-color: whitesmoke !important; 
		cursor: pointer;
	}
	.list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
		background-color: #ffffff !important;
		border-left: 2px solid #254769 !important;
		border: 0px;
	
}
.active>.a_color_style{ 
	color: #254769 !important;
    font-weight: 600;
}
</style>
<?php
	Modal::begin([
		'header' => ' <h4 class="modal-title">'.'Upload Document'.'</h4>',
		'id' => 'modal_document',
		'class' => 'modal_document fade',
		'size' => 'modal-lg',
	]);
	echo "<div id='modalContentDocument'></div>";
	Modal::end(); 
?>
<div class="panel">
    <div class="panel-body">  
        <p class="text-main text-bold">Document</p>

    <div class="document-index">
        <div class="pad-all file-manager">
            <div class="fixed-fluid">
                <div class="fixed-sm-300 pull-sm-left file-sidebar">
                    <div class="file-toolbar bord-btm">
                        <div class="btn-file-toolbar">
                            <a class="btn btn-icon add-tooltip" href="#" data-original-title="New Folder" data-toggle="tooltip" id="modalButton" value="<?= Url::toRoute(['document/create-folder','id_customer_profile'=>$id_customer_profile]) ?>"><i class="icon-2x demo-pli-folder"></i></a>
                            <a class="btn btn-icon add-tooltip viewFolder" href="#" data-original-title="Folder Detail" data-toggle="tooltip" id="modalButtonGetInfo" value="#" ><i class="icon-2x demo-pli-information"></i></a>
                            <a class="btn btn-icon add-tooltip renameFolder" href="#" data-original-title="Rename Folder" data-toggle="tooltip" id="modalButtonRenameFolder" value="#" ><i class="icon-2x demo-pli-file-edit"></i></a>
                            <a class="btn btn-icon add-tooltip deleteFolder" href="#" data-original-title="Delete Folder" data-toggle="tooltip"><i class="icon-2x demo-pli-recycling" style="color: #c62828;"></i></a>
                        </div>
                        <div class="btn-file-toolbar pull-right"> 
                            <a class="btn btn-icon add-tooltip newFile" href="#" data-original-title="Upload File" data-toggle="tooltip" id="modalButtonUploadFile" value="#" ><i class="icon-2x demo-pli-upload-to-cloud" style="color: #283593;"></i></a>
                        </div> 
                    </div> 
                    
                    <p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Folders</p>
                    <div class="list-group bg-trans pad-btm bord-btm">
    
                    <?php  
                        foreach($folder_data as $key => $folder_name){
                    echo 	'<div class="list-group-item clearfix folder_wrap activeOnload_'.$key.'" data-id="'.$key.'">
                                <a href="#" class="a_color_style">
                                    <div class="text_limit_length"> 
                                        <i class="demo-pli-folder icon-lg icon-fw"></i>'.$folder_name.'
                                    </div> 
                                </a> 
                            </div> 
                            ';
                        }
                    ?>  
                    </div> 
                    
                </div>
                <div class="fluid file-panel" style="font-size: 15 px;">
                    <div class="bord-btm pad-ver">
                        <ol class="breadcrumb">
                            <li><i class="icon-1x demo-pli-home"></i></li> 
                            <li class="active"><span class="crum_folder_name"></span></li>
                        </ol>
                        
                    </div>
                    
                    <ul id="demo-mail-list" class="file-list data_in_folder" style="margin-top: -20px;">

                    </ul>
                </div>
            </div>
        </div>
    </div>

    </div>
</div>
<?php
	Modal::begin([
		'header' => $this->title,
		'id' => 'modal',
		'class' => 'modal fade',
		'size' => 'modal-xs',
	]);
	echo "<div id='modalContent'></div>";
	Modal::end();
?>

<?php
$this->registerJs('
var base_url = "'.$base_url.'";
//==== Start Ajax query data by document name
$(function() {
	$( ".folder_wrap" ).on( "click", function() {
		  $( this ).parent().find( ".folder_wrap.active" ).removeClass( "active" );
		  $( this ).addClass( "active" );
	});
});

var id_customer_profile_current = "'.$id_customer_profile.'";
var id_customer_profile_local = localStorage.getItem("id_customer_profile_local",id_customer_profile_local);

var id_folder_current = $(".folder_wrap").attr("data-id");
var id_folder_local = localStorage.getItem("id_folder_local",id_folder_local);

if(id_customer_profile_local == id_customer_profile_current){
	id_customer_profile = id_customer_profile_current; 
	id_folder = id_folder_local;
	
}else{
	id_customer_profile = id_customer_profile_current;
	id_folder = id_folder_current; 
}
 
$(".folder_home").removeClass( "active" );
$(".activeOnload_"+id_folder+"").addClass( "active" );
if(id_folder_current !=null){
	$(".newFile").attr("value", base_url+"/document/upload-document?folder="+id_folder+"&id_customer_profile='.$id_customer_profile.'");
	$(".renameFolder").attr("value", base_url+"/document/rename-folder?id="+id_folder);
	$(".viewFolder").attr("value", base_url+"/document/get-info?id="+id_folder);
	$(".deleteFolder").attr("href", base_url+"/document/delete-folder?id="+id_folder);
}else{
	$(".newFile").attr("disabled", "disabled").removeAttr("id");
	$(".renameFolder").attr("disabled", "disabled").removeAttr("id");
	$(".viewFolder").attr("disabled", "disabled").removeAttr("id");
	$(".deleteFolder").attr("disabled", "disabled");
}

documentByFolder(id_folder,id_customer_profile);

$(".folder_wrap").click(function(){
	
	var id_customer_profile = "'.$id_customer_profile.'";
	var id_folder = $(this).attr("data-id"); 
	if(id_folder !=null){
		$(".newFile").attr("value", base_url+"/document/upload-document?folder="+id_folder+"&id_customer_profile='.$id_customer_profile.'");
		$(".renameFolder").attr("value", base_url+"/document/rename-folder?id="+id_folder);
		$(".viewFolder").attr("value", base_url+"/document/get-info?id="+id_folder);
		$(".deleteFolder").attr("href", base_url+"/document/delete-folder?id="+id_folder);
	}else{
		$(".newFile").attr("value","#").removeAttr("id");
		$(".renameFolder").attr("value","#").removeAttr("id");
		$(".viewFolder").attr("value","#").removeAttr("id");
		$(".deleteFolder").attr("href","#");
	}

	var folder_name = $(this).text();
	$(".data_in_folder").html("");
	localStorage.setItem("id_folder_local",id_folder);
	localStorage.setItem("id_customer_profile_local",id_customer_profile);
    documentByFolder(id_folder,id_customer_profile);
	
});

function documentByFolder(id_folder,id_customer_profile){
	$.ajax({
        url: base_url+"/document/dependent-folder",
        type: "post",
        data: {
			id_folder: id_folder,
			id_customer_profile:id_customer_profile,
            action: "get_data_folder"
		}, 
		success: function(response)
		{
            var data = JSON.parse(response);
			// console.log(data);   
			if(data =="")
			{
				$(".data_in_folder").html(`
				<li> 
					<div class="file-attach-icon"></div>
					<a href="#" class="file-details">
						<div class="media-block">
							<div class="media-left"><i class="demo-psi-folder"></i></div>
							<div class="media-body">
								<p class="file-name single-line">Empty folder ...</p>
							</div>
						</div>
					</a>
				</li>
				`);
			}
			$.each(data,function(key,value)
			{   
				$(".data_in_folder").append(`
				<li> 
					<div class="file-settings">
						<a href="${base_url}/document/download?id=${value.id}"><i style="color: #283593;" class="icon-2x demo-pli-download-from-cloud"></i></a>
						|
						<a href="${base_url}/document/remove?id=${value.id}" data-confirm="Are you sure you want to remove it permantly?"><i style="color: #c62828;" class="icon-2x demo-pli-recycling"></i></a>
					</div>
					<div class="file-attach-icon"></div>
					<a href="#" class="file-details">
						<div class="media-block">
							<div class="media-left"><img src="${base_url}/backend/${value.thumbnail}" width="40px" height="40px" onError="this.onerror=null;this.src=\'${base_url}/backend/uploads/fileDocument.png\';"></div>
							<div class="media-body">
								<p class="file-name">${value.file_name}</p>
								<small>Uploaded Date ${value.created_date} | By ${value.name_creater} | Size: ${bytesToSize(value.file_size)}</small>
							</div>
						</div>
					</a>
				</li>  
				`); 
            }); 
        }
	}); 

	$.ajax({
        url: base_url+"/document/dependent-folder",
        type: "post",
        data: {
            id_folder: id_folder,
            action: "get_data_crum_folder_name"
        },
        success: function(response){
            var data = JSON.parse(response);
			// console.log(data);   
			 $.each(data,function(key,value){
				$(".crum_folder_name").html(`${value.folder_name}`);
			 })
        }
	});
	
} //end function documentByFolder(id_folder,id_customer_profile);

//==== End Ajax query data by document name


        var controller_id = "document";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
            window.location.replace(url+"?r="+controller_id+"/index&id_customer_profile='.$id_customer_profile.'&page_size="+page_size); 
        });


        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
		});

		$(document).on("click","#modalButtonUploadFile",function () {
            $("#modal_document").modal("show")
                .find("#modalContentDocument")
                .load($(this).attr("value"));
		});
		
		$(document).on("click","#modalButtonRenameFolder",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
		});

		$(document).on("click","#modalButtonGetInfo",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
		});
//==== Function
	function bytesToSize(bytes) {
		var sizes = ["Bytes", "KB", "MB", "GB", "TB"];
		if (bytes == 0) return "0 Byte";
		var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		return Math.round(bytes / Math.pow(1024, i), 2) + " " + sizes[i];
	};
//==== End Function

	');
	
?> 