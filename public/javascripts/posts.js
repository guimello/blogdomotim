$('document').ready(function(){
  //$('div.load-more-collection-container').delegate('a.load-more-collection', 'click', function(){
  $('a.load-more-collection', 'div.load-more-collection-container').live('click', function(){
    $.getScript($(this).attr('href'));
    return false;
  });
});
