<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resource/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resource/findIdForm.js?ver=1"></script>
<title>계정 아이디 찾기</title>
<style type="text/css">
	.ok{
		color: green;
		font-size: 10px;
	}
	
	.alert{
		color: red;
		font-size: 10px;
	}
</style>
</head>
<body>

	<div>	
		<div><input class="name" type="text" name="name" placeholder="이름"></div>
		<div><input class="email" type="text" name="email" placeholder="이메일"></div>
		<div class="result"></div>
		<div><button>아이디 찾기</button></div>
		<input type="hidden" name="command" value="findId">
	</div>
	
</body>
</html>