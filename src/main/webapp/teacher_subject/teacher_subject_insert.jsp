<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>

<%
	/*
		강사명 과목을 추가하기 위해서는 db에 외래키 지정되어 있는 
		teacher_no와 subject_no는 기존 값을 가져와서 
		추가시켜야 하기에 ArrayList메서드를 만들어 불러옴
	*/
	
	// 메서드를 사용하기 위한 객체
	TeacherSubjectDao tsDao = new TeacherSubjectDao();
	
	// teacher_no와 name을 가져오기 위한 ArrayList객체
	ArrayList<Teacher> tList = tsDao.selectTeacher();
	// subject_no와 name을 가져오기 위한 ArrayList객체
	ArrayList<Subject> sList = tsDao.selectSubject();
	
	
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
	<h1>담당 과목 추가</h1>
	<form action = "<%=request.getContextPath()%>/teacher_subject/teacher_subject_insertAction.jsp">
		<table class="table table-striped">
			<tr>
				<td>강사 이름</td>
				<td>
					<!--value 넘어가는 값  -->
					<!--  아래는 보여주는 값 -->
					<select name ="teacherNo">
						<%
							for(Teacher t : tList) {
						%>
							<option value="<%=t.getTeacherNo()%>">
								<%=t.getTeacherName()%>
							</option>
						<% 	
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>담당 과목</td>
				<td>
					<!--value 넘어가는 값  -->
					<!--  아래는 보여주는 값 -->
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
		<button class="btn btn-success" type="submit"> 추가하기</button>
	</form>
	</div>
</body>
</html>