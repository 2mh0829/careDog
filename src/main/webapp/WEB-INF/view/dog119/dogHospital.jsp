<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d00eac2ad03dd3b680a9af94cd77521"></script>
<script>
	var container = document.getElementById('map'); 
	var option ={ //지도 생성할 때 필요한 기본 옵션
			center: new daum.maps.Latlng(33.450701, 126.570667), //지도 중심축
			level: 3
	};
	var map = new daum.maps.Map(container, options);
</script>
<div class="body-container">

<div id="map" style="width:500px; height:400px;"></div>
   
</div>