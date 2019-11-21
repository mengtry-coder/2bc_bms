<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use backend\models\UploadedFile; 
use yii\widgets\DetailView;
use yii\helpers\Url;
$base_url = Yii::getAlias('@web/backend');  

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
// $img_url = $base_url.'/'.$img_url;
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);
 
$user_img_id = $userData->img_url;
$command = Yii::$app->db->createCommand("select id from uploaded_file where id = :id");
$command->bindParam(':id', $user_img_id);
$user_my_id = $command->queryOne();
if ($user_my_id == '') {
    $user_my_id = 1;
}
if($user_img_id == ''){
    $user_img_id = 1;
    $user_my_id = $user_img_id;
}  
$user_img_url = UploadedFile::find()->where(['id' => $user_my_id])->one()->filename;
$user_img_url = $base_url.'/'.$user_img_url;

$prefix_name = ArrayHelper::map(\backend\models\DataOptionPrefix::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$marital_status = ArrayHelper::map(\backend\models\MaritalStatus::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');  
$country = ArrayHelper::map(\backend\models\Country::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names'); 
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
 
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

$validationUrl = ['membership-profile/validation'];
if (!$model->isNewRecord){
    $validationUrl['id'] = $model->id;
} 
$this->title = 'Company Profile';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="membership-profile-form">
    <div class="row">
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-title">
                            Membership Profile
                        </div>
                        <div class="panel-body">
                            <img class="img-responsive img-thumbnail" style="width: 100%" src="<?=$img_url;?>" alt="Image"onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/NoPicAvailable.jpg' ?>';">
                        </div>
                    </div>
                </div>
                <!-- <div class="col-md-12 col-sm-6 col-xs-6">
                    <div class="panel">
                        <div class="panel-title">
                            User Profile
                        </div>
                        <div class="panel-body">
                            <img class="img-responsive img-thumbnail" style="width: 100%" src="<?=$user_img_url;?>" alt="Image">
                        </div>
                    </div>
                </div> -->
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel">
                <div class="panel-body">
                <div class="blog-content" style="margin-top:-20px;">
                    <div class="blog-title media-block"> 
                            <h3>Information details</h3> 
                    </div> 
                    <div class="blog-body">
                        <!-- <div class="table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                
                                    <tr> 
                                        <td width="30%">Company</td><td><?= $model->company_name;?></td> 
                                    </tr> 
                                    <tr> 
                                        <td>User</td><td><?= $model->first_name." ". $model->last_name?></td> 
                                    </tr> 
                                    <tr> 
                                        <td>Passport No</td><td><?= $model->passport_no?></td> 
                                    </tr> 
                                </tbody>
                            </table>
                        </div> -->
                        <?= DetailView::widget([
                            'model' => $model,
                            'attributes' => [ 
                                'company_name',
                                [ 
                                    'label' => 'User Name',
                                    'value' => function($model){
                                        return  $model->prefix->names." ".$model->first_name ." ".$model->last_name;
                                    }
                                ],
                                'passport_no',
                                'date_of_birth',
                                'place_of_birth', 
                                'address',
                                'address_line_2',
                                [ 
                                    'label' => 'Country',
                                    'value' => function($model){
                                        return  $model->country->names;
                                    }
                                ],
                                [ 
                                    'label' => 'City',
                                    'value' => function($model){
                                        return  $model->city->names;
                                    }
                                ], 
                                'id_province',
                                'postal_code', 
                                [ 
                                    'label' => 'Marital Status',
                                    'value' => function($model){
                                        return  $model->maritalStatus->names;
                                    }
                                ],
                                [ 
                                    'label' => 'Phone number',
                                    'value' => function($model){
                                        return $model->prefixPhone->short_name." (+".$model->prefixPhone->code.") ".$model->phone_number; 
                                    }
                                ],
                                [ 
                                    'label' => 'Phone number line2',
                                    'value' => function($model){
                                        return  $model->prefixPhone2->short_name." (+".$model->prefixPhone2->code.") ".$model->phone_number_line_2;
                                    }
                                ],   
                                'email:email',
                                'website',
                                'contact_person',
                                'position',
                                'mot_licence_no',
                                'year_of_establishment',
                                'type_of_business', 
                                'created_date', 
                                [ 
                                    'label' => 'Created By',
                                    'value' => function($model){
                                        return  $model->createdBy->first_name." ".$model->createdBy->last_name;
                                    }
                                ],
                            ],
                        ]) ?> 
                    </div>
                </div>
                <div class="blog-footer pull-right">
                    <a type="button" class="btn btn-warning btn-rounded" href="<?= Yii::getAlias("@web/member/update-profile"); ?>"> 
                        Update <i class="fa fa-plus-square go-right"></i>
                    </a> 
                </div>
            </div> 
                </div>
            </div>
        </div>
    </div>
    

</div>