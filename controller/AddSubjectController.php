<?php
// Include your database connection file
include '../include/DatabaseClass.php';
$db = new database();

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Collect form data
    $name = $_POST["name"];
    $code = $_POST["code"];
    $description = $_POST["description"];
    $level = $_POST["level"];
    $semester = $_POST["semester"];

    // Insert data into the Subjects table
    $sqlSubject = "INSERT INTO subjects (Name, Code, Description, LevelID, Semester) 
        VALUES ('$name', '$code', '$description', $level, $semester)";
    $db->insert($sqlSubject);
    header("Location: ../views/admin_add_subject.php");
    exit();
} else {
    echo 'the data is not sent';    
}

?>
