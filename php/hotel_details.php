<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
	
		$obj = getSchedule($_GET['id']);
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
        	$sql= "SELECT * FROM hotel INNER JOIN room ON hotel.HotelID=room.HotelID WHERE hotel.HotelID = '".$id."'";
        	$result = $conn->query($sql);
        	if ($result -> num_rows > 0) {
        		$arr = array();
        		$i = 0;
	        	while($row = $result->fetch_assoc()) {
			        $obj = new stdClass();
	        				$obj -> id 			= $row["HotelID"];
	        				$obj -> chiname 	= $row["ChiName"];
	        				$obj -> engname 	= $row["EngName"];
	        				$obj -> star 		= $row["Star"];
	        				$obj -> rating 		= $row["Rating"];
	        				$obj -> country 		= $row["Country"];
	        				$obj -> city 		= $row["City"];
	        				$obj -> district		= $row["District"];
	        				$obj -> address 		= $row["Address"];
	        				$obj -> tel 		= $row["Tel"];
	        				$obj -> rmtype 		= $row["RoomType"];
	        				$obj -> nonsmoking 		= $row["NonSmoking"];
	        				$obj -> rmnum 		= $row["RoomNum"];
	        				$obj -> rmsize 		= $row["RoomSize"];
	        				$obj -> adultnum 		= $row["AdultNum"];
	        				$obj -> childnum 		= $row["ChildNum"];
	        				$obj -> rmdesc 		= $row["RoomDesc"];
	        				$obj -> price 		= $row["Price"];
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