<?php
session_start();
if ($_SESSION['username'] && $_SESSION['type'] == "admin") {
    include_once '../include/DatabaseClass.php';
    
    $db = new database();

    // Check if the ID parameter is set in the URL
    if (isset($_GET['id'])) {
        $professorID = $_GET['id'];

        // Retrieve professor details based on the ID
        $sql = "SELECT * FROM professors WHERE ProfessorID = $professorID";
        $result = $db->display($sql);
        
        // Check if there is a result
        if ($result) {
            $professor = $result[0];
        } else {
            echo "Professor not found.";
            exit;
        }
        
        // Check if the professor exists
        if (!$professor) {
            echo "Professor not found.";
            exit;
        }
    } else {
        echo "Invalid request.";
        exit;
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Professor</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
</head>

<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            <img src="../assets/images/bootstrap-solid.svg" alt="" width="30" height="30">
            hi, <?php echo $_SESSION['name']; ?>
        </a>
        <form action="../views/admin_home.php" method="post" class="form-inline" style="margin:0;">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="submitLogout">Home</button>
        </form>
        <form action="LogoutController.php" method="post" class="form-inline" style="margin:0;">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="submitLogout">Logout</button>
        </form>
    </nav>

    <div class="container mt-5">
        <!-- Edit form -->
        <form action="../controller/UpdateProfessor.php" method="post">
            <input type="hidden" name="professorID" value="<?php echo $professor['ProfessorID']; ?>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo $professor['Name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="degree">Degree:</label>
                <input type="text" class="form-control" id="degree" name="degree" value="<?php echo $professor['Degree']; ?>" required>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" class="form-control" id="department" name="department" value="<?php echo $professor['Department']; ?>" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" value="<?php echo $professor['Username']; ?>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary" name="updateProfessor">Update Professor</button>
        </form>
    </div>

    <script src="../assets/js/jquery-3.6.0.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
</body>

</html>

<?php
} else {
    header("location:../../index.php");
    exit;
}
?>
