var userObj;
var hotelbooking = [];
$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 0)
			window.location.replace("./");	
		else{
			//pullHotel();
		}
	}	
	else
		window.location.replace("./");	
});
function fillData(type,data){
	editableGrid = new EditableGrid("DemoGridJsData"); 
	metadata= {};
	switch(type){
		case 'hotel':
				metadata = [
					{"name":"bookingid" 			,"label":"Booking ID","datatype":"string","editable":false},
					{"name":"orderdate" 	,"label":"Order Date","datatype":"string","editable":true},
					{"name":"staffid" 	,"label":"Staff ID","datatype":"string","editable":false},
					{"name":"custid" 		,"label":"Cust ID","datatype":"string","editable":false},
					{"name":"hotelid" 		,"label":"Hotel ID","datatype":"string","editable":true},
					{"name":"roomtype" 	,"label":"Room Type","datatype":"string","editable":true},
					{"name":"price"		,"label":"Price","datatype":"string","editable":true},
					{"name":"roomnum"	,"label":"Room Number","datatype":"string","editable":true},
					{"name":"totalamt" 	,"label":"Total","datatype":"string","editable":true},
					{"name":"checkin" 		,"label":"In","datatype":"string","editable":true},
					{"name":"checkout" 		,"label":"Out","datatype":"string","editable":true},
			{"name":"surname" 		,"label":"Surname","datatype":"string","editable":true},
			{"name":"givenname" 		,"label":"Given Name","datatype":"string","editable":true},
			{"name":"passport" 		,"label":"Passport","datatype":"string","editable":true},
			];
			break;
		case 'flight':
				metadata = [
					{"name":"bookingid" 		,"label":"Booking ID","datatype":"string","editable":false},
					{"name":"flightno"			,"label":"Flight Number","datatype":"string","editable":true},
					{"name":"depdatetime" 		,"label":"Departure","datatype":"string","editable":true},
					{"name":"fclass" 			,"label":"Class","datatype":"string","editable":true},
					{"name":"orderdate"			,"label":"Order Date","datatype":"string","editable":true},
					{"name":"staffid" 			,"label":"Staff ID","datatype":"string","editable":true},
					{"name":"custid" 			,"label":"Customer ID","datatype":"string","editable":true},
					{"name":"adultnum"			,"label":"Adult","datatype":"string","editable":true},
					{"name":"childnum" 			,"label":"Child","datatype":"string","editable":true},
					{"name":"infantnum" 		,"label":"Infant","datatype":"string","editable":true},
					{"name":"adultprice" 		,"label":"Adult $","datatype":"string","editable":true},
					{"name":"childprice" 		,"label":"Child $","datatype":"string","editable":true},
					{"name":"infantprice" 		,"label":"Infant $","datatype":"string","editable":true},
					{"name":"totalamt" 			,"label":"Total","datatype":"string","editable":true},
					{"name":"surname" 			,"label":"Surname","datatype":"string","editable":true},
					{"name":"givenname" 		,"label":"Given Name","datatype":"string","editable":true},
					{"name":"passport" 			,"label":"Passport","datatype":"string","editable":true},
			];
			break;
	}
	
	editableGrid.load({"metadata" : metadata,"data" : data});
	editableGrid.renderGrid("tablecontent", "testgrid");
	//editableGrid.loadJSON("grid.json");
}
function pullHotelBooking(){
	$.get( "php/hotel_booking.php?id="+userObj.id, function( res ) {
		console.log(res);
		hotelbooking = res.obj;
		fillData('hotel',hotelbooking);
	});
}
function pullFlightBooking(){
	$.get( "php/flight_booking.php?id="+userObj.id, function( res ) {
		$( res.obj ).each(function( index, value ) {
			diff = Math.floor((new Date(value.values.depdatetime) - new Date()) / (1000*60*60*24));
		  if(diff <=7 && diff > 0)
		  	  alert(value.values.flightno + ' Will departs in 7 days');
		});
		console.log(res);
		flightbooking = res.obj;
		fillData('flight',flightbooking);
	});
}
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function removeCookie(cname) {
    var d = new Date();
    d.setTime(d.getTime() - (30*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=''; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
