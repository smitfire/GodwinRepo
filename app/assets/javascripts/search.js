// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var searchGodwin = function(elem){
  $('#search').keyup(function(){
    var searchVal = $(this).val();
    var myExp = new RegExp(searchVal, 'i');
    $(elem).each(function(){
      var postVal = $(this).text();
      if(myExp.test(postVal)){
        $(this).show();
      }else{
        $(this).hide();
      }
    });
  });
};