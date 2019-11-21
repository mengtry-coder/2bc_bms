<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile;
use backend\models\MembershipEvent;
$base_url = Yii::getAlias('@web'); 

if ($model->isNewRecord == true) {
    $img_url = "";
    $numParticipatoin = 0;
}else{
    $countParticipation = Yii::$app->db->createCommand("
        SELECT COALESCE(sum(membership_event.number_of_audient),0) as number_of_audient
        FROM membership_event 
        WHERE membership_event.id_event_list = $model->id
    ")->queryOne(); 
    $numParticipatoin = $countParticipation['number_of_audient'];

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
$img_url = $base_url.'/'.$img_url;

$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
 
// print_r($numParticipatoin);

$sql = "
    SELECT CONCAT('(','+',phone_code.code,')',' ',phone_code.short_name) as phone_prefix_code,
    phone_code.id as id
    FROM data_option_phone_number_country_code as phone_code 
    WHERE phone_code.status = 1 
    ";
$prefix_phone_code = Yii::$app->db->createCommand($sql)->queryAll();
$prefix_phone_code = ArrayHelper::map($prefix_phone_code, 'id', 'phone_prefix_code');
$this->registerJsFile(
    '@web/js/bootstrap.min.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
?>

<div class="event-list-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-3">  
            <div class="row">
                <div class="col-md-12"> 
                    <div style="display: none">
                        <?= $form->field($model, 'file')->fileInput(['multiple' => false, 'accept' => 'image/*',])->label(false) ?>
                    </div>   
                    <div class="wr_img">
                        <?php if ($model->img_url == "" || $model->isNewRecord ){ ?>
                            <label for = 'eventlist-file'>
                                <img id ='feature_images' src="<?= $base_url."/backend/uploads/default-image.png";?>" class='img-responsive img-thumbnail'>
                            </label>

                        <?php } else {?>

                            <label for="eventlist-file">
                                <img id="feature_images" src="<?= $img_url;?>" class="img-responsive img-thumbnail" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                            </label>
                        <?php } ?>
                    </div> 
                </div>
            </div>
        </div>

        <div class="col-md-9"> 
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'event_name')->textInput(['maxlength' => true]) ?>
                </div> 
                
                <div class="col-md-3">
                    <?= $form->field($model, 'fee_for_membership')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control']) ?> 
                </div> 
                <div class="col-md-3">
                    <?= $form->field($model, 'fee_for_subscriber')->textInput(['type'=>'number','min'=>0,'step'=>0.01,'class'=>'form-control']) ?> 
                </div> 
                <div class="col-md-2">
                    <?= $form->field($model, 'from_date')->textInput(['readonly'=>true]) ?> 
                </div> 
                <div class="col-md-2">
                    <?= $form->field($model, 'to_date')->textInput(['readonly'=>true]) ?>
                </div> 
                <div class="col-md-2">
                    <?= $form->field($model, 'number_of_audient')->textInput(['readonly'=>true,'placeholder'=>'Auto count','value'=>$numParticipatoin == 0 ? "" : $numParticipatoin]) ?> 
                </div> 
                <div class="col-md-3">
                    <?= 
                        $form->field($model, 'id_country')->widget(Select2::classname(), [
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
                    <?= 
                        $form->field($model, 'id_city')->widget(Select2::classname(), [
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
                <div class="col-md-3">
                    <?= $form->field($model, 'id_province')->textInput()->label('Specific location'); ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'postal_code')->textInput(['maxlength' => true]) ?>
                </div>
                
                <div class="col-md-4">
                    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                </div> 

                <div class="col-md-4">
                    <?= $form->field($model, 'address_line_2')->textInput(['maxlength' => true]) ?>
                </div> 

                 <div class="col-md-4">
                    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                </div>

            </div>  
        </div>
    </div>

    <!-- <div class="row"> 
        
    </div> -->
    <div class="row">
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-5">
                            <?= 
                                $form->field($model, 'prefix_phone_code')->widget(Select2::classname(), [
                                    'data' => $prefix_phone_code,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>
                        </div>
                        <div class="col-md-7">
                            <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
                        </div>
                    </div>
                </div> 
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-5">
                            <?= 
                                $form->field($model, 'prefix_phone_code_line_2')->widget(Select2::classname(), [
                                    'data' => $prefix_phone_code,
                                    'theme' => Select2::THEME_DEFAULT,
                                    'language' => 'eg',
                                    'options' => ['placeholder' => 'Select'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                            ?>
                        </div>
                        <div class="col-md-7">
                            <?= $form->field($model, 'phone_number_line_2')->textInput(['maxlength' => true]) ?>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-6"> 
                    <?php
                        $countSubInEvent = Yii::$app->db->createCommand("
                            SELECT COUNT(membership_profile.membership_type) as countSubInEvent 
                            FROM membership_event
                            INNER JOIN membership_profile on membership_profile.id = membership_event.id_membership_profile
                            WHERE membership_event.id_event_list = $model->id
                            AND membership_profile.membership_type = 2
                        ")->queryOne(); 
                        if($model->authorized == 1 && $countSubInEvent['countSubInEvent'] >=1){
                            echo $form->field($model, 'authorized')->widget(Select2::classname(), [
                                'data' => ['1'=>'All Participation'],
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                // 'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => false
                                ],
                            ]);
                        }else{
                            echo $form->field($model, 'authorized')->widget(Select2::classname(), [
                                'data' => ['1'=>'All Participation','2'=>'Membership Only'],
                                'theme' => Select2::THEME_DEFAULT,
                                'language' => 'eg',
                                // 'options' => ['placeholder' => 'Select'],
                                'pluginOptions' => [
                                    'allowClear' => false
                                ],
                            ]);
                        }
                        
                    ?>
                </div>
                <div class="col-md-6">
                    <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
                    <?php if ($model->status != 1) { $model->status = 0;} ?>
                    <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>
                </div>
            </div>
        </div>
    </div>
     
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'description')->textarea(['rows' => '6']) ?>
        </div>
    </div>  
    <div class="text-right"> 
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div> 
    
    <?php ActiveForm::end(); ?>
</div>
<?php
$script = <<<JS
 
$('#eventlist-from_date,#eventlist-to_date').datepicker({
    format: 'yyyy-mm-dd',
    changeMonth: true,
    changeYear: true,
    autoclose: true
});
// Upload image
$(function () {
      $("#eventlist-file").change(function () {
        readURL(this);
      });
      $("#eventlist-file").hide();
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
// End Upload image
JS;
$this->registerJs($script);
?>