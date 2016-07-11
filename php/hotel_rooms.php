<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
	
		$id = $_GET['id'];
		$rmType = $_GET['rmType'];
		$chkIn = $_GET['in'];
		$chkOut = $_GET['out'];
		if(isset($id) && isset($rmType) && isset($chkIn) && isset($chkOut))
       	 feedBack(200,getRooms($id,$rmType,$chkIn,$chkOut));
       	else
       		feedBack(400,null);
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
		function getRooms($id,$rmType,$chkIn,$chkOut){
			global $conn;
			$sql = "SELECT (project_db.room.RoomNum - SUM(project_db.hotelbooking.RoomNum)) AS Availability ".
				"FROM project_db.room ".
				"JOIN project_db.hotelbooking ".
				"ON project_db.hotelbooking.HotelID = project_db.room.HotelID ".
				"WHERE project_db.hotelbooking.Checkin >= '".$chkIn."' ".
				"AND project_db.hotelbooking.Checkout <= '".$chkOut."' ".
			    "AND project_db.room.RoomType = '".$rmType."'";
			$result = $conn->query($sql);
			if($result -> num_rows > 0){
				$row = $result->fetch_assoc();
				$ava = $row["Availability"] == null ? 0 : $row["Availability"];
				return array(
						"availability" => $ava
					);
			}
        	else
        		return false;
		}
?>