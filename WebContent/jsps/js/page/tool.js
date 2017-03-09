$(function() {

	$("#options").mouseout(function opoff() {
		$(this).css('display', 'none');
	});
	$("#options").mouseover(function opon() {
		$(this).css('display', 'block');
	});


	
});

function optionon() {
	$("#options").css("display", "block");
	var x = $(window).width();
	var y = $(window).height();
	x = x - 100;
	y = y * 0.94 - 99;

	$("#options").css("top", y + "px");
	$("#options").css("left", x + "px");
}

function optionoff() {
	$("#options").css("display", "none");
}

