<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
		$id = null;
		if(isset($_GET['id']))
			$id = $_GET['id'];
        feedBack(200,getFlightBooking());
		function feedBack($errorCode,$obj){
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
        function getFlightBooking(){
        	global $conn;
        	global $id;
        	$sql;
        	if(isset($id))
        		$sql= "SELECT * FROM flightbooking INNER JOIN customer ON flightbooking.CustID = customer.CustID WHERE flightbooking.CustID ='".$id."'";
        	else
        		$sql= "SELECT * FROM flightbooking INNER JOIN customer ON flightbooking.CustID = customer.CustID";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
        		$i = 0;
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> bookingid 			= $row["BookingID"];
	        				$obj -> flightno 	= $row["FlightNo"];
	        				$obj -> depdatetime 	= $row["DepDateTime"];
	        				$obj -> fclass 		= $row["Class"];
	        				$obj -> orderdate 		= $row["OrderDate"];
	        				$obj -> staffid 		= $row["StaffID"];
	        				$obj -> custid 		= $row["CustID"];
	        				$obj -> adultnum		= $row["AdultNum"];
	        				$obj -> childnum 		= $row["ChildNum"];
	        				$obj -> infantnum 		= $row["InfantNum"];
	        				$obj -> adultprice 		= $row["AdultPrice"];
	        				$obj -> childprice 		= $row["ChildPrice"];
	        				$obj -> infantprice 	= $row["InfantPrice"];
	        				$obj -> totalamt 		= $row["TotalAmt"];
	        				$obj -> surname 		= $row["Surname"];
	        				$obj -> givenname 		= $row["GivenName"];
	        				$obj -> passport 		= $row["Passport"];
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