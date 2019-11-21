<?php 

use yii\helpers\Html;
use yii\helpers\Url; 
use common\widgets\Alert;
use dominus77\sweetalert2\Alert as sweetAlert;
use backend\assets\AppAsset;
use backend\models\UploadedFile;
use yii\widgets\Breadcrumbs;

AppAsset::register($this);

if(!Yii::$app->user->isGuest){
    $userid  = Yii::$app->user->getId();
    $command = Yii::$app->db->createCommand("select * from user where id = $userid");
    $userData = $command->queryOne();
    $user_type_id = Yii::$app->user->identity->user_type_id;
    $img_id = Yii::$app->user->identity->img_url;
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
$img_url = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img_url);

$this->registerJsFile(
    '@web/js/sweetalert.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);

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
        #content-container {
        	padding-top: 0px;
        }
        #page-head {
        	padding-top: 10px;
        }
    </style>
    <?php $class_id = isset($this->params['current_page']) ? $this->params['current_page'] : 'dashboard';?>
</head>
<body>
	<?php $this->beginBody() ?>

		<div id="container">
			<div id="content-container">
                <div id="page-head" class="no-print">
                    <?= Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                        'homeLink'=>false // add this line
                    ]) ?> 
                </div>

                <div id="page-content"> 
                	<div class="row">
	                	<div class="col-xs-12">
		                	<div class="panel">
		                		<div class="panel-heading">
		                			<?php
                                    if(!Yii::$app->user->isGuest){
                                    ?>
                                    <div class="pull-right mar-top mar-rgt">
                                    	<img class="img-circle img-xs" src="<?= $img_url; ?>" alt="Profile Picture">
	                                    <span class="text-bold mar-rgt"><?= $userData['first_name']." ".$userData['last_name'];?></span>
	                                    <?= Html::a('<i class="demo-pli-unlock icon-lg icon-fw"></i> Logout', ['site/logout'], 
	                                    	[
		                                    	'data' => 
		                                    	[
		                                    		'confirm' => 'Are you sure, you want to Logout?',
		                                            'value' => Url::toRoute('site/logout'),
		                                            'method' => 'post',
                                        		],
                                        		'class' => 'logout-user',
                                        	]); 
                                        ?>
	                                </div>
                                    <?php } ?>
		                		</div>
		                		<div class="panel-body">
		                			<?= $content;?>  
		                		</div>
		                	</div>
	                    </div>
	                </div>
                </div>
            </div>
		</div>

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
		}
		elseif($session->hasFlash('info')){
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
		}
		elseif ($session->hasFlash('warning')) {
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
		}
		elseif ($session->hasFlash('error')) {
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
		}
		elseif ($session->hasFlash('question')) {
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
$script = <<<JS

	yii.confirm = function (message, okCallback, cancelCallback) {
        var val = $(this).data('value');
        
        if($(this).hasClass('logout-user')){
            swal({
                text: "Are you sure, you want to Logout?",
                icon: "warning",
                buttons: true,
                confirmButtonClass: "btn-warning",
                buttons: [
                    'Cancel',
                    'Logout'
                ],
                dangerMode: true
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