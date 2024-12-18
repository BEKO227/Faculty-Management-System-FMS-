
<!DOCTYPE html>
<html lang="en">

<head>
    
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/main.css">
</head>

<body>
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            <img src="assets/images/bootstrap-solid.svg" alt="" width="30" height="30">
            Bootstrap

        </a>
    </nav>

    <div class="container mt-5">
        <form action="controller/LoginController.php" method="post">
            <div class="form-group">
                <label for="user">Username</label>
                <input id="user" type="text" name="username" class="form-control">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
            </div>

            <input type="submit" value="Login" name="submit" class="btn btn-success">
			<a class="btn btn-primary" href="#">Register</a>
        </form>
    </div>
	
	
	<!-- Modal -->
	<div class="modal" id="exampleModal">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Login failed</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
			Username or password is wrong!
			Please login again
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  </div>
		</div>
	  </div>
	</div>

	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	
	
	<?php if(isset($_GET['id'])) { 
		$url = strtok($_SERVER['REQUEST_URI'], '?');
	?>
		<script>
			var myModal = new bootstrap.Modal(document.getElementById('exampleModal'))
			myModal.show()
			
			// remove query string
			window.history.pushState({}, '', '<?php echo $url; ?>');
		</script>
	<?php } ?>
</body>

</html>