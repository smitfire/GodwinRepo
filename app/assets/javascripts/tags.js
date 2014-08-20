// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var searchTag = function(){
  $('#search').keyup(function(){
    var searchVal = $(this).val();
    var myExp = new RegExp(searchVal, 'i');
    $('#update > .btn').each(function(index){
      var tagVal = $(this).text();
      if(myExp.test(tagVal)){
        $(this).show();
      }else{
        $(this).hide();
      }
    });
  });
};
$(document).ready(searchTag);