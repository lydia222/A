<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
	
	header{
		background-color: pink;
		height: 100px;
	}

	header h1{
		float: left;
	}

	header .client{
		float: right;
		margin-top: 40px;
		margin-right: 20px;
		font-size: 20px;
	}
	
	header a {
		text-decoration: none;
	}
}
</style>
</head>
<body>
	<header>
		<h1><a href="main.jsp">ZZE</a></h1>
		<span class="client">
			<img alt="face" width="50px" src="${member.face }">
			<span>${member.id }</span>
			<a href="Controller.do?command=myInfo">내 정보</a>
			<a href="Controller.do?command=logout">Logout</a>
		</span>
	</header>
</body>
</html>