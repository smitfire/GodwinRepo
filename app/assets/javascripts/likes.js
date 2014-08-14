// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var likesButton = function(){
  $('.like-form').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var button = $(this).children(":button");
    $.ajax({
            url: url, //sumbits it to the given url of the form
            type: 'POST',
            data: data,
            dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
        }).success(function(json){
            //act on result.
            if(button.text() == json){
              alert('You already liked this Post');
            }else{
              button.text(json);
            }
        });
        return false
    })
}
$(document).ready(likesButton);
$(document).on("page:load", likesButton);