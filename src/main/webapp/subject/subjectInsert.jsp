<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<div class="container">
	<h1>과목추가창</h1>
	<a class="btn btn-info"  href="<%=request.getContextPath() %>/subject/subjectList.jsp">리스트로</a>
	<form action="<%=request.getContextPath()%>/subject/subjectInsertAction.jsp">
		<table class="table table-striped">
			<tr>
				<th>과목이름</th>
				<td>
					<input type="text" name ="subjectName">
				</td>
			</tr>
			<tr>
				<th>과목시간</th>
				<td>
					<input type="text" name="subjectTime">시간
				</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">추가하기</button>
	</form>
	</div>
</body>
</html>