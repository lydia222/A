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
	
	header .loginForm{
		float: right;
	}
	
	header input[type='submit']{
		height: 40px;
	}
</style>
<script type="text/javascript">
	window.onload = function(){
		var urlArr = location.href.split("/");
		var url = urlArr[urlArr.length-1];
		
		var place = "";
		if(url.indexOf("main")>=0){
			place="main";
		}else if(url.indexOf("board")>=0){
			place="board";
		}else if(url.indexOf("about")>=0){
			place="about";
		}
		
		document.getElementsByName("url")[0].value = url;
	}
</script>
</head>
<body>

	<header>
		<h1><a href="main.jsp">ZZE</a></h1>
		
		<div class="loginForm">
			<form action="Controller.do">
				<input type="hidden" name="command" value="login">
				<input type="hidden" name="url" value="">
	
				<input type="text" name="id" placeholder="아이디">
				<input type="password" name="pw" placeholder="비밀번호">
				<input type="submit" value="로그인">
			</form>
			<div>
				<a href="Controller.do?command=joinForm" onclick="window.open(this.href, 'popup', 'width=300, height=650'); return false;">회원가입</a>
				<a href="Controller.do?command=findIdForm" onclick="window.open(this.href, 'popup', 'width=300, height=350'); return false;">아이디</a>/
				<a href="Controller.do?command=findPwForm" onclick="window.open(this.href, 'popup', 'width=300, height=350'); return false;">비밀번호 찾기</a>
			</div>
		</div>
	</header>

</body>
</html>