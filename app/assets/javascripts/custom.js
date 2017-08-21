$(document).on('turbolinks:load', function() {

  // Toggle show menu via navbar burger

  $(".navbar-burger").click(function(){
    $(this).toggleClass('is-active');
    $("#" + $(this).data("target")).toggleClass('is-active');
  });


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


