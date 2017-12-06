<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
</head>
<body>

	<%@ include file="form/form.jsp" %>
	
	<c:if test="${member.enabled == null }">
		<%@ include file="plzLogin.jsp" %>	
	</c:if>
	
	<c:if test="${member.enabled != null }">
		<table>
			<tr>
				<td colspan="2"><img alt="face" src="${member.face }"></td>
			</tr>
			<tr>
				<td colspan="2">${member.id }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.name }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${member.gender=='M'?'남자':'여자' }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${member.tel }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.address }</td>
			</tr>
			<tr>
				<td colspan="2">
					<button onclick="location.href='memberUpdate.jsp'">정보 수정</button>
					<button>지짐이 탈퇴</button>
				</td>
			</tr>
			
		</table>
		
	</c:if>

	<script type="text/javascript">
		$("button").eq(1).click(function(){
			if(confirm("정말로 탈퇴하시겠습니까?")){
				location.href="Controller.do?command=leave&no=${member.no}";
			}
		});
	</script>
</body>
</html>