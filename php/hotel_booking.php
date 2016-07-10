<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        feedBack(200,getHotelBooking());
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
        function getHotelBooking(){
        	global $conn;
        	$sql= "SELECT * FROM hotelbooking INNER JOIN customer ON hotelbooking.CustID = customer.CustID";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
        		$i = 0;
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> bookingid 			= $row["BookingID"];
	        				$obj -> orderdate 	= $row["OrderDate"];
	        				$obj -> staffid 	= $row["StaffID"];
	        				$obj -> custid 		= $row["CustID"];
	        				$obj -> hotelid 		= $row["HotelID"];
	        				$obj -> roomtype 		= $row["RoomType"];
	        				$obj -> price 		= $row["Price"];
	        				$obj -> roomnum		= $row["RoomNum"];
	        				$obj -> totalamt 		= $row["TotalAmt"];
	        				$obj -> checkin 		= $row["Checkin"];
	        				$obj -> checkout 		= $row["Checkout"];
	        				$obj -> remark 		= $row["Remark"];
	        				
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