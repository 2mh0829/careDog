<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
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


</script>
<div class="body-container">
	<ul id="youtube-results"></ul>
</div>
