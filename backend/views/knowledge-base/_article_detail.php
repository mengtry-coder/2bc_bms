<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use yii\helpers\ArrayHelper;
$base_url = Yii::getAlias('@web');
$possitoin_id  = Yii::$app->user->identity->id_position;
if($possitoin_id ==""){
  $possitoin_id = "a.id_position";
}
$mysql = "SELECT * from knowledge_base_position a
         INNER JOIN knowledge_base b
         on a.id_knowledge_base = b.id
         where a.id_position = $possitoin_id and b.disabled = 0 and b.id != $model->id limit 10";
         // exit();
$related_article = Yii::$app->db->createCommand("$mysql")->queryAll();
/* @var $this yii\web\View */
/* @var $model backend\models\KnowledgeBase */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Knowledge Bases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<style media="screen">
  .wr-content{text-align: justify;}
  .head-style{
    border-left: 2px solid #ff8d00;
    padding-left: 5px;
  }
</style>
<div class="knowledge-base-view">

  <div class="panel">
      <div class="panel-body">
        <div class="col-md-9" style="border: 1px solid #ececec;">
          <h3><?=$model->name; ?></h3>
          <label for="">Posted Date:</label> <?=$model->created_date; ?>
          <hr/>
          <div class="wr-content">
            <div class="row">
              <div class="col-md-12">
                <?php
                $text = preg_replace('#(<img (.*) style=("|\')(.*?)("|\'))([a-z ]*)#', '<img \\2\\6', $model->description);
                echo  $text;
                ?>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <h3>Related Articles</h3>
          <hr/>
          <?php foreach ($related_article as $n): ?>
            <a href="<?=$base_url;?>/knowledge-base/article?id=<?=$n['id']?>">
              <h5 class="head-style"><?=$n['name']; ?></h5>
            </a>
            <label for=""><?=$n['created_date'] ?></label>
            <p><?=$n['short_description']; ?> ...</p>
            <hr/>
          <?php endforeach; ?>
        </div>
      </div>
  </div>
</div>
