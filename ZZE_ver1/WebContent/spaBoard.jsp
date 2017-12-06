<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
<!-- update -->	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="json.js?ver=1"></script>

</head>
<body>

	<%@ include file="form/form.jsp" %>
	<div style="text-align: center;">
		<select class="area" style="width: 200px; height: 30px;">
			<option value="">전체</option>
			<optgroup label="가">
				<option>가평군</option>
				<option>고양시</option>
				<option>과천시</option>
				<option>구리시</option>
				<option>광명시</option>
				<option>광주시</option>
				<option>군포시</option>
				<option>김포시</option>
			</optgroup>
			<optgroup label="나">
				<option>남양주시</option>
			</optgroup>
			<optgroup label="다">
				<option>동두천시</option>
			</optgroup>
			<optgroup label="바">
				<option>부천시</option>
			</optgroup>
			<optgroup label="사">
				<option>성남시</option>
				<option>수원시</option>
				<option>시흥시</option>
			</optgroup>
			<optgroup label="아">
				<option>안성시</option>
				<option>안양시</option>
				<option>안산시</option>
				<option>양주시</option>
				<option>양평군</option>
				<option>여주시</option>
				<option>연천군</option>
				<option>오산시</option>
				<option>용인시</option>
				<option>의왕시</option>
				<option>의정부시</option>
				<option>이천시</option>
			</optgroup>
			<optgroup label="파">
				<option>파주시</option>
				<option>평택시</option>
				<option>포천시</option>
			</optgroup>
			<optgroup label="하">
				<option>하남시</option>
				<option>화성시</option>
			</optgroup>
		</select>
	</div>
	<div style="overflow-x: hidden; overflow-y: auto; margin: auto; height: 300px;">
		<table border="1" style="margin: auto;">
			<thead>
				<tr>
					<th>온천명</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>
