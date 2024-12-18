<?php
session_start();

if ($_SESSION['username'] && $_SESSION['type'] == "admin") {
    include_once '../include/DatabaseClass.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $professorID = $_POST['professorID'];
        $name = $_POST['name'];
        $degree = $_POST['degree'];
        $department = $_POST['department'];
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Update the professor record
        $db = new database();
        $sql = "UPDATE professors SET 
                Name = '$name',
                Degree = '$degree',
                Department = '$department',
                Username = '$username',
                Password = '$password'
                WHERE ProfessorID = '$professorID'";

        if ($db->update($sql)) {
            header("Location: ../views/admin_view_professors.php");
            exit();
        } else {
            echo json_encode(['result' => 0, 'error' => 'Failed to update professor details.']);
        }
    } else {
        echo json_encode(['result' => 0, 'error' => 'Invalid request.']);
    }
} else {
    echo json_encode(['result' => 0, 'error' => 'Unauthorized access.']);
}
?>
