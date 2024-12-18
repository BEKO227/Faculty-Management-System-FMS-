<?php

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    include_once '../include/DatabaseClass.php';       
    $db = new database();

    // Collect form data
    $first_name = htmlspecialchars($_POST["fname"]);
    $last_name = htmlspecialchars($_POST["lname"]);
    $name = $first_name . ' ' . $last_name;
    $degree = htmlspecialchars($_POST["degree"]);
    $gender = htmlspecialchars($_POST["gender"]);
    $national_id = htmlspecialchars($_POST["nationalId"]);
    $dob = htmlspecialchars($_POST["dob"]);
    $department = htmlspecialchars($_POST["department"]);
    $username = htmlspecialchars($_POST["username"]);
    $password = htmlspecialchars($_POST["password"]);
    $type = 'professor';

    // Insert data into the professors table
    $sqlProfessor = "INSERT INTO professors (Name, Degree, Gender, NationalID, DateOfBirth, Department, Username, Password)
                     VALUES ('$name', '$degree', '$gender', '$national_id', '$dob', '$department', '$username', '$password')";

    $db->insert($sqlProfessor);

    header("location: ../views/admin_view_professors.php");  
    
} else {
    header("location: ../views/admin_home.php");
}

?>