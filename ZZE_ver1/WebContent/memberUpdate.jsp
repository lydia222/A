<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정 : ${member.id }</title>
<style type="text/css">
	.face{
		width: 50px;
	}
	
	.tel{
		width: 60px;
	}
</style>
</head>
<body>
	
	<%@ include file="form/form.jsp" %>


	<c:if test="${member == null }">
		<%@ include file="plzLogin.jsp" %>
	</c:if>
	
	
	<c:if test="${member != null }">
		<div class="pwEnter">
			<h4>비밀번호를 재입력해주세요</h4>
			<input type="password"> <button>입력</button>
		</div>
		
		<form action="Controller.do">
			<input type="hidden" name="command" value="myInfoUpdate">
			<input type="hidden" name="no" value="${member.no }">
			<table border="1">
				<tr>
					<th>이모티콘</th>
					<td>
						<input type="hidden" name="face" value="${member.face }">
						<img class="face" src="img/img1.png"><img class="face" src="img/img2.png"><img class="face" src="img/img3.png"><img class="face" src="img/img4.png"><br>
	
						<img class="face" src="img/img5.png"><img class="face" src="img/img6.png"><img class="face" src="img/img7.png"><img class="face" src="img/img8.png"><br>
						
						<img class="face" src="img/img9.png"><img class="face" src="img/img10.png"><img class="face" src="img/img11.png"><img class="face" src="img/img12.png"><br>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${member.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${member.name }"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" ${member.gender=='M'?"checked":"" } value="M">남자
						<input type="radio" name="gender" ${member.gender=='W'?"checked":"" } value="W">여자
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" value="${member.email }" required="required"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input class="tel" type="text" required="required" minLength="3" maxlength="3">-<input class="tel" type="text" required="required" minLength="3" maxlength="4">-<input class="tel" type="text" required="required" minLength="4" maxlength="4">
						<input type="hidden" class="tel" name="tel" value="">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required="required" value="${member.address }"></td>
				</tr>
			</table>
			<button>변경</button>
		</form>
	</c:if>

	<script type="text/javascript">
		$("form").hide();
		
		//처음 비밀번호 확인하기
		$("button").eq(0).click(function(){
			if($("input").eq(0).val() == "${member.pw }"){
				$(".pwEnter").hide();
				$("form").show();
			}else{
				alert("비밀번호를 다시 확인해주세요!");
				location.href="myInfo.jsp";
			}
			
		});
		
		//전화번호 원래 전화번호로 세팅
		var tel = "${member.tel }";
		if(tel.length==11){
			$(".tel").eq(0).val(tel.substr(0,3));	
			$(".tel").eq(1).val(tel.substr(3,4));	
			$(".tel").eq(2).val(tel.substr(7,4));	

		}else if(tel.length==10){
			$(".tel").eq(0).val(tel.substr(0,3));	
			$(".tel").eq(1).val(tel.substr(3,3));	
			$(".tel").eq(2).val(tel.substr(6,4));	
			
		}
		
		$(".face").each(function(){
			if($(this).attr("src") == "${member.face}"){
				$(this).css("border", "3px solid skyblue");	
			}
		});
		
		//이모티콘 누르면 선택
		$(".face").click(function(){
			$(".face").each(function(){
			    $(this).css("border", "");
			});
			$(this).css("border", "3px solid skyblue");
			$("input[name='face']").val($(this).attr("src"));
		});
		


		var emailOk = false;
		var pwOk = false;
		
		$("form").submit(function(){
			var pw1 = $("input").eq(4).val();
			var pw2 = $("input").eq(5).val();
			
			//아무 변경도 없으면 기존 비밀번호
			if(pw1.length==0 && pw2.length==0){
				pwOk=true;
			//5자 이하면 alert
			}else if(pw1.length<5 || pw2.length<5){
				pwOk = false;
				alert("비밀번호는 5자 이상이어야합니다.");
			//비밀번호 서로 일치하지 않으면 alert	
			}else if(pw1 != pw2){
				pwOk = false;
				alert("비밀번호가 일치하지 않습니다!");
			//비밀번호가 5자 이상 일 경우 	
			}else{
				for(var i=0; i<pw1.length; i++){
					var code = pw1.charCodeAt(i);
					//비밀번호가 소문자&숫자가 아닐 경우
					if( !((97<=code && code<=122) || (48<=code && code <= 57)) ){
						pwOk=false;
						alert("비밀번호는 소문자 & 숫자로 이뤄져야 합니다.");
						break;
					}else{
						pwOk=true;
					}
				}
			} 
			
			var email = $("input").eq(9).val();
			if(email == "${member.email}"){
				emailOk=true;
			}else{
				if(email.indexOf("@")>=0){
					var url = "Controller.do?command=emailCheck&email="+email;
					httpRequest = new XMLHttpRequest();
					httpRequest.onreadystatechange = callbackEmail;
					httpRequest.open("GET", url, true);
					httpRequest.send();
				}else{
					emailOk=false;
				}
			}
			
			if(pwOk && emailOk && pw1.length==0){
				$("input").eq(4).val("${member.pw}");
			}
			
			
			$(".tel").eq(3).val($(".tel").eq(0).val()+$(".tel").eq(1).val()+$(".tel").eq(2).val());
			
			return pwOk && emailOk;
		});
		
		function callbackEmail(){
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					if(httpRequest.responseText.trim() == "ok"){
						emailOk=true;
					}else{
						emailOk = false;
						alert("중복되는 이메일입니다.");
					}
				}
			}
		}
		
	</script>
	
	<script type="text/javascript" src="resource/memberUpdate.js"></script>
</body>
</html>