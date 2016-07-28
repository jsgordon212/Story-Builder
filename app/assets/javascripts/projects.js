$(document).ready(function(){
  $('.container').on('click', '.sort-button', function(e){
  e.preventDefault();
  var url= this.id
  $.ajax({
    url: url
  }).done(function(response){
    $('.project-show-content').replaceWith(response);
  })
})
  $('.chapter-button').on('click', function(e){
    e.preventDefault();
    var url = this.id
    $.ajax({
      url: url
    }).done(function(response){
      $('.show-content').replaceWith(response)
    })
  })
  $('.form-button').on('click', function(e){
  e.preventDefault();
  var url = this.id
  $.ajax({
      url: url
    }).done(function(response){
      $('.project-show-content').replaceWith(response)
    })
  })

});
