<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//  요청값 검사
	if(request.getParameter("teacherNo") == null) {
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	TeacherDao oneDao = new TeacherDao();
	
	// 상세 페이지용 Teacher 객체
	Teacher tOne = oneDao.selectTeacherOne(teacherNo);
%>
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
	<h1>상세보기</h1>
	<a class="btn btn-info"  href="<%=request.getContextPath() %>/teacher/teacherList.jsp">리스트로</a>
		<table class="table table-striped">
			<tr>
				<th>강사ID</th>
				<td>
					<input type="text" value="<%=tOne.getTeacherId() %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td>
					<input type="text" value="<%=tOne.getTeacherName() %>" name="teacherName" readonly="readonly">분
				</td>
			</tr>
			<tr>
				<th>경력</th>
				<td>
					<input type="text" value="<%=tOne.getTeacherHistory() %>" name="teacherHistory" readonly="readonly">분
				</td>
			</tr>
			<tr>
				<th>강사등록일</th>
				<td>
					<input type="text" value="<%=tOne.getCreatedate() %>" name="createdate" readonly="readonly">분
				</td>
			</tr>
			<tr>
				<th>강사변경일</th>
				<td>
					<input type="text" value="<%=tOne.getUpdatedate() %>" name="updatedate" readonly="readonly">분
				</td>
			</tr>
		</table>
		<a class="btn btn-success" href="<%=request.getContextPath() %>/teacher/teacherUpdate.jsp?teacherNo=<%=teacherNo%>">수정하기</a>
		<a class="btn btn-danger" href="<%=request.getContextPath()%>/teacher/teacherDeleteAction.jsp?teacherNo=<%=teacherNo%>">강사삭제</a>
	</div>
</body>
</html>