<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        feedBack(200,getAirline());
		function feedBack($errorCode,$obj){
			global $accType;
			if($errorCode == 200){
				echo json_encode(array(
					"error" => null,
					 "obj" => $obj)
				);
			}
			else{
				echo json_encode(array(
					"error" => array("code" => $errorCode))
				);
			}
		}
        function getAirline(){
        	global $conn;
        	$sql= "SELECT * FROM airline";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> id = $row["AirlineCode"];
	        				$obj -> name = $row["airlineName"];
	        				$obj -> icon = $row["icon"];
	        		array_push($arr,$obj);
			    }
		   		return $arr;
	        }
	        else
	        	return false;
        }
?>