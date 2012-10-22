$(function(){
  function updateStream(){
    provider = $("#provider_name").val();
    query = $("#query").val();
    url = "/streams?provider="+provider+"&q="+query+"&update=true"
    $.get(url, function(data){
      $("#raw_content").text(data);
      $("#raw_content").trigger("streamupdated");
    });

  }
  //update content every 60 seconds
  setInterval(updateStream, 60000);
});
