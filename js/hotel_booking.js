var userObj;
var hotelbooking = [];
$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 2)
			window.location.replace("./");	
		else{
			
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
	}
	
	editableGrid.load({"metadata" : metadata,"data" : data});
	editableGrid.renderGrid("tablecontent", "testgrid");
	//editableGrid.loadJSON("grid.json");
}
function pullHotelBooking(){
	id = $('#keyword').val();
	$.get( "php/hotel_booking.php?id="+id, function( res ) {
		console.log(res);
		hotelbooking = res.obj;
		fillData('hotel',hotelbooking);
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
