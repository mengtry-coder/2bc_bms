<?php

namespace backend\assets;

use yii\web\AssetBundle; 
/**
 * Main backend application asset bundle.
 */



class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [ 
        'css/custom.css',
        'css/site.css',
        'css/bootstrap.min.css',
        'css/nifty.css',
        'css/demo/nifty-demo-icons.min.css',
        'css/demo/nifty-demo.min.css',
        'plugins/font-awesome/css/font-awesome.min.css',
        'plugins/datatables/media/css/dataTables.bootstrap.css',
        'plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css',
        'plugins/switchery/switchery.min.css',
        // 'plugins/bootstrap-select/bootstrap-select.min.css',
        // 'plugins/select2/css/select2.min.css',
        'plugins/bootstrap-datepicker/bootstrap-datepicker.min.css',
        // 'plugins/dropzone/dropzone.min.css',
        'plugins/bootstrap-validator/bootstrapValidator.min.css',
        'css/switchery.min.css',
        'plugins/morris-js/morris.min.css',
        
         
    ];
    public $js = [
        // 'js/bootstrap.min.js', 
        'js/nifty.min.js', 
        'plugins/pace/pace.min.js',
        // 'js/demo/nifty-demo.min.js',
        'plugins/datatables/media/js/jquery.dataTables.js',
        'plugins/datatables/media/js/dataTables.bootstrap.js',
        'plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js', 
        'js/demo/tables-datatables.js',
        'plugins/flot-charts/jquery.flot.min.js',
        'plugins/flot-charts/jquery.flot.resize.min.js',
        'plugins/flot-charts/jquery.flot.tooltip.min.js',
        // 'js/demo/form-text-editor.js',
        // 'plugins/summernote/summernote.min.js',
        // 'js/demo/form-text-editor.js',
        'js/demo/ui-modals.js',
        'plugins/bootstrap-datepicker/bootstrap-datepicker.min.js', 
        // 'plugins/dropzone/dropzone.min.js',
        'plugins/switchery/switchery.min.js',
        // 'plugins/momentjs/moment.min.js',
        // 'plugins/select2/js/select2.min.js',
        'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js',
        'plugins/bootstrap-validator/bootstrapValidator.min.js',
        'js/demo/form-wizard.js',
        // 'plugins/easy-pie-chart/jquery.easypiechart.min.js',
        // 'js/demo/form-component.js',
        'js/switchery.min.js',
        'js/jquery.timepicker.js',
        // 'js/summernote-cleaner.js', 
         
        
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
