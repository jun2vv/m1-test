<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 요청값 검사
	if(request.getParameter("teacherNo")==null
	||request.getParameter("subjectNo")==null
	||request.getParameter("teacherNo").equals("")
	||request.getParameter("subjectNo").equals("")){
	   response.sendRedirect(request.getContextPath()+"/teacher_subject/teacher_subject.jsp");
	   return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	System.out.println(teacherNo+ "<--- teacher_subject_insertAction teacherNo");
	System.out.println(subjectNo+ "<--- teacher_subject_insertAction subjectNo");
	
	TeacherSubjectDao tsDao = new TeacherSubjectDao();
	
	TeacherSubject ts = new TeacherSubject();
	ts.setTeacherNo(teacherNo);
	ts.setSubjectNo(subjectNo);
	
	int row = tsDao.insertTeacherSubject(ts);
	
	if(row > 0) {
		System.out.println("추가 완료");
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
	} else {
		System.out.println("추가 실패");
		response.sendRedirect(request.getContextPath() + "/teacher_subject/teacher_subject_insert.jsp");
	}
%>
