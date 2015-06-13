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
        if ($this->conn->connect_error) {
	        die("Connection failed: " . $conn->connect_error);
	    }
	    $this->conn->query("Use Unoselfie;");
	}
	function __destruct(){
		$this->conn->close();
	}

	public function queryUserByUser_id($User_id){
		/*$stmt = $this->conn->prepare("SELECT * FROM User WHERE User_id=(?)");
		if (!$stmt->bind_param("i", $User_id)) {
			echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
		}

		if (!$stmt->execute()) {
			echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
		}
		$stmt->close();*/
	}
}
?>

