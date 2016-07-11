<?php
	header('Content-type: application/json');
	include 'conn/conn.php';
        $id = $_POST['id'];
        $rmid = $_POST['rmid'];
        $obj = json_decode(json_encode($_POST['obj']),true);
        updateInfo($obj);
        function appendSQL(){
        	global $obj;
        	$sql ="";
        	foreach ($obj as $key => $value) {
			    $sql .= $key." = '".$value."',";
			}
			return rtrim($sql, ",");
        }
        function updateInfo($obj){
        	global $id;
        	global $rmid;
        	global $conn;
        	$sql = "UPDATE room SET ".appendSQL()." WHERE RoomType ='".$rmid."' AND HotelID = '".$id."'";
        	echo $sql;
			if ($conn->query($sql) === TRUE) {
			    feedBack(200,null);
			} else {
			    feedBack(300,null);
			}

			$conn->close();
        }
        
		function feedBack($errorCode,$obj){
			global $accType;
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
?>