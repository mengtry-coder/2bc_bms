<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
$base_url =  Yii::getAlias('@web');
$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<style type="text/css">
    .panel-body {
        background: #eeeeee94;
    }
</style>
<div class="site-login"> 
    <div class="cls-content">
        <div class="cls-content-sm panel">
            <div class="panel-body">
                <div class="mar-ver pad-btm">
                <h1 class="h3"><img src="<?= $base_url;?>/img/eO-BMS.png"/ width="40%"></h1>
            <h4 >Log Into eO-BMS:</h4>    
                </div>
                <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
                    <div class="form-group">
                        <?= $form->field($model, 'username')->textInput(['autofocus' => true,'placeholder'=>'Username'])->label(false); ?>
                    </div>
                    <div class="form-group">
                        <?= $form->field($model, 'password')->passwordInput(['placeholder'=>'Password'])->label(false); ?>
                    </div>
                    <div class="checkbox pad-btm text-left">
                    <?php $form->field($model, 'rememberMe')->checkbox() ?>
                        <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
                        <label for="demo-form-checkbox">Remember me</label>
                        <div class="pull-right"><a href="pages-password-reminder.html" class="btn-link mar-rgt">Forgot password ?</a></div>
                    </div>
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-lg btn-block', 'name' => 'login-button']) ?>
                <?php ActiveForm::end(); ?> 
            </div> 
        </div>
    </div>
</div>
