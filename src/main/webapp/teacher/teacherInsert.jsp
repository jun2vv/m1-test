<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>강사추가창</h1>
	<a class="btn btn-info"  href="<%=request.getContextPath() %>/teacher/teacherList.jsp">리스트로</a>
	<form action="<%=request.getContextPath()%>/teacher/teacherInsertAction.jsp">
		<table class="table table-striped">
			<tr>
				<th>강사ID</th>
				<td>
					<input type="text" name ="teacherId">
				</td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td>
					<input type="text" name="teacherName">시간
				</td>
			</tr>
			<tr>
				<th>경력</th>
				<td>
					<input type="text" name="teacherHistory">시간
				</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">추가하기</button>
	</form>
	</div>
</body>
</html>