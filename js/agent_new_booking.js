var userObj;
var flightObj;
$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 1)
			window.location.replace("./");	
		else{
			$('#staffIDBox').val(userObj.id);
			if(getParameterByName('type') == 'hotel'){
				$('#hotelFormBox').show();
				pullHotel();
				$('#hotelIDBox').change(function() {
				    pullRoom($(this).val())
				});
			}
			else{
				$('#FstaffIDBox').val(userObj.id);
				$('#flightFormBox').show();
				pullFlight();
				$('#flightNoBox').change(function() {
				    pullClass($(this).val())
				});
				$('#classBox').change(function() {
					vlue = $(this).val();
					console.log(vlue);
				    $.each(flightObj, function( key, value ) {
					  if(value.values.fclass == vlue)
					  	  flightObj = value;
					});
				});
			}
		}
	}	
	else
		window.location.replace("./");	
});

function makeBooking(type){
obj= {};
	switch(type){
		case 'hotel':
			obj = {
				"staffid":$('#staffIDBox').val(),
				"orderdate":$('#orderDateBox').val(),
				"custid":$('#custIDBox').val(),
				"hotelid":$('#hotelIDBox').val(),
				"rmtype":$('#rmTypeBox').val(),
				"rmnum":$('#rmNumBox').val(),
				"checkindate":$('#checkInDateBox').val(),
				"checkoutdate":$('#checkOutDateBox').val(),
				"totalamt":$('#totalAmtBox').val(),
				"price":$('#priceBox').val(),
				"remark":$('#remarkBox').val()
			};
			break;
		case 'flight':
			obj = {
				"staffid":$('#FstaffIDBox').val(),
				"orderdate":$('#ForderDateBox').val(),
				"custid":$('#FcustIDBox').val(),
				"depdatetime":flightObj.values.depdatetime,
				"class":$('#classBox').val(),
				"flightno":$('#flightNoBox').val(),
				"adultnum":$('#audltNumBox').val(),
				"childnum":$('#childNumBox').val(),
				"infantnum":$('#infantNumBox').val(),
				"adultprice":$('#adultPriceBox').val(),
				"childprice":$('#childPriceBox').val(),
				"infantprice":$('#infantPriceBox').val(),
				"totalamt":$('#FtotalAmtBox').val()
			};
			break;
	}
	console.log(obj);
	submitAdd(type,obj);
}
function pullHotel(){
	$.get( "php/hotels.php", function( res ) {
		$.each(res.obj, function( key, value ) {
		  $('#hotelIDBox').append($("<option></option>")
                    .attr("value",value.id)
                    .text(value.engname));
		});
	});
}
function pullRoom(id){
	console.log(id);
	$.get( "php/hotel_details.php?id="+id, function( res ) {
		console.log(res);
		$.each(res.data, function( key, value ) {
		  $('#rmTypeBox').append($("<option></option>")
                    .attr("value",value.values.roomtype)
                    .text(value.values.roomtype));
		});
	});
}
function pullFlight(){
	$.get( "php/getflight.php", function( res ) {
		$.each(res.obj, function( key, value ) {
		  $('#flightNoBox').append($("<option></option>")
                    .attr("value",value.id)
                    .text(value.id));
		});
	});
}
function pullClass(id){
	$.get( "php/get_detailed_flight.php?id="+id, function( res ) {
	  	$('#classBox').empty();
	  	$.each(res.obj, function( index, value ) {
	  		$('#classBox').append($("<option></option>")
                    .attr("value",value.values.fclass)
                    .text(value.values.fclass));
		});
		  flightObj = res.obj;
	});
}
function submitAdd(type,obj){
	$.ajax({
	  type: "POST",
	  url: "php/new_booking.php",
	  data: {
	  	  "type":type,
	  	  "data":obj
	  },
	  	  success: function(res){
	  	  	  alert('Record Inserted Successfully.');
	  	  	  	window.location.replace("./");	
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		},
	  dataType: 'json'
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
function getParameterByName( name ){
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}
