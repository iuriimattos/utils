<?php
ob_start();  // Start output buffering
phpinfo();   // Call phpinfo()
$info = ob_get_contents();  // Get the output of phpinfo()
ob_end_clean();  // Clean (erase) the output buffer

file_put_contents('file.txt', $info);  // Write the phpinfo output to the file.txt
echo 'phpinfo() output has been saved to file.txt';
?>
