// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require posts

var ready = function(){
  $('#post-form').hide();
  $('button#show-post-form').on('click', function(event) {
     console.log('show post form button');
     $('#post-form').show();
  }) 
}
function accuserJax() {
  $('#myForm').on('submit', function(event{
      event.preventDefault();
      $.post(url, {name: 'nick'}, function(res){
        console.log(res)
        })
    }))
}
$(document).ready(ready);
$(document).on("page:load", ready);