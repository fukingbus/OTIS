<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        $id = $_POST['id'];
        $obj = json_decode(json_encode($_POST['obj']),true);
        if(checkID($id)){
        	updateInfo($obj);
        }
        else
        	feedBack(300,null);
        function appendSQL(){
        	global $obj;
        	$sql ="";
        	foreach ($obj as $key => $value) {
			    $sql .= $key." = '".$value."',";
			}
			return rtrim($sql, ",");
        }
        function updateInfo($obj){
        	global $id;
        	global $conn;
        	$sql = "UPDATE customer SET ".appendSQL()." WHERE custID='".$id."'";
			if ($conn->query($sql) === TRUE) {
			    feedBack(200,getUser());
			} else {
			    feedBack(300,null);
			}

			$conn->close();
        }
        
		function feedBack($errorCode,$obj){
			global $accType;
			if($errorCode == 200){
				echo json_encode(array(
					"error" => null,
					 "userObj" => $obj)
				);
			}
			else{
				echo json_encode(array(
					"error" => array("code" => $errorCode))
				);
			}
		}
        function checkID($id){
        	global $conn;
        	$sql = "SELECT custID FROM customer WHERE custID = '".$id."'";
	        $result = $conn->query($sql);
	        if (!$result) {
			    return false;
			}
			else{
				if ($result->num_rows > 0) {	
		            return true;
		        } else {
		        	return false;
		        }
		        $conn->close();
			}
        }
        function getUser(){
        	global $conn;
        	global $id;
        	$sql= "SELECT * FROM customer WHERE custID='".$id."'";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
	        	$row = $result->fetch_assoc();
	        	$obj = new stdClass();
	        		$obj -> id = $row["CustID"];
			    			$obj -> surName = $row["Surname"];
		   					$obj -> givenName = $row["GivenName"];
		   					$obj -> dob = $row["DateOfBirth"];
		   					$obj -> gender = $row["Gender"];
		   					$obj -> passport = $row["Passport"];
		   					$obj -> mobile = $row["MobileNo"];
		   					$obj -> nation = $row["Nationality"];
		   					$obj -> point = $row["BonusPoint"];
		   		return $obj;
	        }
	        else
	        	return false;
        }
?>