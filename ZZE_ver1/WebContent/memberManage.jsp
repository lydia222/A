<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<script type="text/javascript" src="resource/jquery-3.2.1.min.js"></script>
</head>
<body>

	<%@ include file="form/form.jsp" %>
	
	
	<c:if test="${member.enabled!='A' }">
		<%@ include file="plzLogin.jsp" %>	
	</c:if>
	
	<c:if test="${member.enabled=='A' }">
		<form action="Controller.do">
			<input type="hidden" name="command" value="enabledChange">
			<input type="hidden" name="url" value="">
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>상태</th>
					</tr>
				</thead>
					
				<tbody>
					<c:if test="${empty memberList }">
						<tr>
							<td colspan="8">===================== 검색 결과가 없습니다 =====================</td>
						</tr>
					</c:if>
					
					<c:if test="${!empty memberList }">
						<c:forEach items="${memberList }" var="member">
							<tr>
								<td>
									${member.no }
									<input type="hidden" name="no" value="${member.no }">
								</td>
								<td>${member.id }</td>
								<td>${member.name }</td>
								<td>${member.gender }</td>
								<td>${member.email }</td>
								<td>${member.tel }</td>
								<td>${member.address }</td>
								<td>
									<select name="enabled">
										<option value="Y" ${member.enabled == 'Y'? 'selected': ''}>이용 중</option>
										<option value="N" ${member.enabled == 'N'? 'selected': ''}>탈퇴</option>
										<option value="B" ${member.enabled == 'B'? 'selected': ''}>차단</option>
									</select>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="8"><button>변경</button></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</form>
<%
// 페이징 처리를 위해 필요한 변수 세팅
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
int totalPage = Integer.parseInt(request.getParameter("totalPage"));
int pageCeil = (int)Math.ceil(pageNum/10.0);
int totalCeil = (int)Math.ceil(totalPage/10.0);

int start = (pageCeil-1)*10+1;
int end = start+9;
if(pageCeil == totalCeil){
	end = totalPage;
}
%>

<!-- 페이징 -->
	<c:if test="${param.totalPage==0 }">
		<button>1</button>
	</c:if>

	<c:if test="${param.totalPage!=0 }">
		<!-- 검색 x -->
		<c:if test="${param.search == null }">
			<div class="page">
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=1'"><<</button>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=<%=start-10%>'"><</button>
				<c:forEach var="i" begin="<%=start %>" end="<%=end %>" step="1">
					<button onclick="location.href='Controller.do?command=memberManage&pageNum=${i}'">${i }</button>
				</c:forEach>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=<%=start+10%>'">></button>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=${param.totalPage}'">>></button>
			</div>
		</c:if>
	
		<!-- 검색 -->
		<c:if test="${param.search != null }">
			<div class="page">
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=1&search=${param.search }&keyword=${param.keyword }'"><<</button>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=<%=start-10%>&search=${param.search }&keyword=${param.keyword }'"><</button>
				<c:forEach var="i" begin="<%=start %>" end="<%=end %>" step="1">
					<button onclick="location.href='Controller.do?command=memberManage&pageNum=${i}&search=${param.search }&keyword=${param.keyword }'">${i }</button>
				</c:forEach>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=<%=start+10%>&search=${param.search }&keyword=${param.keyword }'">></button>
				<button onclick="location.href='Controller.do?command=memberManage&pageNum=${param.totalPage}&search=${param.search }&keyword=${param.keyword }'">>></button>
			</div>
		</c:if>
	
		<!-- 검색 form -->		
		<form action="Controller.do">
			<input type="hidden" name="command" value="memberManage">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<option value="ID">아이디</option>
				<option value="NAME">이름</option>
				<option value="EMAIL">이메일</option>
			</select>
			<input type="text" name="keyword">
			<button>검색</button>
		</form>
	
		<script type="text/javascript">
			//현재 페이지 bold
			$(".page button").each(function(){
				if($(this).text() == "${param.pageNum}"){
					$(this).wrapInner("<b></b>");
				}
			});
			
			//첫 페이지에서 -10페이지 못하게 하기
			if(${param.pageNum}<=10){
				$(".page button").eq(1).attr("disabled", "disabled");
			}
			
			//마지막 페이지에서 +10페이지 못하게 하기 
			if(<%=pageCeil == totalCeil%>){
				var length = $(".page button").length;
				$(".page button").eq(length-2).attr("disabled", "disabled");
			}
			
			var urlArr = location.href.split("/");
			var url = urlArr[urlArr.length-1];
			$("input").eq(1).val(url);
		</script>
		</c:if>
		
	</c:if>
	
	
	

</body>
</html>