<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
//2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
$(document).ready(function(){
		$.get("https://www.googleapis.com/youtube/v3/playlists",{
			part:'snippet',
			channelId: 'UCgIUlZVGvVYvS6OZZB4upiw',
			key:'AIzaSyBXPADbE_sfFg-mR1aktr7lmsNJg-pR-DM'
			},
			function(data){
				var output;
				$.each(data.items, function(i, items){
					console.log(items);
					thumbnails = items.snippet.thumbnails.default;
 					videTitle = items.snippet.channelTitle;
					output = '<li>'+videTitle+'</li>'+'<li>'+thumbnails+'</li>'; 
					
					//Append to results listStyleType
					$('#youtube-results').append(output);
					
/* 					function displayResult(videoSnippet) {
						  var title = videoSnippet.title;
						  var videoId = videoSnippet.resourceId.videoId;
						  $('#youtube-results').append('<p>' + title + ' - ' + videoId + '</p>');
						} */
					
				})
			}
		)
});
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
 
// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    height: '360',
    width: '640',
    videoId: 'M7lc1UVf-VE',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}
 
// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.playVideo();
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(stopVideo, 6000);
    done = true;
  }
}
function stopVideo() {
  player.stopVideo();
}
</script>
<div class="body-container">
<ul id="youtube-results"></ul>
	<!-- 1. The iframe (and video player) will replace this div tag. -->
	<div id="player"></div>
</div>
