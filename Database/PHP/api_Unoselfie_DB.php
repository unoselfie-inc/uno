<?php
class api_Unoselfie_DB{
	private $localhost = "";
    private $username = "";
    private $password = "";
    private $conn;

	function __construct($localhost , $username, $password){
		$this->localhost = $localhost;
        $this->username = $username;
        $this->password = $password;
        $this->conn = new mysqli($localhost, $username, $password);
	}
	function __destruct(){
		$this->conn->close();
	}
}
?>

