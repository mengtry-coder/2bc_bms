<?php
    use yii\helpers\Url;
    use yii\helpers\Html;
    use backend\models\ChartAccount;
    use backend\models\AccountType;
    use backend\models\User;
    use yii\helpers\ArrayHelper;

    $url = Url::toRoute('/chart-account');

    $account_type = ArrayHelper::map(\backend\models\AccountType::find()
        ->where(['status' => 1])
        ->all(), 'id', 'names');

?>
<tr>
    <td align="center"><?php echo ++$index;?></td>
    <td align="left">
        <?= empty($model->number_code)==true?0:$model->number_code;?>
    </td>
    <td style="text-align: left;"><?= $model->names;?></td>
    <td style="text-align: left;">
        <?php
            $account_type =  AccountType::find()->where(['=', 'id', $model->id_account_type])->one();
            if(!empty($account_type)){
                $account_type_name = $account_type->names;
            }else{
                $account_type_name = 'None';
            }
            echo $account_type_name;
        ?>
    </td>
    <td style="text-align: center;">
        <?php
            echo $status = $model->status == 1?'<span class="label label-info">Active</span>':'<span class="label label-warning">Inactive</span>';
        ?>
    </td>
    <td style="text-align: center;" class="btn_action">
        <button type="button" id="modalButtonUpdate" class="btn btn-xs btn-default" value="<?=$url;?>/update?id=<?=$model->id;?>">
            <i class="fa fa-pencil"></i>
        </button>
        <a class="btn btn-xs btn-default" href="<?=$url;?>/delete?id=<?=$model->id;?>" data-method="post" data-confirm="Are you sure want to delete this record?">
            <i class="fa fa-trash"></i>
        </a>
    </td>
</tr>
<tr>
    <?php
        $text_index = 0;
        findChild($data,$model->id,$text_index);        
    ?>
</tr> 
  

