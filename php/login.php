<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        $id = $_POST['id'];
        $pw = $_POST['pw'];
        $accType;
		if(checkID($id,0)){
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
			global $accType;
			if($errorCode == 200){
				echo json_encode(array(
					"error" => null,
					"userType" => $accType,
					 "userObj" => $obj)
				);
			}
			else{
				echo json_encode(array(
					"error" => array("code" => $errorCode))
				);
			}
		}
        function checkID($id,$type){
        	global $conn;
        	global $accType;
        	$sql ;
        	switch($type){
        		case 0:
        			 $sql= "SELECT custID FROM customer WHERE custID='".$id."'";
        			break;
        		case 1:
        			 $sql= "SELECT StaffID FROM staff WHERE StaffID='".$id."'";
        			break;
        		case 2:
        			 $sql= "SELECT HotelID FROM hotel WHERE HotelID='".$id."'";
        			break;
        		case 3:
        			 $sql= "SELECT AirlineCode FROM airline WHERE AirlineCode='".$id."'";
        			break;
        	}
       		
	        $result = $conn->query($sql);
	        if (!$result) {
			    return false;
			}
			else{
				if ($result->num_rows > 0) {	
		             $accType = $type;
		            return true;
		        } else {
		        	if($type == 3)
		             	return false;
		             else{
		             	 return checkID($id,($type+=1));
		             }
		             
		        }
		        $conn->close();
			}
        }
        function checkPass($pass,$id){
        	global $conn;
        	global $accType;
        	$sql;
        	switch($accType){
        		case 0:
        			 $sql= "SELECT * FROM customer WHERE custID='".$id."'";
        			break;
        		case 1:
        			 $sql= "SELECT * FROM staff WHERE StaffID='".$id."'";
        			break;
        		case 2:
        			 $sql= "SELECT * FROM hotel WHERE HotelID='".$id."'";
        			break;
        		case 3:
        			 $sql= "SELECT * FROM airline WHERE AirlineCode='".$id."'";
        			break;
        	}
	        $result = $conn->query($sql);
	        if ($result -> num_rows > 0) {
	        	$row = $result->fetch_assoc();
			    if($row["Password"] == $pass){
			    	$obj = new stdClass();
			    	switch($accType){
			    		case 0:
			    			$obj -> id = $row["CustID"];
			    			$obj -> surName = $row["Surname"];
		   					$obj -> givenName = $row["GivenName"];
		   					$obj -> dob = $row["DateOfBirth"];
		   					$obj -> gender = $row["Gender"];
		   					$obj -> passport = $row["Passport"];
		   					$obj -> mobile = $row["MobileNo"];
		   					$obj -> nation = $row["Nationality"];
		   					$obj -> point = $row["BonusPoint"];
		   					break;
		   				case 1:
		   					$obj -> id = $row["StaffID"];
		   					$obj -> name = $row["Name"];
		   					$obj -> gender = $row["Sex"];
		   					$obj -> branch = $row["Branch"];
		   					$obj -> email = $row["Email"];
		   					$obj -> post = $row["Post"];
		   					$obj -> supervisor = $row["Supervisor"];
		   					break;
		   				case 2:
		   					$obj -> id = $row["HotelID"];
		   					$obj -> chiName = $row["ChiName"];
		   					$obj -> engName = $row["EngName"];
		   					break;
		   				case 3:
		   					$obj -> id = $row["AirlineCode"];
		   					$obj -> name = $row["airlineName"];
		   					$obj -> icon = $row["icon"];
		   					break;
			    	}
   					
   					return $obj;
			    }
			    else
			    	return false;
	        } else {
	        	
	             return false;
	        }
        }
?>