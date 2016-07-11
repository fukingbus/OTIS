var userObj;
var hotelbooking = [];
$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 2)
			window.location.replace("./");	
		else{
			getRoom();
		}
	}	
	else
		window.location.replace("./");	
});
function fillData(data){
	editableGrid = new EditableGrid("DemoGridJsData"); 
	metadata = [
			{"name":"id" 			,"label":"Hotel ID","datatype":"string","editable":false},
			{"name":"chiname" 	,"label":"Chinese","datatype":"string","editable":false},
			{"name":"engname" 	,"label":"English","datatype":"string","editable":false},
			{"name":"star" 		,"label":"Star","datatype":"string","editable":true},
			{"name":"rating" 		,"label":"Rating","datatype":"string","editable":true},
			{"name":"country" 	,"label":"Country","datatype":"string","editable":true},
			{"name":"city"		,"label":"City","datatype":"string","editable":true},
			{"name":"district"	,"label":"District","datatype":"string","editable":true},
			{"name":"address" 	,"label":"Address","datatype":"string","editable":true},
			{"name":"tel" 		,"label":"Tel","datatype":"string","editable":true},
			{"name":"rmtype" 		,"label":"Room Type","datatype":"string","editable":true},
			{"name":"nonsmoking"	,"label":"Non Smoking","datatype":"string","editable":true},
			{"name":"rmnum" 		,"label":"Room Number","datatype":"string","editable":true},
			{"name":"rmsize" 		,"label":"Room Size","datatype":"string","editable":true},
			{"name":"adultnum" 	,"label":"Adult","datatype":"string","editable":true},
			{"name":"childnum" 	,"label":"Child","datatype":"string","editable":true},
			{"name":"rmdesc" 		,"label":"Desc","datatype":"string","editable":true},
			{"name":"price" 		,"label":"Price","datatype":"string","editable":true},
	];
	
	editableGrid.load({"metadata" : metadata,"data" : data});
	editableGrid.renderGrid("tablecontent", "testgrid");
	//editableGrid.loadJSON("grid.json");
}
function getRoom(){
	$.get( "php/hotel_details.php?id="+userObj.id, function( res ) {
		$.each(res.data, function( key, value ) {
		  $('#rmTypeBox').append($("<option></option>")
                    .attr("value",value.values.rmtype)
                    .text(value.values.rmtype));
		});
		fillData(res.data);
	});
}
function checkAvailable(){
	id = userObj.id;
	rmType = $('#rmTypeBox').val();
	chkIn = $('#chkInBox').val();
	chkOut = $('#chkOutBox').val();
	$.get( "php/hotel_rooms.php?id="+id+"&rmType="+rmType+"&in="+chkIn+"&out="+chkOut, function( res ) {
		console.log(res);
		ava = res.data.availability == 0 ? 'ALL AVAILABLE' : res.data.availability + ' rooms left';
		alert("Availability:" + ava); 
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
