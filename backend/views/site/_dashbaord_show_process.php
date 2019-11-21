<div class="col-md-3">
    <div class="panel">
        <div class="panel-body"> 
        <p class="text-primary text-md">INVOICES AWAITING PAYMENT <?=$waitingInvoiceToPay;?>/<?=$allInvoiceToPay;?></p>
        <div class="progress progress-md"><div style="width: <?= $waitingInvoiceToPay / max($allInvoiceToPay, 1) * 100;?>%;" class="progress-bar progress-bar-info"></div></div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="panel">
        <div class="panel-body"> 
        <p class="text-primary text-md">CONVERTED LEADS <?=$leadConverted;?>/<?=$allLead;?></p>
        <div class="progress progress-md"><div style="width: <?= $leadConverted / max($allLead, 1) * 100;?>%;" class="progress-bar progress-bar-danger"></div></div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="panel">
        <div class="panel-body"> 
        <p class="text-primary text-md">PROJECTS IN PROGRESS <?=$projectInprogress;?>/<?=$allProject;?></p>
        <div class="progress progress-md"><div style="width: <?= $projectInprogress / max($allProject, 1) * 100;?>%;" class="progress-bar progress-bar-purple"></div></div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="panel">
        <div class="panel-body"> 
        <p class="text-primary text-md">TASKS FINISHED <?=$taskCompleted;?>/<?=$allTask;?></p>
        
        <div class="progress progress-md"><div style="width: <?= $taskCompleted / max($allTask, 1) * 100;?>%;" class="progress-bar progress-bar-success"></div></div>
        </div>
    </div>
</div>