/*Resize dogmap on screen change*/

$(document).ready(function() {
	resizeDogmap();
});

$(window).resize(function() {
	resizeDogmap();
});

function resizeDogmap() {
	$(".dog-map:first-child").css("height", ($(window).height() - 80));
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
	var propIdFull = $(this).parents().parents().parents().parents().attr("id");
	var propId = propIdFull.split("proposal");
	var proposalDescription = $("#proposal" + propId[1]).find("textarea[name=proposal_description]").val();

	var proposalRate = $("#proposal" + propId[1]).find("input[name=proposal_rate]").val();
	
	if ($("#proposal" + propId[1]).find("input[name=proposal_share]").is(":checked")) {
		var proposalPhoneShare = "yes";
	} else {
		var proposalPhoneShare = "no";
	}
	
	//AJAX :) It's beautiful
	
	$.post("/dashboard/proposal/", { proposalId: propId[1], proposalDesc: proposalDescription, propRate: proposalRate, sharePhone: proposalPhoneShare }, function() {
		$("#" + propIdFull).slideUp(function() {
			$("#appointment" + propId[1]).fadeOut();
			
			//Show our nifty alert which is really nested in callbacks :P:P
			
			setTimeout(function() {
				$("#proposal-success").slideDown(function() {
					setTimeout(function() {
						$("#proposal-success").slideUp();
					}, 3000);
				});
			}, 1000);
		});		
	});
});

/*Change active status for signup dogsize*/

$(".signup-dogsize li").click(function() {
	$(".signup-dogsize li").removeClass("active");
	$(this).addClass("active");
});

/*Post user type to rails*/

$(".signup-type-image img").click(function() {
	userType = $(this).attr("data-type");
	$.post("/signup/set/user_type/", { signupType: userType }, function() {
		window.location = "/signup/2/";
	});
});

/*Set dog size hidden field*/

$(".signup-dogsize img").click(function() {
	dogSize = $(this).attr("data-size");
	document.getElementById("dog-size").value = dogSize;
});
