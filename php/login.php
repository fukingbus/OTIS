<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        $id = $_POST['id'];
        $pw = $_POST['pw'];
		if(checkID($id)){
			$obj = checkPass($pw,$id);
			if(!$obj){
				feedBack(202,null);
			}
			else{
				feedBack(200,$obj);
			}
		}
		else{
			feedBack(201,null);
		}
		function feedBack($errorCode,$obj){
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
        	$sql = "SELECT custID FROM customer WHERE custID='".$id."'";
	        $result = $conn->query($sql);
	        if ($result -> num_rows == 0) {	
	             return false;
	        } else {
	            return true;
	        }
        }
        function checkPass($pass,$id){
        	global $conn;
        	$sql = "SELECT * FROM customer WHERE custID='".$id."'";
	        $result = $conn->query($sql);
	        if ($result -> num_rows == 0) {
	             return false;
	        } else {
	        	$row = $result->fetch_assoc();
			    if($row["Password"] == $pass){
			    	$obj = new stdClass();
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
        }
?>