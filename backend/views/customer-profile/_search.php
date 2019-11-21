<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
$city = ArrayHelper::map(\backend\models\City::find()
    ->where(['status' => 1])
    ->all(), 'id', 'names');
$customer_type = ArrayHelper::map(\backend\models\CustomerType::find()
->where(['status' => 1])
->all(), 'id', 'name');
$request = Yii::$app->request;
$id_employee_profile = $request->get('id_employee_profile',0);
if($id_employee_profile !=0){
    $smMenu = 1;
}else{
    $smMenu = 0;
}
$date_range = ['today' => 'Today', 'week' => 'This Week', 'month'=> 'This Month', 'year'=>'This Year', 'custom'=>'Custom'];

$search_content = "Customer Name, Company Name, Phone Number, Email";

$today = date('Y-m-d');

$monday = strtotime("last monday");
$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;
$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
$week_start = date("Y-m-d",$monday);
$week_end = date("Y-m-d",$sunday);

$day = date('Y-m-d');
$month_start = date('Y-m-01');
$month_end = date("Y-m-t", strtotime($day));

$year_start = date('Y-m-d', strtotime('01/01'));
$year_end = date('Y-m-d', strtotime('12/31'));

$date_template = '{label}</br><div class="input-group" style="margin-top: -7px;">
            <span class="input-group-addon"><i class="demo-pli-calendar-4"></i></span> {input} </div>{error}{hint}';

?>


<style>
.form-group {
    width: 100%;
}
    /*Search Form Button*/
button:focus {
    box-shadow: none !important;
    outline: none !important;
}
.search-button{
    display: block;
    width: 95px;
    padding: 4px;
    border: 1px solid #333;
    border-radius: 2px;
}
.button-hover-search{
    background: #337ab7;
    border: 1px solid #337ab7;
    color: #fff;
    display: inline-block;
}
.button-hover-add_new{
    background: #ef6200;
    border: 1px solid #ef6200;
    color: #fff;
    display: inline-block;
}
.button-hover-search:hover{
    background: #3c6d98;
    border: 1px solid #3c6d98;
    color: #fff;
}
.button-hover-add_new:hover{
    background: #f17f2f;
    border: 1px solid #f17f2f;
    color: #fff;
}
.search-button .search-main-button{
    background: transparent;
    padding: 5px;
    color: #333;
    border: 1px solid;
    cursor: pointer;
    font-size: 13px;
    border-radius: 0px 5px 0px 0px;
    width: 100% !important;
}
.search-button .fa {
    font-size: 1em;
    line-height: 20px;
}

/*End Search Form Button*/
</style>
<div class="customer-profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="row" style="margin-top:10px;margin-bottom:10px;">
        <div class="col-md-2"> 
            <?= $form->field($model, 'id_city')->widget(Select2::classname(), [
                    'data' => $city,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'City'],
                    'pluginOptions' => [
                        'allowClear' => true,

                    ],
                ])->label(false);
            ?>
        </div>
        <div class="col-md-2"> 
            <?= $form->field($model, 'id_customer_type')->widget(Select2::classname(), [
                    'data' => $customer_type,
                    'theme' => Select2::THEME_DEFAULT,
                    'language' => 'eg',
                    'options' => ['placeholder' => 'Customer Type'],
                    'pluginOptions' => [
                        'allowClear' => true,

                    ],
                ])->label(false);
            ?>
        </div>
        <div class="col-md-2"> 
            <?= $form->field($model, 'status')->widget(Select2::classname(), [
                        'data' => (["1" => "Active","0" => "Inactive"]),
                        'theme' => Select2::THEME_DEFAULT,
                        'language' => 'eg',
                        'options' => ['placeholder' => 'Status'],
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ])->label(false);
            ?>
        </div>    
        <div class="col-md-2"> 
            <?= $form->field($model, 'globalSearch')->textInput(['class'=>'form-control popover_content',  "data-html"=>true, "data-original-title"=>"Filter likes:", 'data-content'=>$search_content, "data-placement"=>"bottom", "data-trigger"=>"hover", 'placeholder'=>'Search...'])->label(false) ?>
        </div>

        <div class="col-md-4">
            <div class="pull-right">
                <button class="btn btn-success btn-rounded" style="margin-left: 5px;">
                    Search <i class="fa fa-search go-right"></i>
                </button> 
                <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-mint btn-rounded" id="modalButtonImport" value="<?= Url::toRoute(['customer-profile/import-csv']) ?>">Import CSV <i class="demo-psi-file-csv go-right"></i>
                </button> 
                <button type="button" data-target="#demo-default-modal" data-toggle="modal" class="btn btn-warning btn-rounded" id="modalButton" value="<?= Url::toRoute(['customer-profile/create']) ?>">Add New <i class="fa fa-plus-square go-right"></i>
                </button> 
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php

$script = <<<JS

    $('#customerprofilesearch-from_date, #customerprofilesearch-to_date').datepicker({
        format: 'yyyy-mm-dd',
        changeMonth: true,
        changeYear: true,
        autoclose: true,
    });

    $("#customerprofilesearch-from_date").change(function(){

        $('#customerprofilesearch-to_date').datepicker('setStartDate', $(this).val());

        if(Date.parse($(this).val()) > Date.parse($('#customerprofilesearch-to_date').val())){
            $('#customerprofilesearch-to_date').datepicker('setDate', $(this).val());
        }

    });

    $("#customerprofilesearch-from_date,#customerprofilesearch-to_date").change(function(){
        $('#customerprofilesearch-date_range').val('custom').trigger('change');
    });

    $("#customerprofilesearch-date_range").change(function(){
        var name = $(this).val();

        if(name == 'today'){
            $("#customerprofilesearch-from_date").val("$today");
            $("#customerprofilesearch-to_date").val("$today");
        }else if(name == 'week'){
            $("#customerprofilesearch-from_date").val("$week_start");
            $("#customerprofilesearch-to_date").val("$week_end");
        }else if(name == 'month'){
            $("#customerprofilesearch-from_date").val("$month_start");
            $("#customerprofilesearch-to_date").val("$month_end");
        }else if(name == 'year'){
            $("#customerprofilesearch-from_date").val("$year_start");
            $("#customerprofilesearch-to_date").val("$year_end");
        }
    });

    $('.popover_content').popover();

JS;

$this->registerJs($script);

?>