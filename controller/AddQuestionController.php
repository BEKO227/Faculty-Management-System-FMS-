<?php
// Include your database connection file
include '../include/DatabaseClass.php';
$db = new database();

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Collect form data
    $CourseID = $_POST["CourseID"];
    $TextQuestion = $_POST["TextQuestion"];

    // Insert data into the Subjects table
    $sqlProfessor = "INSERT INTO questions (CourseID, TextQuestion)
                     VALUES ('$CourseID','$TextQuestion')";

    $db->insert($sqlProfessor);
    header("Location: ../views/professor_questions.php");
    exit();
} else {
    echo 'the data is not sent';    
}

?>
