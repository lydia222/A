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
			<a href="Controller.do?command=memberManage&pageNum=1">회원 관리</a>
			<a href="Controller.do?command=logout">Logout</a>
		</span>
	</header>
</body>
</html>