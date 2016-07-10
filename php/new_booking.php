<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
		$id = $_POST['type'];
        $obj = json_decode(json_encode($_POST['data']),true);
        switch($id){
        	case 'hotel':
        		insertIntoHotel($obj);
        		break;
        	case 'flight':
        		insertIntoFlight($obj);
        		break;
        }
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
        function insertIntoHotel($obj){
        	global $conn;
        	$sql = "INSERT INTO hotelbooking (OrderDate, StaffID, CustID, HotelID,RoomType,Price,RoomNum,TotalAmt,Checkin,Checkout,Remark) VALUES ("
				."'".$obj['orderdate']."',"
				."'".$obj['staffid']."',"
				."'".$obj['custid']."',"
				."'".$obj['hotelid']."',"
				."'".$obj['rmtype']."',"
				."'".$obj['price']."',"
				."'".$obj['rmnum']."',"
				."'".$obj['totalamt']."',"
				."'".$obj['checkindate']."',"
				."'".$obj['checkoutdate']."',"
				."'".$obj['remark']."'".
			")";
			if ($conn->query($sql) === TRUE) {
			    feedBack(200,null);
			} else {
			    feedBack(400,null);
			}
        }
        function insertIntoFlight($obj){
        	global $conn;
        	$sql = "INSERT INTO flightbooking (FlightNo, DepDateTime, Class, OrderDate,StaffID,CustID,AdultNum,ChildNum,InfantNum,AdultPrice,ChildPrice,InfantPrice,TotalAmt) VALUES ("
				."'".$obj['flightno']."',"
				."'".$obj['depdatetime']."',"
				."'".$obj['class']."',"
				."'".$obj['orderdate']."',"
				."'".$obj['staffid']."',"
				."'".$obj['custid']."',"
				."'".$obj['adultnum']."',"
				."'".$obj['childnum']."',"
				."'".$obj['infantnum']."',"
				."'".$obj['adultprice']."',"
				."'".$obj['childprice']."',"
				."'".$obj['infantprice']."',"
				."'".$obj['totalamt']."'".
			")";
			if ($conn->query($sql) === TRUE) {
			    feedBack(200,null);
			} else {
			    feedBack(400,null);
			}
        }
?>