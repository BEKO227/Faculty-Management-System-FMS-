<?php


class users
{

	private $id;
	private $username;
	private $password;
	private $name;
	private $type;
	private $db;

	function __construct()
	{
		include_once '../include/DatabaseClass.php';
		$this->db = new database();
	}


	function login($username, $password)
	{
		$this->username = $username;
		$this->password = $password;
		$sql = "SELECT * FROM user WHERE username='$this->username'";
		$row = $this->db->select($sql);
		if ($row['password'] === $this->password) {
			session_start();
			$_SESSION['id'] = $row['id'];
			$_SESSION['type'] = $row['type'];
			$_SESSION['username'] = $row['username'];
			$_SESSION['email'] = $row['email'];
			$_SESSION['name'] = $row['name'];
			$_SESSION['age'] = $row['age'];
			$_SESSION['phone'] = $row['phone'];
			$_SESSION['address'] = $row['address'];

			return true;
		}
		return false;
	}

	function logout()
	{

		session_start();
		unset($_SESSION['id']);
		unset($_SESSION['type']);
		unset($_SESSION['username']);
		unset($_SESSION['password']);
		unset($_SESSION['email']);
		unset($_SESSION['name']);
		unset($_SESSION['age']);
		unset($_SESSION['phone']);
		unset($_SESSION['address']);
		unset($_SESSION['photo']);
		session_destroy();
		header("location:../index.php");
	}

	function addUser($info)
	{
		$sql = "SELECT * FROM user WHERE username = '{$info['username']}'";
		$r = $this->db->check($sql);
		if ($r == 0) {
			$s_sql1 = "INSERT INTO user (type, username, password, email, name, age, phone, address) VALUES ('student','{$info['username']}', '{$info['password']}', '{$info['email']}', '{$info['name']}', '{$info['age']}','{$info['phone']}', '{$info['address']}')";
			if ($this->db->insert($s_sql1)) {
				$check = 1;
			}
			return true;
		}

		return false;
	}

	public function usersinfo($info)
	{
		$this->username = $info['username'];
		$this->password = $info['password'];
		$this->name = $info['name'];
		$this->type = $info['type'];
	}


	function getID()
	{
		return $this->id;
	}

	function getUsername()
	{
		return $this->username;
	}

	function getPassword()
	{
		return $this->password;
	}

	function getname()
	{
		return $this->name;
	}


	function setID($id)
	{
		$this->id = $id;
	}

	function setUsername($username)
	{
		$this->username = $username;
	}

	function setPassword($password)
	{
		$this->password = $password;
	}

	function setname($name)
	{
		$this->name = $name;
	}
}
