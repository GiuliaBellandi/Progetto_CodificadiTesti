$(document).ready(function(){

/* sezione info */
$("#i").mouseenter(function() {
  $("#i").animate({width: '6%', height: '9%'});
});

$("#i").mouseleave(function() {
  if(flag == 0) {
     $("#i").animate({width: '3%', height: '5%'});
    }
});

var flag = 0;

$("#i").click(function() {
  if(flag == 0) {
     $("#testoInfo").css({"display": "block"});
     $("#testoInfo").css({"position": "absolute"});
     flag = 1;
    }
    else{
      $("#i").animate({width: '3%', height: '5%'});
      $("#testoInfo").css({"display": "none"});
      flag = 0
    }
});



});
