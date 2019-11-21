<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
$base_url = Yii::getAlias('@web'); 
AppAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <link rel="icon" type="image/png" href="<?= Yii::getAlias('@web')?>/../img/fav.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<?php 
$class_id = Yii::$app->controller->action->id;
//  echo $class_id; exit();
 ?>
<style>
.navbar-inverse {
    background-color: #25476A;
    border-color: #25476A;
}
.navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:hover, .navbar-inverse .navbar-nav > .active > a:focus {
    color: #fff;
    background-color: #0000004a;
}
.navbar-inverse .navbar-brand {
    color: #e1e1e1;
}
.navbar-inverse .navbar-nav > li > a {
    /* color: #ffffff; */
    color: #99a5b2;
}
.navbar-inverse .navbar-toggle {
    border-color: white;
}
.navbar-inverse .navbar-nav > li {
    border-bottom: 2px solid #25476900;
}
.nav > li.<?=$class_id?> {
    background-color: #00000040;
    border-bottom: 2px solid red;
    /* border-radius: 4px; */
}
.navbar-inverse .navbar-nav > li.<?=$class_id?> > a {
    color: #ffffff;
    /* color: #000000; */
}

.navbar-brand {
    float: left;
    height: 50px;
    padding: 15px 15px;
    font-size: 18px;
    line-height: 24px;
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
</style>

<body style="background-color: #ECF0F4;">
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    $logoURL = Yii::getAlias("@web")."/img/cata_logo.png"; 
    NavBar::begin([
        'brandLabel' => '<img src='.$logoURL.' style="display: inline;vertical-align: top;height: 58px;margin-top: -18px; class="img-responsive"/> CATA MMS', 
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => 'Home','url' => [Yii::getAlias("@web")],'options'=>['class'=>'index']], 
    ];
    if (Yii::$app->user->isGuest) {
        
        $menuItems[] = ['label' => 'Signup', 'url' => [Yii::getAlias("@web/site/signup")],'options'=>['class'=>'signup']];
        $menuItems[] = ['label' => 'Login', 'url' => [Yii::getAlias("@web/site/login")],'options'=>['class'=>'login']];
        
    } else {
        $menuItems[] = ['label' => 'About', 'url' => [Yii::getAlias("@web/site/about")],'options'=>['class'=>'about']];
        $menuItems[] = ['label' => 'Contact', 'url' => [Yii::getAlias("@web/site/contact")],'options'=>['class'=>'contact']];
        $menuItems[] = ['label' => 'Profile', 'url' => [Yii::getAlias("@web/member/profile")],'options'=>['class'=>'profile']];
        $menuItems[] = ['label' => 'Payment', 'url' => [Yii::getAlias("@web/member/payment")],'options'=>['class'=>'payment']];
        $menuItems[] = ['label' => 'Event', 'url' => [Yii::getAlias("@web/member/event")],'options'=>['class'=>'event']];
        $menuItems[] = ['label' => 'Document', 'url' => [Yii::getAlias("@web/member/document")],'options'=>['class'=>'document']];
        $menuItems[] = '<li>'
            . Html::beginForm([Yii::getAlias("@web/site/logout")], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>

        <!-- <div class="boxed"> 
            <div id="content-container">
                <div id="page-head"> 
                    <div id="page-content">  --> 
                        
                       
                    <!-- </div> 
                </div>
            </div>
        </div>  -->
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <?= $this->params['breadcrumbs'][] = $this->title; ?>
                </h3>
            </div>
            <div class="panel-body"> 
            <?= $content;?>  
            </div>
        </div>
        
    </div>
</div> 
<footer id="footer" style="z-index: 1px;"> 
    <p class="pull-left" style="padding-left: 15px;">&copy; <?= Html::encode(Yii::$app->name) ?> <?= date('Y') ?></p>
    <p class="pull-right" style="padding-right: 15px;"><?= Yii::powered() ?></p> 
</footer> 

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
