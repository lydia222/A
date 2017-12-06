<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
	<style type="text/css">
		table{
			margin: auto;
		}
		
		.alert{
			color: red;
			font-size: 10px;
		}
		
		.ok{
			color: green;
			font-size: 10px;
		}

		.msg{
			color: green;
			font-size: 10px;
		}

		.face{
			width: 50px;
			height: 50px;
		}

		td{
			width: 210px;
			padding: 5px;
			text-align: center;
		}
		
		.type{
			width: 205px;
		}

		.submit{
			text-align: center;
		}
		
		.tel{
			width: 57px;
		}

	</style>
	<script type="text/javascript" src="resource/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="resource/joinForm.js?ver=1"></script>
</head>
<body>

	<form action="Controller.do" method="get">
		<table border="1">
			<caption>회원가입</caption>
			<tr>
				<td>
					<input class="type" type="text" name="id" placeholder="아이디" required="required" maxlength="10">
					<div class="idChk"></div>
				</td>
			</tr>
			<tr>
				<td><input class="type" type="password" name="pw" placeholder="비밀번호" required="required" minLength="5"></td>
			</tr>
			<tr>
				<td>
					<input class="type" type="password" placeholder="비밀번호 재확인" required="required">
					<div class="pwChk"></div>
				</td>
			</tr>
		</table>
		<br>
		<table border="1">
			<tr>
				<td>
					<input class="type" type="text" name="name" required="required" placeholder="이름">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="radio" name="gender" value="M" required="required">남자
					<input type="radio" name="gender" value="W">여자
				</td>
			</tr>

			<tr>
				<td>
					<input type="hidden" name="face" value="img/img1.png">
					<img style="border: 3px solid skyblue;" class="face" src="img/img1.png"><img class="face" src="img/img2.png"><img class="face" src="img/img3.png"><img class="face" src="img/img4.png"><br>

					<img class="face" src="img/img5.png"><img class="face" src="img/img6.png"><img class="face" src="img/img7.png"><img class="face" src="img/img8.png"><br>
					
					<img class="face" src="img/img9.png"><img class="face" src="img/img10.png"><img class="face" src="img/img11.png"><img class="face" src="img/img12.png"><br>
					이모티콘
				</td>
			</tr>
			<tr>
				<td>
					<input class="type" type="email" name="email" placeholder="이메일" required="required">
					<div style="font-size: 10px; text-align: center;">이메일은 아이디/비밀번호 찾기에<br> 사용되니 잘 적어주세요.</div>
					<div class="emailChk"></div>
				</td>
			</tr>
			<tr>
				
				<td>
					<input class="tel" type="text" placeholder="전화번호" required="required" minLength="3" maxlength="3">-
					<input class="tel" type="text" required="required" minLength="3" maxlength="4">-
					<input class="tel" type="text" placeholder="" required="required" minLength="4" maxlength="4">
					<input type="hidden" name="tel">
				</td>
				
			</tr>
			<tr>
				<td><input class="type" type="text" name="address" placeholder="주소" required="required"></td>
			</tr>
		</table>
		<br>
		<div class="submit">
			<input type="submit" value="가입하기">
		</div>
		<input type="hidden" name="command" value="memberInsert">
	</form>

</body>
</html>