// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//  You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function(){
  $('#show_post_form').on('click', function(event) {
    event.stopPropagation();
     $('#post_form').removeClass('hidden');
  });
  $('#unshow_post_form').on('click', function(event) {
    event.preventDefault()
    $('#post_form').addClass('hidden')
  });
  $( ".datepicker" ).datepicker();
};
$(document).ready(ready);
$(document).on("page:load", ready);
