<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// 요청값 검사
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")) {
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	System.out.println(teacherNo + " <--- subjectDeleteAction teacherNo");
	
	// 메서드 클래스 객채생성 후 메서드 사용가능
	TeacherDao delDao = new TeacherDao();
	
	// deleteTeacher메서드 반환값이 int타입이므로 int 변수에 지정해서 선언
	int row = delDao.deleteTeacher(teacherNo);
	
	if(row > 0) {
		System.out.println("강사 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	} else {
		System.out.println("강사 삭제 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	}
%>
