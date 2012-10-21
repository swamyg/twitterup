$(function(){
  parse_and_display_raw_content();

  $('#raw_content').change(function() {
    alert('Handler for .change() called.');
  });

  function parse_and_display_raw_content(){
    console.log("in here");
    $raw_content = $($("#raw_content").text());
    $raw_content.children().find('.stream-items').children('.stream-item').each(function(index, el){
      console.log("in each loop");
      tweet = $(el).find('.js-tweet-text').text();
      build_and_append_tweet(tweet);
    });
  }

  function build_and_append_tweet(tweet){
    console.log("build content");
    $ul = $('#stream_content ul');
    $ul.append($("<li>"+tweet+"</li>"));
  }
});