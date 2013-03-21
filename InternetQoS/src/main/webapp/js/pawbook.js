function checkNewNotifications(){
	var baseUrl = "/" + location.pathname.split('/')[1] + "/" ;
	$.get( baseUrl + 'bin/notification/unreadCount', function(data){ 
	     //If data has results (it's not 0)
	     if(data > 0) {
	     	$('#pendingNotifications').html(data).show("slow");
	     }else{
	    	 $('#pendingNotifications').html("0").hide("slow");
	     }
	})
}


$(document).ready(function() {
	setInterval(checkNewNotifications, 5000);
});