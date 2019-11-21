<?php
$report_title = 'Participaiont';
$delimiter = '-';
$file_name =  strtolower(trim(preg_replace('/[\s-]+/', $delimiter, preg_replace('/[^A-Za-z0-9-]+/', $delimiter, preg_replace('/[&]/', 'and', preg_replace('/[\']/', '', iconv('UTF-8', 'ASCII//TRANSLIT', $report_title))))), $delimiter));
header("Content-type: text/csv");
header("Content-Disposition: attachment; filename=$file_name.csv");
header("Pragma: no-cache");
header("Expires: 0");
// print_r($data_participation);
?> 
<?php
    echo "Prefix Name,First Name,Last Name,Company Name,Email\n";
    foreach($data_participation as $key => $a){
            $prefix_name = strval($a['prefix_name']);
            $first_name = strval($a['first_name']);
            $last_name = strval($a['last_name']);
            $company_name = strval($a['company_name']);
            $email = strval($a['email']);
        echo $prefix_name.",".$first_name.",".$last_name.",".$company_name.",".$email."\n";
    } 
?> 
