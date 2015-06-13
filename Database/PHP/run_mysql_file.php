<?php
function run_mysql_file($serverName, $username, $password, $file_location)
{
    $ret = 0;
    // Create connection
    $conn = new mysqli($serverName, $username, $password);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    echo "<pre><ul><li>Connected successfully</li><br>";

    // Query here
    // Read each like from .sql
    $lines = file($file_location);
    $templine = '';
    foreach ($lines as $line) {
        // Skip it if it's a comment
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;

        // Add this line to the current segment
        $templine .= $line;
        // If it has a semicolon at the end, it's the end of the query
        if (substr(trim($line), -1, 1) == ';') {
            // Perform the query
            $conn->query($templine) or (print('<li>Error performing query: <strong>' . $templine . '==> ' . "<mark><u>" . $conn->error . "(" . $conn->errno . ")</u>" . '</mark></strong><br /><br /></li>') and $ret++);
            // Reset temp variable to empty
            $templine = '';
        }
    }
    echo "</ul>";
    echo $ret . " Error(s)<br>";
    echo "Done loading <b><u>" . $file_location . "</u></b>";
    echo "</pre>";
    $conn->close();
    return $ret;
}
?>

