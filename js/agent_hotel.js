var userObj;

$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 1)
			window.location.replace("./");	
		else{
			pullHotel();
		}
	}	
	else
		window.location.replace("./");	
});
function fillData(data){
	editableGrid = new EditableGrid("DemoGridJsData"); 
	metadata = [
			{"name":"hotelid" 			,"label":"Hotel ID","datatype":"string","editable":false},
			{"name":"chiname" 	,"label":"Chinese","datatype":"string","editable":false},
			{"name":"engname" 	,"label":"English","datatype":"string","editable":false},
			{"name":"star" 		,"label":"Star","datatype":"string","editable":false},
			{"name":"rating" 		,"label":"Rating","datatype":"string","editable":false},
			{"name":"country" 	,"label":"Country","datatype":"string","editable":false},
			{"name":"city"		,"label":"City","datatype":"string","editable":false},
			{"name":"district"	,"label":"District","datatype":"string","editable":false},
			{"name":"address" 	,"label":"Address","datatype":"string","editable":false},
			{"name":"tel" 		,"label":"Tel","datatype":"string","editable":false},
			{"name":"roomtype" 		,"label":"Room Type","datatype":"string","editable":false},
			{"name":"nonsmoking"	,"label":"Non Smoking","datatype":"string","editable":false},
			{"name":"roomnum" 		,"label":"Room Number","datatype":"string","editable":false},
			{"name":"roomsize" 		,"label":"Room Size","datatype":"string","editable":false},
			{"name":"adultnum" 	,"label":"Adult","datatype":"string","editable":false},
			{"name":"childnum" 	,"label":"Child","datatype":"string","editable":false},
			{"name":"roomdesc" 		,"label":"Desc","datatype":"string","editable":false},
			{"name":"price" 		,"label":"Price","datatype":"string","editable":false},
	];
	editableGrid.load({"metadata" : metadata,"data" : data});
	editableGrid.renderGrid("tablecontent", "testgrid");
	//editableGrid.loadJSON("grid.json");
}
function selectDetails(id){
	console.log(id);
	$.get( "php/hotel_details.php?id="+id, function( res ) {
	  fillData(res.data);
	  console.log(res);
	  	/*$.each(res.obj, function( index, value ) {
		  
		});*/
	});
}
function pullHotel(){
	$.get( "php/hotels.php", function( res ) {
		$.each(res.obj, function( index, value ) {
		  $('.dropdown-content').append('<a href="#" onclick="selectDetails(\''+value.id+'\')">'+value.engname+'</a>');
		});
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
