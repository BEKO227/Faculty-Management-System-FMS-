<?php
session_start();

if ($_SESSION['username'] && $_SESSION['type'] == "student") {
    include_once '../include/DatabaseClass.php';
    $db = new database();

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["updateStudents"])) {
        $StudentID = $_POST['StudentID'];
        $name = $_POST['name'];
        $email = $_POST['email'];
        $age = $_POST['age'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Update the professor record
        $sql = "UPDATE students SET 
                name = '$name',
                email = '$email',
                age = '$age',
                phone = '$phone',
                address = '$address',
                username = '$username',
                password = '$password'
                WHERE StudentID = '$StudentID'";
        

        if ($db->update($sql)) {
            header("Location: ../views/student_home.php");
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
