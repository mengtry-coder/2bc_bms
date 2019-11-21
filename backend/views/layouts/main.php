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

// echo get_client_ip();

// function get_client_ip() {
//     $ipaddress = '';
//     if (getenv('HTTP_CLIENT_IP'))
//         $ipaddress = getenv('HTTP_CLIENT_IP');
//     else if(getenv('HTTP_X_FORWARDED_FOR'))
//         $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
//     else if(getenv('HTTP_X_FORWARDED'))
//         $ipaddress = getenv('HTTP_X_FORWARDED');
//     else if(getenv('HTTP_FORWARDED_FOR'))
//         $ipaddress = getenv('HTTP_FORWARDED_FOR');
//     else if(getenv('HTTP_FORWARDED'))
//        $ipaddress = getenv('HTTP_FORWARDED');
//     else if(getenv('REMOTE_ADDR'))
//         $ipaddress = getenv('REMOTE_ADDR');
//     else
//         $ipaddress = 'UNKNOWN';
//     return $ipaddress;
// }

$base_url =  Yii::getAlias('@web');
AppAsset::register($this);
// echo $_SERVER['DOCUMENT'].Yii::getAlias('@web').'/backend';
if(!Yii::$app->user->isGuest){
    $userid  = Yii::$app->user->getId();
    $command = Yii::$app->db->createCommand("select * from user where id = $userid");
    $userData = $command->queryOne();
    $user_type_id = Yii::$app->user->identity->user_type_id;
    $img_id = Yii::$app->user->identity->img_url;
    $database = Yii::$app->db->createCommand("SELECT DATABASE()")->queryScalar();
    
  }else{
    $user = "";
    $user_type_id = "";
    $img_id = "";
    $userData = "";
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
$img_url = $base_url."/".$img_url; 
$request = Yii::$app->request;
$smMenu = $request->get('smMenu',0);

if($smMenu !=0){
    $dynamicMenu = "mainnav-sm";
}else{
    $dynamicMenu = "mainnav-lg";
}

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <link rel="icon" type="image/png" href="<?= Yii::getAlias('@web')?>/img/fav.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link href="../plugins/pace/pace.min.css" rel="stylesheet">
    <script src="../plugins/pace/pace.min.js"></script>
    <style>
        .pace:before {
            background-color: #25476a;
        }
        .pace .pace-progress, .nano>.nano-pane>.nano-slider {
            background-color: #487eb0;
        }
        .breadcrumb {
            border-radius: 0;
            background-color: #ffc5d900;
            margin-bottom: -15px;
            padding: 0 20px 10px;
            font-size: 14px;
        }
    </style>
    <?php $class_id = isset($this->params['current_page']) ? $this->params['current_page'] : 'dashboard';?>
</head>
<body>
  <!-- <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v4.0&appId=258699247824949&autoLogAppEvents=1"></script> -->
<!-- <div class="watermark-noti">
Be safe, license must be activated now!
</div> -->
<?php $this->beginBody() ?>
    <div id="container" class="effect aside-float aside-bright <?= $dynamicMenu; ?>">

        <!--NAVBAR-->
        <!--===================================================-->
        <header id="navbar" class="no-print">
            <div id="navbar-container" class="boxed">

                <!--Brand logo & name-->
                <!--================================-->
                <div class="navbar-header no-print">
                    <a href="<?= Yii::$app->homeUrl ?>" class="navbar-brand">
                        <img src="<?= $base_url;?>/img/eo_logo.png" alt="eO Logo" class="brand-icon">
                        <div class="brand-title">
                            <span class="brand-text">BMS</span>
                        </div>
                    </a>
                </div>
                <!--================================-->
                <!--End brand logo & name-->

                <!--Navbar Dropdown-->
                <!--================================-->
                <div class="navbar-content no-print">
                    <ul class="nav navbar-top-links">

                        <!--Navigation toogle button-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <li class="tgl-menu-btn">
                            <a class="mainnav-toggle slide" href="#">
                                <i class="demo-pli-list-view"></i>
                            </a>
                        </li>
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End Navigation toogle button-->



                        <!--Search-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!-- <li>
                            <div class="custom-search-form">
                                <label class="btn btn-trans" for="search-input" data-toggle="collapse" data-target="#nav-searchbox">
                                    <i class="demo-pli-magnifi-glass"></i>
                                </label>
                                <form>
                                    <div class="search-container collapse" id="nav-searchbox">
                                        <input id="search-input" type="text" class="form-control" placeholder="Type for search...">
                                    </div>
                                </form>
                            </div>
                        </li> -->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End Search-->

                    </ul>
                    <ul class="nav navbar-top-links no-print">

                        <!--User dropdown-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <li id="dropdown-user" class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                                <span class="ic-user pull-right no-print">
                                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                    <!--You can use an image instead of an icon.-->
                                    <!--<img class="img-circle img-user media-object" src="img/profile-photos/1.png" alt="Profile Picture">-->
                                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                    <i class="demo-pli-male"></i>
                                </span>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--You can also display a user name in the navbar.-->
                                <!--<div class="username hidden-xs">Aaron Chavez</div>-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            </a>


                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right panel-default">
                                <ul class="head-list">
                                    <?php
                                    if($userid != 1){
                                    ?>
                                    <li>
                                        <a href="<?= Url::toRoute(['employee-profile/profile?id='.Yii::$app->user->identity->id_employee.'&smMenu=1']) ?>" ><i class="demo-pli-male icon-lg icon-fw"></i> Profile</a>
                                    </li>
                                    <?php
                                    }
                                    ?>
                                    
                                    <li>

                                        <?= Html::a('<i class="demo-pli-unlock icon-lg icon-fw"></i> Logout', ['site/logout'], ['data' => ['confirm' => 'Are you sure, you want to Logout?',
                                                        'value' => Url::toRoute('site/logout'),
                                                        'method' => 'post',]]) ?>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End user dropdown-->


                        <!-- <li>
                            <a href="#" class="aside-toggle">
                                <i class="demo-pli-dot-vertical"></i>
                            </a>
                        </li> -->
                    </ul>
                </div>
                <!--================================-->
                <!--End Navbar Dropdown-->

            </div>
        </header>
        <!--===================================================-->
        <!--END NAVBAR-->

        <div class="boxed">
            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                <div id="page-head" class="no-print">

                    <!--Page Title-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!-- <div id="page-title">
                        <h1 class="page-header text-overflow"><?= Html::encode($this->title) ?></h1>
                    </div> -->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->

                    <!--Breadcrumb-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

                    <?= Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    ]) ?>

                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End breadcrumb-->

                </div>


                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    <?= $content;?>
                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->

            <nav id="mainnav-container" class="no-print">
                <div id="mainnav">
                    <div id="mainnav-menu-wrap">
                        <div class="nano">
                            <div class="nano-content">
                                <!--Profile Widget-->
                                <!--================================-->
                                <div id="mainnav-profile" class="mainnav-profile">
                                    <div class="profile-wrap text-center">
                                        <div class="pad-btm"> 
                                            <img class="img-circle img-lg" src="<?= $img_url; ?>" onError="this.onerror=null;this.src='<?= $base_url.'/backend/uploads/empty-avatar.png' ?>';" alt="Profile Picture">
                                        </div>
                                        <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                        <?php
                                        if(!Yii::$app->user->isGuest){
                                        ?>
                                        <p class="mnp-name"><?= $userData['first_name']." ".$userData['last_name'];?></p>
                                            <span class="mnp-desc"><?= $userData['email'];?></span>
                                        </a>
                                        <?php } ?>
                                    </div>
                                </div>

                                <ul id="mainnav-menu" class="list-group">
						            <!--Category name-->
						            <li class="list-header">Navigation</li>
						            <!--Menu list item-->
						            <!-- <li class="dashboard">
						                <a href="<?= Yii::$app->homeUrl ?>">
						                    <i class="demo-pli-home"></i>
						                    <span class="menu-title">Dashboard</span>
						                </a>
                                    </li> -->

                                    <?php
                                        $permission_menu = \backend\models\PermissionMenu::find()
                                            ->innerJoin('permission_action', 'permission_action.permission_menu_id = permission_menu.id')
                                            ->where(['permission_menu.is_parent'=>1, 'permission_menu.status'=>1, 'permission_action.user_type_id'=>$user_type_id])
                                            ->orderBy(['sort'=>SORT_ASC])
                                            ->all();
                                        if(!empty($permission_menu)){
                                            foreach ($permission_menu as $key => $value) {
                                                $count = \backend\models\PermissionMenu::find()
                                                        ->where(['is_parent'=>0, 'status'=>1, 'parent_id'=>$value->id])
                                                        ->count();

                                                // if($value->menu_name != 'Setting' && $value->menu_name != 'Sale'){
                                                if($count == 0){
                                    ?>
                                                    <li class="<?= $value->css_class ?>">
                                                        <a href="<?= Url::toRoute($value->menu_url) ?>" >
                                                            <i class="<?= $value->menu_icon ?>"></i>
                                                            <span class="menu-title"><?= $value->menu_name ?></span>
                                                        </a>
                                                    </li>
                                    <?php
                                            }else{
                                    ?>
                                                    <li class="<?= $value->css_class ?>">
                                                        <a href="#">
                                                            <i class="<?= $value->menu_icon ?>"></i>
                                                            <span class="menu-title"><?= $value->menu_name ?></span>
                                                            <i class="arrow"></i>
                                                        </a>
                                                        <!--Submenu-->
                                                        <ul class="collapse">
                                                            <?php
                                                                $permission_sub_menu = \backend\models\PermissionMenu::find()
                                                                ->where(['is_parent'=>0, 'status'=>1, 'parent_id'=>$value->id])
                                                                ->orderBy(['sort'=>SORT_ASC])
                                                                ->all();
                                                                if(!empty($permission_sub_menu)){
                                                                    foreach ($permission_sub_menu as $key_sub => $value_sub) {
                                                            ?>
                                                                        <li class="<?= $value_sub->css_class ?>"><a href="<?= Url::toRoute($value_sub->menu_url) ?>"><?= $value_sub->menu_name ?></a></li>
                                                            <?php
                                                                    }
                                                                }
                                                            ?>
                                                        </ul>
                                                    </li>
                                    <?php
                                                }
                                            }
                                        }
                                    ?>

                                </ul>

                                <!--Widget-->
                                <!--================================-->
                                <div class="mainnav-widget">

                                    <!-- Show the button on collapsed navigation -->
                                    
                                    <!-- <div class="show-small">
                                        <a href="#" data-toggle="menu-widget" data-target="#demo-wg-server">
                                            <i class="demo-pli-monitor-2"></i>
                                        </a>
                                    </div> -->

                                    <!-- Hide the content on collapsed navigation -->
                                    <div id="demo-wg-server" class="hide-small mainnav-widget-content">
                                        <ul class="list-group">
                                            <li class="list-header pad-no mar-ver">Project Status</li>

                                            <?php
                                                $project_pin = \backend\models\Project::find()->where(['is_pin'=>1])->all();
                                                if(!empty($project_pin)){

                                                    if(!function_exists('calculateProgress')){
                                                        function calculateProgress($current, $all){
                                                            if($all == 0){
                                                                $all = 1;
                                                            }
                                                            $result = ($current / $all) * 100;
                                                            return number_format($result,2);
                                                        }
                                                    }

                                                    foreach ($project_pin as $key => $value) {

                                                        $all_task = \backend\models\Task::find()->where(['id_related_to'=>1])->andWhere(['id_related_profile'=>$value->id])->count();
                                                        $complete_task = \backend\models\Task::find()->where(['status'=>5])->andWhere(['id_related_to'=>1])->andWhere(['id_related_profile'=>$value->id])->count();
                                            ?>
                                                <li class="mar-btm">
                                                    <span class="label label-primary pull-right"><?= $value->is_calculate==0?$value->project_progress : calculateProgress(($complete_task), $all_task); ?>%</span>
                                                    <p><a href="<?= Url::toRoute(['project/overview', 'id'=>$value->id]) ?>" class="btn_link"> <?= $value->project_name ?></a></p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-primary" style="width: <?= $value->is_calculate==0?$value->project_progress : calculateProgress(($complete_task), $all_task); ?>%;">
                                                            <span class="sr-only"><?= $value->is_calculate==0?$value->project_progress : calculateProgress(($complete_task), $all_task); ?>%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php } } ?>
                                            <li class="pad-ver"><a href="<?= Url::toRoute(['project/index']) ?>" class="btn btn-success btn-bock">View Details</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!--================================-->
                                <!--End widget-->

                            </div>
                        </div>
                    </div>
                    <!--================================-->
                    <!--End menu-->

                </div>
            </nav>

        </div>



        <!-- FOOTER -->
        <!--===================================================-->
        <!-- ZE5oYmptMVczUlhqZnd1dWFUWTRvWEtUcUJvdWRyazRrOUR3Z1RqcWZRZz0 -->
        <footer id="footer" style="z-index: 1px;" class="no-print">
            <p class="pad-lft">&#0169; <?= date('Y')." ".Yii::powered()." ".Yii::eOTLic("11ZE5oYmptMVczUlhqZnd1dWFUWTRvWEtUcUJvdWRyazRrOUR3Z1RqcWZRZz0=",$base_url);?> </p>
        </footer>
        <!--===================================================-->
        <!-- END FOOTER -->


        <!-- SCROLL PAGE BUTTON -->
        <!--===================================================-->
        <button class="scroll-top btn no-print">
            <i class="pci-chevron chevron-up"></i>
        </button>
        <!--===================================================-->
    </div>
    <!--===================================================-->
    <!-- END OF CONTAINER -->
    <?php
            Modal::begin([
                'header' => ' <h4 class="modal-title">'.'Users'.'</h4>',
                'id' => 'modal',
                'class' => 'modal fade',
                'size' => 'modal-lg',
            ]);
            echo "<div id='modalContent'></div>";
            Modal::end();

        ?>
    <?php
$session = Yii::$app->session;

if ($session->hasFlash('success')){
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


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
<?php
$this->registerJs('

        var controller_id = "user";
        $("#select_page_size").change(function(){
            var page_size = $("#select_page_size").val();
            var url = window.location.pathname;
                window.location.replace(url+"?r="+controller_id+"/index&page_size="+page_size);
        });


        $(document).on("click","#modalButton",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonView",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

        $(document).on("click","#modalButtonUpdate",function () {
            $("#modal").modal("show")
                .find("#modalContent")
                .load($(this).attr("value"));
        });

    ');
?>
<script type="text/javascript">
$('.<?=$class_id?>').addClass('active-sub active');
$('.<?=$class_id?> ').addClass('active-link');
</script>
