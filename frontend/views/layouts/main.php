<?php

/* @var $this \yii\web\View */
/* @var $content string */
use dominus77\sweetalert2\Alert as sweetAlert;
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use yii\helpers\Url; 
use backend\models\UploadedFile;
use yii\bootstrap\Modal; 
$user_type_id = "";
$img_id = "";
if(Yii::$app->user->identity){
    $user_type_id = Yii::$app->user->identity->user_type_id;
    $img_id = Yii::$app->user->identity->img_url;
}

$base_url =  Yii::getAlias('@web');
$backend_base_url =  Yii::getAlias('@web/backend');
AppAsset::register($this);

if(!Yii::$app->user->isGuest){
    $userid  = Yii::$app->user->getId();
    $command = Yii::$app->db->createCommand("select * from user where id = $userid");
    $userData = $command->queryOne();
  }else{
    $user = "";
  }


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
$class_id = Yii::$app->controller->action->id;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"> 
    <link rel="icon" type="image/png" href="<?= Yii::getAlias('@web/backend')?>/img/fav.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link href="<?= $backend_base_url."/plugins/pace/pace.min.css"?>" rel="stylesheet">
    <script src="<?= $backend_base_url."/plugins/pace/pace.min.js"?>"></script>
    <style>
        .pace:before { 
            background-color: #25476a;
        }
        .pace .pace-progress, .nano>.nano-pane>.nano-slider {
            background-color: #487eb0;
        }
        /* .breadcrumb {
            border-radius: 0;
            background-color: #ffffff;
            margin-bottom: -15px;
            padding: 0 20px 10px;
            font-size: 14px;
        } */
        #page-content{
            padding: 80px 10px 10px 10px;
            min-height: 100vh;
            margin-bottom: 20px;
        }
        @media (min-width: 768px){
            .navbar-content { margin-left: 0px; }
        }
        #footer {
            border-top: 1px solid rgba(0, 0, 0, 0.07);
            background-color: #f6f8fa;
            color: #7a878e;
            position: fixed;
            padding-top: 10px;
            bottom: 0;
            z-index: 2;
            left: 0;
            right: 0;
            height: 35px;
            /* overflow-y: scroll; */
        }
        #footer p {
            margin-bottom: 5px;
        } 
        .breadcrumb {
            border-radius: 4px;
            background-color: #ffffff;
            margin-bottom: 20px;
            padding: 10px;
            font-size: 14px;
        }
        .page-header, #page-head, #page-head h1, #page-head h2, #page-head h3, #page-head h4, #page-head h5, #page-head h6, #page-head .text-main, #page-head .breadcrumb li, #page-head .breadcrumb li a, #page-head .breadcrumb .active {
            color: #254769;
        }
        #page-head .breadcrumb>li+li:before {
            border-color: #254769;
        }

        /* top menu */
        .navbar-top-links>li>a {
            padding: 0 10px;
            color: #979797;
            font-size: 14px;
        }
        .navbar-top-links>li>a.<?=$class_id?> {
            padding: 0 10px;
            color: #ffffff;
            font-size: 14px;
            /* background-color: #00000040; */
            font-weight: 500;
            border-bottom: 2px solid red;
        } 
        
        /* end top menu */
    </style>
    <?php $class_id = isset($this->params['current_page']) ? $this->params['current_page'] : 'dashboard';?>
