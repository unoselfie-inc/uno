<?php
include 'run_mysql_file.php';
include 'run_mysql_query.php';

class mysql_test{
    private $TEST_file_list = array();
    private $TEST_query_list = array();
    private $TEST_order = array();
    private $TEST_num_tests = 0;
    private $TEST_localhost = "";
    private $TEST_username = "";
    private $TEST_password = "";

    function __construct($localhost , $username, $password){
        $this->TEST_localhost = $localhost;
        $this->TEST_username = $username;
        $this->TEST_password = $password;
    }

    public function add_file($file_location){
        array_push($this->TEST_file_list, $file_location);
        array_push($this->TEST_order, 0);
        $this->TEST_num_tests++;
    }

    public function add_query($query){
        array_push($this->TEST_query_list, $query);
        array_push($this->TEST_order, 1);
        $this->TEST_num_tests++;
    }
    public function run(){
        while ($this->TEST_num_tests > 0) {
            $run_target = array_shift($this->TEST_order);
            if ($run_target === 0) {
                run_mysql_file($this->TEST_localhost, $this->TEST_username, $this->TEST_password, array_shift($this->TEST_file_list));
            } else {
                run_mysql_query($this->TEST_localhost, $this->TEST_username, $this->TEST_password, array_shift($this->TEST_query_list));
            }
            $this->TEST_num_tests--;
        }
    }
}

?>
