<?php
function encryptdecrypt($string, $action = 'e')
{
    $secretkey = 'Thats my secret key for eot_Soft';
    $secretiv  = 'Thats my secret key for eot_Soft iv';
    
    $output    = false;
    $encmethod = "AES-256-CBC";
    $key       = hash('sha256', $secretkey);
    $iv        = substr(hash('sha256', $secretiv), 0, 16);
    
    if ($action == 'e')
    {
        $output = base64_encode(openssl_encrypt($string, $encmethod, $key, 0, $iv));
    }
    else if ($action == 'd')
    {
        $output = openssl_decrypt(base64_decode($string), $encmethod, $key, 0, $iv);
    }
    
    return $output;
}
?>
<html>
    <head>
        <title>Encrypt-Decrypt Demo</title>
        <style>
            input[type=text]{
                width:100% !important;
            }
            form {
                margin: 10% auto 0;
            }
        </style>
    </head>
<body>
    <form method="post">
    <center><h1>Encrypt-Decrypt Demo</h1></center>
        <table border="1" align="center">
            <tr>
                <td>Enter Text</td>
                <td><input type="text" name="txtdemotext"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="btnencrypt" value="Encrypt"> <input type="submit" name="btndecrypt" value="Decrypt"></td>
            </tr>
        </table>
    </form>
    <?php
      if (isset($_REQUEST["btnencrypt"]))
      {
        $txtvalue = $_REQUEST["txtdemotext"];
    
        $encryptdata = encryptdecrypt($txtvalue, 'e');
    
        echo "<table border='1' align='center' style='margin-top:15px;'>
            <tr>
               <th>Encrypted code is</th>
            </tr>
            <tr>
               <td>$encryptdata</td>
            </tr>
          </table>";
      }
      if (isset($_REQUEST["btndecrypt"]))
      {
        $txtvalue    = $_REQUEST["txtdemotext"];
        $decryptdata = encryptdecrypt($txtvalue, 'd');
        echo "<table border='1' align='center' style='margin-top:15px;'>
             <tr>
                <th>Decrypted code is</th>
             </tr>
             <tr>
                <td style='text-align:center;'>$decryptdata</td>
             </tr>
          </table>";
      }
    ?>
</body>
</html>