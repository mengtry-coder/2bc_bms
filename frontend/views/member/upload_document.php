<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
@$id_membership_profile = $_GET['id_membership_profile'];

$base_url = Yii::getAlias('@web');

// echo "<pre>";
// print_r($document);
?>
<style>
.modal {
    overflow-x: hidden;
    overflow-y: auto;
}
</style>
<div class="membership-document-uplaod-document"> 
<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($document, 'file_name[]')->fileInput(['multiple' => true, 'accept' => 'image/*']) ?>

    <button>Submit</button>

<?php ActiveForm::end() ?>
    <!-- <br>
    <div class="text-right"> 
        <button type="submit" class="btn btn-success btn-rounded">Save</button>    
    </div> -->
</div>
 