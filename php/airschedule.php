<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
		$id = "";
		$point = "";
		if(isset($_GET['id']))
			$id = $_GET['id'];
		if(isset($_GET['point']))
			$point = $_GET['point'];
		$obj = getSchedule($id);
		if(!$obj)
       	 feedBack(400,null);
       	else
       		feedBack(200,$obj);
		function feedBack($errorCode,$obj){
			global $accType;
			if($errorCode == 200){
				echo json_encode(array(
					"error" => null,
					 "data" => $obj)
				);
			}
			else{
				echo json_encode(array(
					"error" => array("code" => $errorCode))
				);
			}
		}
        function getSchedule($id){
        	global $conn;
        	global $point;
        	if($point!="")
        		$sql= "SELECT * FROM flightschedule INNER JOIN flightclass ON flightschedule.FlightNo=flightclass.FlightNo WHERE flightclass.Price_Adult <= ".$point."";
        	else
        		$sql= "SELECT * FROM flightschedule INNER JOIN flightclass ON flightschedule.FlightNo=flightclass.FlightNo WHERE flightschedule.FlightNo LIKE '".$id."%'";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
        		$i = 0;
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> flightno = $row["FlightNo"];
	        				$obj -> depdatetime = $row["DepDateTime"];
	        				$obj -> arrdatetime = $row["ArrDateTime"];
	        				$obj -> depairport = $row["DepAirport"];
	        				$obj -> arrairport = $row["ArrAirport"];
	        				$obj -> flyminute = $row["FlyMinute"];
	        				$obj -> aircraft = $row["Aircraft"];
	        				$obj -> fclass = $row["Class"];
	        				$obj -> priceadult = $row["Price_Adult"];
	        				$obj -> pricechild = $row["Price_Children"];
	        				$obj -> priceinf = $row["Price_Infant"];
	        				$obj -> tax = $row["Tax"];
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