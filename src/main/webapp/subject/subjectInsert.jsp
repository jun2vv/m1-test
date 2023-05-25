<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목추가창</h1>
	<form action="<%=request.getContextPath()%>/subject/subjectInsertAction.jsp">
		<table>
			<tr>
				<th>과목이름</th>
				<td>
					<input type="text" name ="subjectName">
				</td>
			</tr>
			<tr>
				<th>과목시간</th>
				<td>
					<input type="text" name="subjectTime">분
				</td>
			</tr>
		</table>
		<button type="submit">추가하기</button>
	</form>
</body>
</html>