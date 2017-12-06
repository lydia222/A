<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온천 지짐이</title>
</head>
<body>

	<c:choose>
		<c:when test="${member==null }">
			<%@ include file="header_nonMember.jsp" %>
		</c:when>
		
		<c:when test="${member.id == 'admin' }">
			<%@ include file="header_admin.jsp" %>
		</c:when>
		
		
		<c:otherwise>
			<%@ include file="header_member.jsp" %>
		</c:otherwise>
	</c:choose>
	
	<%@ include file="menu.jsp" %>
</body>
</html>