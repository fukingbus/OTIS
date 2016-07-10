var userObj;
var isLoggedIn = false;

$( document ).ready(function() {
  if(getCookie("user")!=""){
	res = JSON.parse(getCookie("user"));
	userObj = res.userObj;
	isLoggedIn = true;
	$('#loginBT').text("LogOut");
	switch(res.userType){
	  				case 0:
	  					$('.customerMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.givenName);
	  					break;
	  				case 1:
	  					$('.travelAgentMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.name);
	  					break;
	  				case 2:
	  					$('.hotelOwnerMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.engName);
	  					break;
	  				case 3:
	  					$('.airLineMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.name);
	  					break;
	  			}
}
});
function popLogin(state){
	if(state && !$('#formBox').is(":visible"))
		$('#formBox').fadeIn();
	else
		$('#formBox').fadeOut();
}
function loginOnClick(){
	if(isLoggedIn){
		isLoggedIn = false;
		removeCookie("user");
		location.reload(true);
	}
	else{
		popLogin(true);
	}	
}
function makeLogin(){
	id = $('#loginIdField').val();
	pw = $('#passwordField').val();
	$.ajax({
	  type: "POST",
	  url: "php/login.php",
	  data: {
	  	"id" : id,
	  	"pw" : pw
	  },
	  success: function(res){
	  		console.log(res);
	  		if(res.error==null){
	  			userObj = res.userObj;
	  			$('#loginIdField').val("");
	  			$('#lpasswordField').val("");
	  			$('#formBox').fadeOut();
	  			$('#loginBT').text("LogOut");
	  			isLoggedIn = true;
	  			setCookie("user",JSON.stringify(res),30);
	  			switch(res.userType){
	  				case 0:
	  					$('.customerMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.givenName);
	  					$('#cust_point').text('Point: '+res.userObj.point);
	  					break;
	  				case 1:
	  					$('.travelAgentMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.name);
	  					break;
	  				case 2:
	  					$('.hotelOwnerMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.engName);
	  					break;
	  				case 3:
	  					$('.airLineMenuItem').css('display','block');
	  					$('#nameLabel').text(res.userObj.name);
	  					break;
	  			}
	  		}
	  		else{
	  			switch(res.error.code){
	  				case 201:
	  					$('#loginIdField').val("Unknown User");
	  					break;
	  				case 202:
	  					$('#loginIdField').val("Password Mismatch");
	  					break;
	  			}
	  		}
	  },
	  error: function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		},
	  dataType: "json"
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
