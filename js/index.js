var userObj;
var isLoggedIn = false;
function popLogin(state){
	if(state && !$('#formBox').is(":visible"))
		$('#formBox').fadeIn();
	else
		$('#formBox').fadeOut();
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
	  		if(res.err!=null){
	  			userObj = res.userObj;
	  			$('#loginIdField').val("");
	  			$('#lpasswordField').val("");
	  			$('#formBox').fadeOut();
	  		}
	  },
	  error: function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
		},
	  dataType: "json"
	});
}