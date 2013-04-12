$(function() {
  $(".content").hide();
  $(".feed_link").click(function(){
   // Check feed content is fetched already or not
   var content = !$.trim( $(this).next(".content").html() ).length;

   if(!content) {
      $(this).next(".content").slideToggle("10");
      // Disable ajax call if content is fetched already
      return false;
    }
  });
});
	


