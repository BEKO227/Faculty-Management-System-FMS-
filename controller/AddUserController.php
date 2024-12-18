<?php

if(isset($_POST["submit"])){

  $info['username']=$_POST['s_username'];
  $info['password'] = $_POST['s_password'];
  $info['type'] = 'student';
  $info['fname'] = $_POST['s_fname'];
  $info['lname'] = $_POST['s_lname'];
  $info['phone'] = $_POST['s_phone'];
  $info['address'] = $_POST['s_address'];
  $info['email'] = $_POST['s_email'];
  $info['age'] = $_POST['s_age'];

  include '../models/UsersClass.php';
  $student = new users();
  $student = $student->addUser($info);

  if($student) {
    //echo'Data is stored!'; 
    header("location: ../views/admin_view_students.php");  
    } else {
    //echo 'Data is not stored!. The username is already used.';
    header("location: ../views/admin_home.php");
  } 
}

?>