<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use common\models\GlobalFunction;
/* @var $this yii\web\View */
/* @var $model backend\models\Item */
/* @var $form yii\widgets\ActiveForm */
$dollar_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-dollar"></i></span> {input} </div>{error}{hint}';
$number_template = '{label}</br><div class="input-group">
            <span class="input-group-addon"><i class="fa fa-bars"></i></span> {input} </div>{error}{hint}';
$itemgroup = ArrayHelper::map(\backend\models\ItemGroup::find()
    ->all(), 'id', function($model){return $model->name;});

$item_type = \backend\models\ItemGroupType::find()->all();


?>

<div class="item-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'id_group')->widget(Select2::classname(), [
                            'data' => $itemgroup,
                            'theme' => Select2::THEME_DEFAULT,
                            'language' => 'eg',
                            'options' => ['placeholder' => 'Select'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ]);
                    ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'rate', ['template'=>$dollar_template])->textInput(['type' => 'number', 'step' => '0.01', 'min'=>'0', 'value'=>$model->isNewRecord? 0 : $model->rate]) ?>
                </div>
                <div class="col-md-3">
                    <?php
                        if(GlobalFunction::SettingValue(1) !=""){ 
                            echo $form->field($model, 'setup_fee', ['template'=>$dollar_template])->textInput(['type' => 'float','min'=>'0', 'value'=>$model->isNewRecord? 0 : $model->setup_fee])->label(GlobalFunction::SettingValue(1));
                        }
                    ?>
                </div>
            </div>
            <?= $form->field($model, 'short_description')->textArea(['maxlength' => true]) ?>

            <?= $form->field($model, 'long_description')->textArea(['rows' => 8]) ?>

            <?php $model->isNewRecord ? $model->status = 1: $model->status = $model->status;?>
            <?php if ($model->status != 1) { $model->status = 0;} ?>
            <?= $form->field($model, 'status')->radioList(['1' => 'Active', '0' => 'Inactive']) ?>

        </div>
        <div class="col-md-12 bord-lft">
            <?php 
                foreach ($item_type as $key => $value) {
            ?>

            <p class="text-uppercase text-semibold text-main"> <?= $value->name ?></p>
            <?php 
                    $id_type = $value->id;
                    $id_item = $model->id;
                    $item_data = Yii::$app->db->createCommand("
                        SELECT a.id, a.title, b.`status`, b.description
                        from item_group_data as a
                        LEFT JOIN item_data as b on a.id = b.id_data and b.id_item = :id_item
                        WHERE a.status = 1
                        AND a.id_type = :id_type
                    ")
                    ->bindParam(':id_item', $id_item)
                    ->bindParam(':id_type', $id_type)
                    ->queryAll();
                    // $item_data = \backend\models\ItemGroupData::find()->where(['id_type'=>$value->id, 'status'=>1])->all();
                    foreach ($item_data as $k => $v) {
                ?>
            <div class="row" style="padding-bottom: 5px;">
                <div class="col-md-6">
                    <div class="checkbox">
                        <input id="checkbox_status_<?= $v['id'] ?>" <?= $v['status'] == 1 ? 'checked' : '' ?> value="1"
                            name="checkbox_status[]" class="magic-checkbox checklist_box" data-id="<?= $v['id'] ?>"
                            type="checkbox">
                        <label for="checkbox_status_<?= $v['id'] ?>"><?= $v['title'] ?></label>
                        <input type="hidden" value="<?= $v['status'] ?>" name="checkbox_id[]"
                            id="checkbox_id_<?= $v['id'] ?>" data-id="<?= $v['id'] ?>" />
                        <input type="hidden" value="<?= $v['id'] ?>" name="feature_id[]" class="form-control" />
                    </div>
                </div>
                <div class="col-md-6">
                    <input type="text" name="feature[]" value="<?= $v['description'] ?>" placeholder="…"
                        class="form-control" />
                </div>
            </div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>

    <div class="text-right">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-rounded']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>

<?php 

$script = <<<JS
    
    $(".checklist_box").change(function(){
        
        var id = $(this).data('id');
        if($(this).is(':checked')){
            $("#checkbox_id_"+id).val(1);
        }else{
            $("#checkbox_id_"+id).val(0);
        }

    });

JS;

$this->registerJs($script);

?>