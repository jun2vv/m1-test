<%@page import="java.util.ArrayList"%>
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
	System.out.println(teacherNo + "<--- teacher_subject_update teacherNo");
	
	// TeacherSubjectDao에서 suject목록을 가져오기 위함
	TeacherSubjectDao tsDao = new TeacherSubjectDao();
	// TeacherDao에서 teacher상세보기를 가져오기 위함
	TeacherDao tDao = new TeacherDao();
	
	Teacher t = tDao.selectTeacherOne(teacherNo);
	
	// subject_no와 name을 가져오기 위한 ArrayList객체
	ArrayList<Subject> sList = tsDao.selectSubject();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강사 담당과목 변경</h1>
	<form action = "<%=request.getContextPath()%>/teacher_subject/teacher_subject_updateAction.jsp">
		<table>
			<tr>
				<td>강사이름</td>
				<td>변경과목</td>
			</tr>
			<tr>
				<td><%=t.getTeacherName() %></td>
				<td>
					<select name ="subjectNo">
						<%
							for(Subject s : sList) {
						%>
							<option value="<%=s.getSubjectNo()%>">
								<%=s.getSubjectName()%>
							</option>
						<% 	
							}
						%>
					</select>
				</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">담당 과목 수정</button>
	</form>
</body>
</html>