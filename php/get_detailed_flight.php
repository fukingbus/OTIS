<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        feedBack(200,getAirline($_GET['id']));
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
        function getAirline($id){
        	global $conn;
        	$sql= "SELECT * FROM flightschedule INNER JOIN flightclass ON flightschedule.FlightNo = flightclass.FlightNo WHERE flightschedule.FlightNo = '".$id."'";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
        		$i = 0;
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> id 			= $row["FlightNo"];
	        				$obj -> depdatetime 	= $row["DepDateTime"];
	        				$obj -> arrdatetime 	= $row["ArrDateTime"];
	        				$obj -> depairport 		= $row["DepAirport"];
	        				$obj -> arrairport 		= $row["ArrAirport"];
	        				$obj -> flyminute 		= $row["FlyMinute"];
	        				$obj -> aircraft 		= $row["Aircraft"];
	        				$obj -> fclass		= $row["Class"];
	        				$obj -> airlinecode 		= $row["AirlineCode"];
	        				$obj -> pricechild 		= $row["Price_Children"];
	        				$obj -> priceadult 		= $row["Price_Adult"];
	        				$obj -> priceinfant 		= $row["Price_Infant"];
	        				$obj -> tax 		= $row["Tax"];
	        		$data = array(
						"id" => $i,
						 "values" => $obj
					);
	        		array_push($arr,$data);
	        		$i++;
			    }
		   		return $arr;
	        }
	        else
	        	return false;
        }
?>