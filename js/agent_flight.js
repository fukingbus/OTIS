var userObj;

$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 1)
			window.location.replace("./");	
		else{
			pullAirline();
		}
	}	
	else
		window.location.replace("./");	
});
function fillData(data){
	editableGrid = new EditableGrid("DemoGridJsData"); 
	metadata = [
			{"name":"flightno","label":"Flight Number","datatype":"string","editable":false},
			{"name":"depdatetime","label":"Departure","datatype":"string","editable":false},
			{"name":"arrdatetime","label":"Arrival","datatype":"string","editable":false},
			{"name":"depairport","label":"Departure Port","datatype":"string","editable":false},
			{"name":"arrairport","label":"Arrival Port","datatype":"string","editable":false},
			{"name":"flyminute","label":"Duration","datatype":"string","editable":false},
		{"name":"aircraft","label":"Aircraft","datatype":"string","editable":false},
		{"name":"fclass","label":"Class","datatype":"string","editable":false},
		{"name":"priceadult","label":"Adult","datatype":"string","editable":false},
		{"name":"pricechild","label":"Child","datatype":"string","editable":false},
		{"name":"priceinf","label":"Infant","datatype":"string","editable":false},
		{"name":"tax","label":"Tax","datatype":"string","editable":false}
	];
	editableGrid.load({"metadata" : metadata,"data" : data});
	editableGrid.renderGrid("tablecontent", "testgrid");
	//editableGrid.loadJSON("grid.json");
}
function selectAirline(id){
	console.log(id);
	$.get( "php/airschedule.php?id="+id, function( res ) {
	  fillData(res.data);
	  console.log(res);
	  	/*$.each(res.obj, function( index, value ) {
		  
		});*/
	});
}
function pullAirline(){
	$.get( "php/airline.php", function( res ) {
		$.each(res.obj, function( index, value ) {
		  $('.dropdown-content').append('<a href="#" onclick="selectAirline(\''+value.id+'\')">'+value.name+'</a>');
		});
	  console.log(res);
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