</head>
<body class="pace-done"> 
<?php $this->beginBody() ?> 

   <div id="container" class="effect aside-float aside-bright mainnav-out slide">
        <header id="navbar">
            <div id="navbar-container" class="boxed">
                <div class="navbar-content">
                    <ul class="nav navbar-top-links"> 
                        <li class="tgl-menu-btn">
                            <a href="<?=Yii::$app->homeUrl?>" style="font-weight: bold;font-size:16px;"> 
                                <img class="img-circle img-lg" src="<?= Yii::getAlias('@web/backend')."/img/eo_logo.png" ?>" style="    width: 50px;height: 50px;" alt="Profile Picture">-BMS
                            </a>
                        </li> 
                    </ul>
                    <ul class="nav navbar-top-links">  
                        <?php
                        if (Yii::$app->user->isGuest) {
                        ?>
                        <li>
                            <a href="<?= Yii::getAlias("@web/site/login"); ?>" class="login"> 
                                Login  
                            </a> 
                        </li>  
                        <li>
                            <a href="<?= Yii::getAlias("@web/site/register"); ?>" class="signup"> 
                                Register  
                            </a> 
                        </li>  
                        <?php
                        }else{
                        ?> 
                        <li>
                            <a href="<?= Yii::getAlias("@web/member/profile"); ?>" class="profile update-profile"> 
                                Company 
                            </a> 
                        </li>
                        <li>
                            <a href="<?= Yii::getAlias("@web/member/payment"); ?>" class="payment"> 
                                Payment 
                            </a> 
                        </li>
                        <li>
                            <a href="<?= Yii::getAlias("@web/member/event"); ?>" class="event"> 
                                Event 
                            </a> 
                        </li>
                        <li>
                            <a href="<?= Yii::getAlias("@web/member/document"); ?>" class="document"> 
                                Document 
                            </a> 
                        </li>   
                        
                        <li id="dropdown-user" class="dropdown"> 
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right" style="font-weight: bold;font-size:16px;"> 
                                <img class="img-circle img-lg" src="<?= Yii::getAlias('@web/backend');?>/<?= $img_url; ?>" style="border: solid 1px white;width: 40px;height: 40px;" alt="Profile Picture">
                            </a>
                            
                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right panel-default">
                                <ul class="head-list">
                                    <li>
                                        <a href="<?= Yii::getAlias("@web/member/update-user-profile"); ?>" ><i class="demo-pli-male icon-lg icon-fw"></i> Profile</a>
                                    </li>
                                    
                                    <li>
                                        <a href="#"><i class="demo-pli-computer-secure icon-lg icon-fw"></i> Lock screen</a>
                                    </li> 
                                    <li> 
                                        <?= Html::a('<i class="demo-pli-unlock icon-lg icon-fw"></i> Logout', ['@web/site/logout'], ['data' => ['confirm' => 'Are you sure, you want to Logout?',
                                                        'value' => Url::toRoute('@web/site/logout'),
                                                        'method' => 'post',]]) ?>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <?php
                        }
                        ?>
                    </ul>
                </div> 
            </div>
        </header> 

        <div id="page-content">  
            <div class="row"> 
                <div class="col-md-10 col-md-offset-1">
                <div id="page-head"> 
                    <?= Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    ]) ?>  
                </div>
                    <?= $content; ?>
                </div>
            </div> 
        </div>  
      

    </div> 
<!-- <footer id="footer" style="z-index: 1px;"> 
    <p class="pad-lft">&#0169; <?= date('Y')." ".Yii::powered();?> </p>
</footer> -->
<footer id="footer" style="z-index: 1px;"> 
    <p class="pull-left" style="padding-left: 15px;">&copy; <?= Html::encode(Yii::$app->name) ?> <?= date('Y') ?></p>
    <p class="pull-right" style="padding-right: 15px;"><?= Yii::powered() ?></p> 
</footer> 

<button class="scroll-top btn">
    <i class="pci-chevron chevron-up"></i>
</button> 
  
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?> 
<?php
    $session = Yii::$app->session;

if ($session->hasFlash('success'))
{
    echo sweetAlert::widget([
        'options' => [
        'title' => $session->getFlash('success'),
        'toast' => true,
        'position' => 'top-end',
        'showConfirmButton' => false,
        'animation' => true,
        // 'customClass' => 'animated fadeInRight',
        'padding' => 15,
        'timer' => 3500,
        'type' => sweetAlert::TYPE_SUCCESS
        ]
    ]);
    }elseif($session->hasFlash('info')){
    echo sweetAlert::widget([
        'options' => [
        'title' => $session->getFlash('info'),
        'toast' => true,
        'position' => 'top-end',
        'showConfirmButton' => false,
        'animation' => true,
        // 'customClass' => 'animated fadeInRight',
        'padding' => 15,
        'timer' => 3500,
        'type' => sweetAlert::TYPE_INFO
        ]
    ]);
    }elseif ($session->hasFlash('warning')) {
    echo sweetAlert::widget([
        'options' => [
        'title' => $session->getFlash('warning'),
        'toast' => true,
        'position' => 'top-end',
        'showConfirmButton' => false,
        'animation' => true,
        // 'customClass' => 'animated fadeInRight',
        'padding' => 15,
        'timer' => 3500,
        'type' => sweetAlert::TYPE_WARNING
        ]
    ]);
    }elseif ($session->hasFlash('error')) {
    echo sweetAlert::widget([
        'options' => [
        'title' => $session->getFlash('error'),
        'toast' => true,
        'position' => 'top-end',
        'showConfirmButton' => false,
        'animation' => true,
        // 'customClass' => 'animated fadeInRight',
        'padding' => 15,
        'timer' => 3500,
        'type' => sweetAlert::TYPE_ERROR
        ]
    ]);
    }elseif ($session->hasFlash('question')) {
    echo sweetAlert::widget([
        'options' => [
        'title' => $session->getFlash('question'),
        'toast' => true,
        'position' => 'top-end',
        'showConfirmButton' => false,
        'animation' => true,
        // 'customClass' => 'animated fadeInRight',
        'padding' => 15,
        'timer' => 3500,
        'type' => sweetAlert::TYPE_QUESTION
        ]
    ]);
}
?>
<script type="text/javascript">
$('.<?=$class_id?>').addClass('active-sub active');
$('.<?=$class_id?> ').addClass('active-link');
</script>