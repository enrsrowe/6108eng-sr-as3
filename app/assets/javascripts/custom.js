$(document).ready(function(){

/*Setup */

	$("#info1").hide();
	$("#info2").hide();
	$("#info3").hide();
	$("#info4").hide();
	$("#info5").hide();

/* Membership select */
  $('#membershipwell1').hover(function() {
    $('#membershipwell1').toggleClass("select");
    $("#info1").slideToggle();
  }); 

  $('#membershipwell2').hover(function() {
    $('#membershipwell2').toggleClass("select");
    $("#info2").slideToggle();
  }); 

  $('#membershipwell3').hover(function() {
    $('#membershipwell3').toggleClass("select");
    $("#info3").slideToggle();
  }); 

  $('#membershipwell4').hover(function() {
    $('#membershipwell4').toggleClass("select");
    $("#info4").slideToggle();
  }); 

  $('#membershipwell5').hover(function() {
    $('#membershipwell5').toggleClass("select");
    $("#info5").slideToggle();
  }); 

});