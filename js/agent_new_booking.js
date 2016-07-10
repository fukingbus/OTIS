var userObj;

$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 1)
			window.location.replace("./");	
		else{
			$('#staffIDBox').val(userObj.id);
			if(getParameterByName('type') == 'hotel'){
				pullHotel();
				$('#hotelIDBox').change(function() {
				    pullRoom($(this).val())
				});
			}
			else{
				pullFlight();
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
			break;
	}
	console.log(obj);
	submitAdd(type,obj);
}
function pullRoom(id){
	$.get( "php/hotel_details.php?id="+id, function( res ) {
	  	$('#rmTypeBox').empty();
	  	$.each(res.data, function( index, value ) {
	  		$('#rmTypeBox').append($("<option></option>")
                    .attr("value",value.values.rmtype)
                    .text(value.values.rmtype));
		  
		});
	});
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
