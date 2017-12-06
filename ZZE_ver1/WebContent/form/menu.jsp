<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu</title>
<script type="text/javascript" src="resource/jquery-3.2.1.min.js"></script>
<style type="text/css">
	aside{
		height: 100px;
		background-color: skyblue;
		vertical-align:
	}

	aside ul{
		list-style: none;
	}

	aside li{
		font-size: 40px;
		display: inline;
		margin-right: 30px;
	}
</style>
</head>
<body>

	<aside>
		<ul class="menu">
			<li><a href="about.jsp">지짐이</a></li>
			<li><a href="Controller.do?command=spaboard">온천 검색</a></li>
			<li><a href="Controller.do?command=board">게시판</a></li>
		</ul>
	</aside>

</body>
</html>