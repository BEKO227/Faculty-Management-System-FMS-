<?php
session_start();

// Include your database connection file
include '../include/DatabaseClass.php';
$db = new database();

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Collect form data
    $questionID = $_POST["questionID"];
    $answer = $_POST["answerFile"];

    // Get the student's ID (assuming you have stored it in the session)
    $studentID = $_SESSION['id'];

    // Insert data into the answers table
    $sql = "INSERT INTO answers (QuestionID, StudentID, FileURL)
            VALUES ('$questionID', '$studentID', '$answer')";

    $db->insert($sql);
    header("Location: ../views/student_assignment.php");
    exit();
} else {
    echo 'The data is not sent';
}
?>
