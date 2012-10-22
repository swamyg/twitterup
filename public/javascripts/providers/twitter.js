$(function(){
  parse_and_display_raw_content();

  $('#raw_content').bind("streamupdated", function() {
    parse_and_display_raw_content();
  });

  function parse_and_display_raw_content(){
    $raw_content = $($("#raw_content").text());
    $raw_content.children().find('.stream-items').children('.stream-item').each(function(index, el){
      tweet = $(el).find('.js-tweet-text').text();
      build_and_append_tweet(tweet);
    });
    $("#notification").text("Content last updated at: "+ new Date());
  }

  function build_and_append_tweet(tweet){
    $ul = $('#stream_content ul');
    $ul.append($("<li>"+tweet+"</li>"));
  }
});