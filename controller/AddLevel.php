<?php

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    include_once '../include/DatabaseClass.php';       
    $db = new database();

    // Get the level name from the form
    $levelName = htmlspecialchars($_POST["selectLevel"]);

    // Define custom IDs for each level
    $customIds = [
        'lv1' => 1,
        'lv2' => 2,
        'lv3' => 3,
        'lv4' => 4,
    ];

    $customId = $customIds[$levelName];


    // Prepare and execute the SQL query with the custom ID
    $sqlLevel = "INSERT INTO levels (LevelID, LevelName) VALUES ($customId, '$levelName')";
    $db->insert($sqlLevel);
    echo "Level added successfully";

} else {
    echo 'the data is not sent';    
}

?>
