<?php
session_start();

// Check if the user is logged in and is a professor
if ($_SESSION['username'] && $_SESSION['type'] == "professor") {
    include_once '../include/DatabaseClass.php';

    // Check if the request is a POST request
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Collect form data
        $AnswerID = $_POST['AnswerID'];
        $Grade = $_POST['Grade'];

        // Update the grade in the Answers table
        $db = new database();

        $sql = "UPDATE answers SET 
                Grade = '$Grade'
                WHERE AnswerID = '$AnswerID'";

        // Assuming your database class has an 'update' method
        if ($db->update($sql)) {
            // Redirect to another page after successful update
            header("Location: ../views/professor_manage_students.php");
            exit();
        } else {
            echo json_encode(['result' => 0, 'error' => 'Failed to update grade.']);
        }
    } else {
        echo json_encode(['result' => 0, 'error' => 'Invalid request.']);
    }
} else {
    echo json_encode(['result' => 0, 'error' => 'Unauthorized access.']);
}
?>
