<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;
$this->registerCssFile(
    "@web/plugins/summernote/summernote.min.css",
    ['depends' => [\yii\bootstrap\BootstrapAsset::className()]
]);

$this->registerJsFile(
    '@web/plugins/summernote/summernote.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$base_url = Yii::getAlias('@web');
$user_type_id = Yii::$app->user->identity->user_type_id;
$user_id = Yii::$app->user->identity->id;
$department = ArrayHelper::map(\backend\models\Department::find()
    ->where(['id'=>$model->id_department])
    ->all(), 'id', 'name');
if ($model->isNewRecord == true) {
    $img_url = "";
}else{
    $img_id = $model->img_url;
    $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
    $command->bindParam(':id', $img_id);
    $my_id = $command->queryOne();
    if ($my_id == '') {
        $my_id = 1;
    }
    if($img_id == ''){
        $img_id = 1;
        $my_id = $img_id;
    }
    $img_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;

}
$img_url = $base_url."/".$img_url;

if ($model->isNewRecord == true) {
    $signature_url = "";
}else{
    $img_id = $model->signature_url;
    $command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
    $command->bindParam(':id', $img_id);
    $my_id = $command->queryOne();
    if ($my_id == '') {
        $my_id = 1;
    }
    if($img_id == ''){
        $img_id = 1;
        $my_id = $img_id;
    }
    $signature_url = UploadedFile::find()->where(['id' => $my_id])->one()->filename;

}
$signature_url = $base_url."/".$signature_url;

$prefix_name = ArrayHelper::map(\backend\models\DataOptionPrefix::find()
    ->where(['status' => 1])
    ->all(), 'names', 'names');
$marital_status = ArrayHelper::map(\backend\models\MaritalStatus::find()
    ->where(['status' => 1])
    ->all(), 'names', 'names');
$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
if($user_id == 1 && $user_type_id == 1){
    $userType = ArrayHelper::map(\backend\models\UserType::find()
    ->where(['status'=>1])
    ->all(), 'id', 'user_type_name');
}else{
    $userType = ArrayHelper::map(\backend\models\UserType::find()
    ->where(['status'=>1])
    ->andWhere(['id'=>$model->id_user_type])
    ->all(), 'id', 'user_type_name');
}
$position = ArrayHelper::map(\backend\models\EmployeePosition::find()
    ->where(['status' => 1])
    ->all(), 'id', 'position_type');

$working_group = ArrayHelper::map(\backend\models\WorkingGroup::find()
    ->where(['status' => 1])
    ->all(), 'id', 'name');

$dollar_template = '{label}</br><div class="input-group">
          <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';

$date_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

$email_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="demo-pli-mail"></i></span> {input} </div>{error}{hint}';

$phone_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-mobile"></i></span> {input} </div>{error}{hint}';

?>
<style type="text/css">
    .img-xxl {
        width: 225px;
        height: 225px;
    }
    .img-xl {
        width: 155px;
        height: 155px;
    }
    .fullscreen{
        overflow: scroll;
    }
    .select2-container--open {
        z-index: 9999999;
    }
</style>
<div class="employee-profile-form">
 
    <?php 
    // $validationUrl = ['task/validation'];
    // if (!$model->isNewRecord){
    //     $validationUrl['id'] = $model->id;
    // }

    $form = ActiveForm::begin([
        'id' => $model->formName(),
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        // 'options' => ['autocomplete' => 'off'],
        // 'validationUrl' => $validationUrl
    ]); 
    ?>
    <div class="row">
        <div class="col-md-2 text-center">
            <div class="row">
                <div class="col-md-12">
                    <p class="text-primary">Profile</p>
                    <div style="display: none">
                        <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                    </div>
                    <div class="wr_img">
                        <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                            <label for = 'employeeprofile-file'>
                                <img id ='feature_images' src="<?= $base_url."/backend/uploads/empty-avatar.png";?>" class='img-circle img-xl'>
                            </label>
                        <?php } else {?>
                            <label for="employeeprofile-file">
                                <img id="feature_images" src="<?= $img_url;?>" class="img-circle img-xl" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';">
                            </label>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="pad-btm"></div>
            <div class="row">
                <div class="col-md-12">
                    <p class="text-primary">Signature</p>
                    <div style="display: none">
                        <?= $form->field($model, 'signature')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                    </div>
                    <div class="wr_img">
                        <label for="employeeprofile-signature">
                            <img id="feature_images_signature_url" src="<?= $signature_url;?>" class="img-responsive" onError="this.onerror=null;this.src='<?= $base_url.'/img/upload_holder.png' ?>';">
                        </label>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-10">
            <div class="tab-base">
                    
                <!--Nav Tabs-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#demo-lft-tab-1">General</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#demo-lft-tab-2">Address</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#demo-lft-tab-3">Job Description</a>
                    </li>
                </ul>
    
                <!--Tabs Content-->
                <div class="tab-content">
                    <div id="demo-lft-tab-1" class="tab-pane fade active in">
                        <p class="text-main text-semibold">General Information</p>
                        <div class="row">
                            <div class="col-md-3">
                                <?= $form->field($model, 'id_prefix')->widget(Select2::classname(), [
                                        'data' => $prefix_name,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'pluginOptions' => [
                                            'allowClear' => false
                                        ],
                                    ]);
                                ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-3">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <?= $form->field($model, 'sex')->widget(Select2::classname(), [
                                                'data' => ['1' => 'Male', '0' => 'Female'],
                                                'theme' => Select2::THEME_DEFAULT,
                                                'language' => 'eg',
                                                'pluginOptions' => [
                                                    'allowClear' => false
                                                ],
                                            ]);
                                        ?>
                                    </div>
                                    <div class="col-sm-6">
                                        <?= $form->field($model, 'marital_status')->widget(Select2::classname(), [
                                                'data' => $marital_status,
                                                'theme' => Select2::THEME_DEFAULT,
                                                'language' => 'eg',
                                                'options' => ['placeholder' => 'Select'],
                                                'pluginOptions' => [
                                                    'allowClear' => true
                                                ],
                                            ]);
                                        ?>
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <?= $form->field($model, 'nationality')->widget(Select2::classname(), [
                                        'data' => $country,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => ['placeholder' => 'Select'],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'basic_salary', ['template'=>$dollar_template])->textInput(['type' => 'number', 'step'=>0.01]) ?>
                            </div>
                            
                            <div class="col-md-3">
                                <?= $form->field($model, 'id_position')->widget(Select2::classname(), [
                                        'data' => $position,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => ['placeholder' => 'Select'],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'id_department')->widget(Select2::classname(), [
                                        'data' => $model->isNewRecord ? [] : $department,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        // 'options' => ['placeholder' => 'Select'],
                                        'pluginOptions' => [
                                            // 'allowClear' => true,

                                        ],
                                    ]);
                                ?>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <?= $form->field($model, 'employee_code')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'join_date', ['template' => $date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'email', ['template' => $email_template])->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-3">
                                <?= $form->field($model, 'phone_number',['template' => $phone_template])->textInput(['maxlength' => true]) ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                                <?php if ($model->status != 1) { $model->status = 0;} ?>
                                <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                            </div>
                        </div>

                        <p class="text-main text-semibold">Description</p>
                        <div class="row">
                            <div class="col-md-12">
                                <?= $form->field($model, 'description')->textarea(['rows' => '6'])->label(false); ?>
                            </div>
                        </div>

                    </div>
                    <div id="demo-lft-tab-2" class="tab-pane fade">
                        <p class="text-main text-semibold">Address</p>
                        <div class="row">
                            <div class="col-md-3">
                                <?= $form->field($model, 'date_of_birth', ['template' => $date_template])->textInput(['readonly' => true, 'style'=>'background: #fff !important;']) ?>
                            </div>
                            <div class="col-md-9">
                                <?= $form->field($model, 'place_of_birth')->textInput(['maxlength' => true]) ?>
                            </div>
                        </div>
                        <div class="row">                            
                            <div class="col-md-3">
                                <?= $form->field($model, 'id_country')->widget(Select2::classname(), [
                                        'data' => $country,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => ['placeholder' => 'Select'],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                ?>
                            </div>

                            <div class="col-md-3">
                                <?= $form->field($model, 'id_city')->widget(Select2::classname(), [
                                        'data' => $city,
                                        'theme' => Select2::THEME_DEFAULT,
                                        'language' => 'eg',
                                        'options' => ['placeholder' => 'Select'],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                ?>
                            </div>

                            <div class="col-md-6">
                                <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                            </div>
                        </div>
                    </div>
                    <div id="demo-lft-tab-3" class="tab-pane fade">
                        <p class="text-main text-semibold">Job Description</p>
                        <div class="row">
                            <div class="col-md-12">
                                <?= $form->field($model, 'job_description')->textArea(['class'=>"editor_area description"])->label(false); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div> 

<?php
$script = <<<JS
var base_url = "$base_url";

    $('.editor_area').each(function(e){
        CKEDITOR.replace( this.id, { customConfig: base_url + '/plugins/ckeditor/config.js' });
    });
 
$('#modal').on('shown.bs.modal', function() {
          var d_height = $("#detail-height").outerHeight();
          $("#logo-height").css("height",d_height);
      });


  // ========department=====
  $("#employeeprofile-id_position").change(function(){
      // var text = $(this).select2('data')[0]['text'];
      // $(".field-task-id_related_profile label").text(text);
      var id = $(this).val();
      $.ajax({
          url: base_url+'/employee-profile/get-department',
          type: 'post',
          data: {
              id: id,
              action: 'get_department'
          },

          success: function(response){
              var data = JSON.parse(response);
              if(data['department'] != ''){
            //   console.log(data);
              var str = "";
              $.each(data['department'],function(key,value){
                  str = str + '<option value="'+value.id_department+'">'+value.department_name+'</option>';
                //   console.log(str);
              });
              $('#employeeprofile-id_department').html(str);
            }
            if(data['job_description'] != ''){
            //   console.log(data['job_description']);
            // $('#employeeprofile-job_description').val(data['job_description']['description']);
            var job_description = data['job_description']['description'];
            $("#demo-summernote").summernote("code",job_description);
          }
          }
      });

  });
  // ========department=====
    $(function () {
      $("#employeeprofile-file").change(function () {
        readURL(this);
      });
      $("#employeeprofile-file").hide();
  });

   function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            x= e.target.result;
              $('#feature_images').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }

    $(function () {
        $("#employeeprofile-signature").change(function () {
            readURL2(this);
        });
        $("#employeeprofile-signature").hide();
    });

    function readURL2(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            x= e.target.result;
                $('#feature_images_signature_url').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

  $("#employeeprofile-date_of_birth, #employeeprofile-join_date").datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true
    });

    $('#demo-summernote').summernote({
        height : '350px',
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
        ]
    });
JS;
$this->registerJs($script);
?>
