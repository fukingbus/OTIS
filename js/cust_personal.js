var userObj;

$( document ).ready(function() {
  if(getCookie("user")!=""){
		res = JSON.parse(getCookie("user"));
		userObj = res.userObj;
		if(res.userType != 0)
			window.location.replace("./");	
		else
			fillUserData();
	}	
	else
		window.location.replace("./");	
});
function fillUserData(){
	
	$('#dobBox').val(userObj.dob);
	if(userObj.gender == 'M')
		$('#male').prop( "checked", true );
	else
		$('#female').prop( "checked", true );
	$('#passportBox').val(userObj.passport);

	$('#mobileBox').val(userObj.mobile);
	$('#nationBox').val(userObj.nation);
	$('#givennameBox').val(userObj.givenName);
	$('#surnameBox').val(userObj.surName);
}
function makeUpdate(){
	obj = {};
	if($("#male").is(':checked') )
		obj.gender = 'M';
	else
		obj.gender = 'F';
	$.each($('input'), function( index, value ) {
		type = $(value).attr('type');
		if(type!='radio'){
			switch($(value).attr('id')){
				case "dobBox":
					if($(value).val() != userObj.dob)
						obj.dateofbirth = $(value).val();
					break;
				case "passportBox":
					if($(value).val() != userObj.passport)
						obj.passport = $(value).val();
					break;
				case "surnameBox":
					if($(value).val() != userObj.surName)
						obj.surname = $(value).val();
					break;
				case "mobileBox":
					if($(value).val() != userObj.mobile)
						obj.mobileno = $(value).val();
					break;
				case "nationBox":
					if($(value).val() != userObj.nation)
						obj.nationality = $(value).val();
					break;
				case "givennameBox":
					if($(value).val() != userObj.givenName)
						obj.givenname = $(value).val();
					break;
			}
		}
	});
	$.ajax({
	  type: "POST",
	  url: "php/updatePersonal.php",
	  data: {
	  	"id" : userObj.id,
	  	"obj" : obj
	  },
	  success: function(res){
	  		console.log(res);
	  		if(res.error==null){
	  			userObj = res.userObj;
	  			removeCookie("user");
	  		}
	  		else{
	  			switch(res.error.code){
	  				case 300:
	  					console.log("error")
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
