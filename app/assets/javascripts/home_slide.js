$(function(){
  SyntaxHighlighter.all();
});
$(document).on('turbolinks:load', function(){
  $('.flexslider').flexslider({
    animation: 'slide',
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
});
