
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Login to eO-BMS</title> 
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href="../css/bootstrap.min.css" rel="stylesheet"> 
    <link href="../css/nifty.css" rel="stylesheet"> 
    <link href="../css/demo/nifty-demo-icons.min.css" rel="stylesheet"> 
    <link href="../plugins/pace/pace.min.css" rel="stylesheet">
    <script src="../plugins/pace/pace.min.js"></script> 
    <link rel="icon" type="image/png" href="<?= Yii::getAlias('@web')?>/img/fav.png" /> 
    <link href="../css/demo/nifty-demo.min.css" rel="stylesheet"> 
</head> 
<style type="text/css">
    #container {
        background-image: url("<?= Yii::getAlias('@web');?>/img/login_background.jpg") !important;
        /*background-color: #cccccc;*/
    }
</style>
<body>
    <div id="container" class="cls-container"> 
		<div id="bg-overlay"></div>  
		<?= $content; ?> 
    </div>
    <script src="../js/jquery.min.js"></script> 
    <script src="../js/bootstrap.min.js"></script> 
    <script src="../js/nifty.min.js"></script> 
    <script src="../js/demo/bg-images.js"></script> 
</body>
</html>


