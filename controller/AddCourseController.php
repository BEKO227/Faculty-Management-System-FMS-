<?php
// Include your database connection file
include '../include/DatabaseClass.php';
$db = new database();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Collect form data
    $subjectID = $_POST["subject"];
    $professorID = $_POST["professor"];
    $room = $_POST["room"];
    $scheduleDay = $_POST["schedule_day"];
    $scheduleTime = $_POST["schedule_time"];
    $durationHours = 2; // Assuming the course duration is 2 hours

    // Insert data into the Courses table
    $sql = "INSERT INTO Courses (SubjectID, ProfessorID, Room, ScheduleDay, ScheduleTime, DurationHours) 
            VALUES ('$subjectID', '$professorID', '$room', '$scheduleDay', '$scheduleTime', $durationHours)";

    // Execute the query
    if ($db->insert($sql)) {
        header("Location: ../views/admin_create_course.php");
        exit();
    } else {
        echo "Error: Unable to create the course.";
    }
}
?>
