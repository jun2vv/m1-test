<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 요청값 검사
	if(request.getParameter("teacherId")==null
	||request.getParameter("teacherName")==null
	||request.getParameter("teacherHistory")==null
	||request.getParameter("teacherId").equals("")
	||request.getParameter("teacherName").equals("")
	||request.getParameter("teacherHistory").equals("")){
	   response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	   return;
	}
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	System.out.println(teacherId+ "<--- teacherInsertAction teacherId");
	System.out.println(teacherName+ "<--- teacherInsertAction teacherName");
	System.out.println(teacherHistory+ "<--- teacherInsertAction teacherHistory");
	
	TeacherDao insertDao = new TeacherDao();
	Teacher t = new Teacher();
	t.setTeacherId(teacherId);
	t.setTeacherName(teacherName);
	t.setTeacherHistory(teacherHistory);
	
	int row = insertDao.insertTeacher(t);
	
	if(row > 0) {
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
        System.out.println("강사 추가 성공");
	} else {
    	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
    	System.out.println("강사 추가 실패");
    	 
    }
%>