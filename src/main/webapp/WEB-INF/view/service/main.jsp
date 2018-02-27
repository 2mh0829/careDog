<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<div class="body-container">
	Care Service.
	<p>Date: <input type="text" id="datepicker"></p>
</div>