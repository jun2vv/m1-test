<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	// 요청값 분석
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")) {
		// teacherList.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	System.out.println(teacherNo + "<--- teacherUpdate teacherNo");
	
	// sql 메서드들이 있는 클래스의 객체 생성
	TeacherDao tDao = new TeacherDao();
	
	// 수정 페이지에 표시할 Teacher t 객체
	Teacher t = tDao.selectTeacherOne(teacherNo);
	
	
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
	<h1>과목수정창</h1>
	<a class="btn btn-info" href="<%=request.getContextPath() %>/teacher/teacherOne.jsp?teacherNo=<%=teacherNo%>">뒤로</a>
	<form action="<%=request.getContextPath()%>/teacher/teacherUpdateAction.jsp">
		<table class="table table-striped">
			<tr>
				<th>강사ID</th>
				<td>
					<input type="hidden" name="teacherNo" value="<%=teacherNo%>">
					<input type="text" value="<%=t.getTeacherId() %>" name="teacherId">
				</td>
			</tr>
			<tr>
				<th>강사 이름</th>
				<td>
					<input type="text" value="<%=t.getTeacherName() %>" name="teacherName">
				</td>
			</tr>
			<tr>
				<th>경력</th>
				<td>
					<input type="text" value="<%=t.getTeacherHistory() %>" name="teacherHistory">
				</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">수정하기</button>
	</form>
	</div>
</body>
</html>