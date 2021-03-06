$(document).ready(function() {
	resizeDogmap();
});

$(window).resize(function() {
	resizeDogmap();
});

function resizeDogmap() {
	$(".dog-map iframe").css("height", ($(window).height() - 80));
	$(".dog-appt").css("height", ($(window).height() - 80));
}

/*Open Proposals*/

$(".dashboard-modbox").click(function() {
	var apptIdFull = $(this).attr("id");
	var apptId = apptIdFull.split("appointment");
	$("#proposal" + apptId[1]).slideToggle();
});

/*Submit proposal and close form*/

$(".dashboard-proposal-submit").click(function() {
	//AJAX here
	
	var propId = $(this).parents().parents().parents().parents().attr("id");
	$("#" + propId).slideUp();
});

/*Change active status for signup dogsize*/

$(".signup-dogsize li").click(function() {
	$(".signup-dogsize li").removeClass("active");
	$(this).addClass("active");
});

/*Post user type to rails*/

$(".signup-type-image img").click(function() {
	userType = $(this).attr("data-type");
	$.post("signup/set/user_type/", { signupType: userType }, function() {
		window.location = "signup/2/";
	});
});

/*Set dog size hidden field*/

$(".signup-dogsize img").click(function() {
	dogSize = $(this).attr("data-size");
	document.getElementById("dog-size").value = dogSize;
});
