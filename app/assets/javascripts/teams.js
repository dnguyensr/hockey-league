$(document).ready(function() {
  var mainColor = $('#primary_color').text();
  var secondaryColor = $('#secondary_color').text();
  $("body").css("background-color", mainColor);
  $('body').css("color", secondaryColor);
});
