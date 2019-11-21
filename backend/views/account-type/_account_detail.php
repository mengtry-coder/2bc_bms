<?php
  use yii\helpers\Url;
  use yii\helpers\Html;
  use backend\models\AccountType;
  use backend\models\User;
  $url = Url::toRoute('/account-type');
 ?>

<?php if($model->is_parent == 0) { ?>
    <tr>
        <td align="center"><?php echo ++$index;?></td>    
        <td align="left">
            <?= $model->names;?>
        </td>
        <td style="text-align: center;">
            <?php
                echo $status = $model->status == 1?'<span class="label label-info">Active</span>':'<span class="label label-warning">Inactive</span>';
            ?>
        </td>
        <td style="text-align: center;">
            <button type="button" id="modalButtonUpdate" class="btn btn-xs btn-default" value="<?=$url;?>/update?id=<?=$model->id;?>">
                <i class="fa fa-pencil"></i>
            </button>
            <a class="btn btn-xs btn-default" href="<?=$url;?>/delete?id=<?=$model->id;?>" data-method="post" data-confirm="Are you sure want to delete this record?" >
                <i class="fa fa-trash"></i>
            </a>
        </td>
    </tr>

<?php
    $sub_acc = AccountType::find()->where(['=', 'is_parent', $model->id])->all();
    foreach ($sub_acc as $n) { ?>
        <tr>
            <td></td>
            <td style="text-align: left; text-indent: 50px;"><?= $n['names']; ?></td>
            <td style="text-align: center;">
              <?php 
                $status = $n['status']==1?'<span class="label label-info">Active</span>':'<span class="label label-warning">Inactive</span>';
                echo $status;

                $sub_id = $n['id'];
              ?>
            </td>
            <td style="text-align: center;">
                <button type='button' id='modalButtonUpdate' class='btn btn-xs btn-default' value='<?= $url;?>/update?id=<?= $sub_id; ?>'>
                    <i class='fa fa-pencil'></i>
                </button>
                <a class='btn btn-xs btn-default' href='<?= $url;?>/delete?id=<?= $sub_id;?>' data-method='post' data-confirm='Are you sure want to delete this record?'>
                    <i class='fa fa-trash'></i>
                </a>
            </td>
        </tr>
<?php 
    }
} // end if
?>
         
