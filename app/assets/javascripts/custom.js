$(document).on('turbolinks:load', function() {

  $('#log-in').click(function(event){

   //event.preventDefault();
   //$('#login-modal').addClass('is-active')

  });

  $('.modal-background').click(function(){
    $('#login-modal').removeClass('is-active')
  });

  $('#modal-close').click(function(){
    $('#login-modal').removeClass('is-active')
  });

});
