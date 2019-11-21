<style>
.remove_file{
    cursor: pointer;
    color: #23527c;
    margin: 0 0;
    display: block;
    text-align: center;

}
.remove_file:hover{
    cursor: pointer;
    color: red;
    display: block;
    text-decoration: underline;
}
#myDropzone{
    width:100%;
    height:500px;
    background: rgba(0,0,0,0.025);
    border-style: dashed;
    border-width: 1px;
    border-radius: 3px;
}
</style>

<?php
use yii\helpers\Html; 
use backend\models\Folder;

$folder_name =Folder::find()->where(['status'=>1])->andWhere(['id'=>$folder])->one();
if($folder_name ==""){
    echo "<h4>To folder : Home</h4>";
}else{
    echo "<h4>To folder : ".$folder_name->folder_name."</h4>";
}

@$id_employee_profile = $_GET['id_employee_profile']; 
        $acceptedFiles = 
        '.doc, .dot, .wbk, .docx, .docm, .dotx, .dotm, .docb, .xls, .xlt, .xln, .xlsx, .xlsn, .xltx, .xltn, .xlsb, .xla, .xlan, .xll, .xlw, .ppt, .pot, .pps, .pptx, .pptn, .potx, .potn, .ppan, .ppsx, .ppsn, .sldx, .sldm, .accdb, .accde, .accdt, .accdr, .pob, .xps, .pdf, .html, .jpg, .gif, .png'
    ;
        // $url = Yii::getAlias('@web')."/employee-profile/upload?folder=14";
        
        
        echo    \kato\DropZone::widget([
            'options' => [
                'url'=>Yii::getAlias('@web')."/employee-profile/upload?folder=".$folder."&id_employee_profile=".$id_employee_profile, 
                'maxFilesize' => '5',
                'maxFiles'=>10,
                'addRemoveLinks'=>true,
                'multipleUpload'=>true,
                'acceptedFiles'=>$acceptedFiles,
            ],

        'clientEvents' => [
            'complete' => "function(file){
                //console.log(file)
            }",
           
            'removedfile' => "function(file){
                
               
            }",

            'success'=>"function(file,response){
                 var dt = $.parseJSON(response);
                 //console.log( dt[0].id);
                 var pp = $('.dz-filename:contains('+file.name+')').parent().parent();
                 pp.children('.remove_file[data-name='+'\"'+file.name+'\"'+']').attr('data-id',dt[0].id);
                 

            }",
            'error'=>"function(file){
                if (!file.accepted){
                    alert('This file has bad extension');
                    this.removeFile(file);
                    return false;
                } 
            }",


            'addedfile'=>"
                function(file) {
                    if (this.files.length) {
                        var _i, _len;
                        var _ii = 0;
                        var _ilen = this.files.length;
                       
                        if(_ii == _ilen - 1){
                            var pp = $('.dz-filename:contains('+file.name+')').parent().parent();
                                pp.children('.dz-remove').addClass('hide');
                                var hh = '<div  class =\" remove_file\" data-name = \"'+file.name+'\" data-id = \"\" > Remove </div>';
                                pp.append(hh);
                                return false;
                        }
                        for (_i = 0, _len = this.files.length; _i < _len - 1; _i++) // -1 to exclude current file
                        {
                            if(this.files[_i].name === file.name && this.files[_i].size === file.size && this.files[_i].lastModifiedDate.toString() === file.lastModifiedDate.toString())
                            {
                                this.removeFile(file);
                                alert('You can\'t add the same file');
                            }else{
                                var pp = $('.dz-filename:contains('+file.name+')').parent().parent();
                                pp.children('.dz-remove').addClass('hide');
                                var hh = '<div  class =\" remove_file\" data-name = \"'+file.name+'\" data-id = \"\" > Remove </div>';
                                pp.append(hh);
                                return false;
                            }
                        }
                    }
                
                   //  // $('.dropzone-previews').html('');
                   // $('.dz-default.dz-message').attr('style','');  
                    
                }",
                
                
            ],

        ]);


           
        ?>

<?php

$url = Yii::getAlias('@web')."/employee-profile/remove-file";
 
$script=<<<JS

var url = "$url";

$('.dz-default.dz-message').children('span').addClass('fa fa-cloud-upload fa-3x');
$(document).on('click','.remove_file',function(e){
    e.preventDefault();
    var a = myDropzone.files;
    var i = confirm('Are you sure to remove this file ?');
    
    if(i == 1 ){
        var id = $(this).data('id');

        var name = $(this).data('name');
         $.ajax({
                url: url,
                type:'post',
                data:{
                    id: id,
                    action:'remove_file'
                },          
                error:function(response) {
                   // console.log(response);
            },
            success: function(response) {
               //  console.log(response);  
               
              // var pp = $('.remove_file[data-id='+id+']').parent();
              // pp.remove();
              //console.log(pp);

                if (myDropzone.files.length) {
                            var ii, len;
                            for (ii = 0, len = myDropzone.files.length; ii <= len - 1; ii++) // -1 to exclude current file
                            {
                                if(myDropzone.files[ii].name === name)
                                {
                                    myDropzone.removeFile(myDropzone.files[ii]);
                                    console.log(name);
                                    
                                    return false;
                                }
                            }
                        }
               i = 0;
            }         
          });  
    }else{
        return false;
    }
    
return false; 
});

JS;
$this->registerJS($script);
?>