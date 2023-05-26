<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	//요청값 검사
	if(request.getParameter("teacherNo")==null
		||request.getParameter("teacherId")==null
		||request.getParameter("teacherName")==null
		||request.getParameter("teacherHistory")==null
		||request.getParameter("teacherNo").equals("")
		||request.getParameter("teacherId").equals("")
		||request.getParameter("teacherName").equals("")
		||request.getParameter("teacherHistory").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	System.out.println("<--- teacherUpdateAction 수정액션 못넘음");
	
	// 요청값 변수
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	System.out.println(teacherNo+ "<--- teacherUpdateAction teacherNo");
	System.out.println(teacherId+ "<--- teacherUpdateAction teacherId");
	System.out.println(teacherName+ "<--- teacherUpdateAction teacherName");
	System.out.println(teacherHistory+ "<--- teacherUpdateAction teacherHistory");
	
	// 메서드를 사용하기 위해 클래스객체생성
	TeacherDao upDao = new TeacherDao();
	
	// 메서드 매개변수가 Teacher이므로 Teacher 객체 생성
	Teacher delT = new Teacher();
	// 수정받은 값 저장
	delT.setTeacherNo(teacherNo);
	delT.setTeacherId(teacherId);
	delT.setTeacherName(teacherName);
	delT.setTeacherHistory(teacherHistory);
	
	// 메서드 반환값이 int 타입이므로 int에 저장
	int row = upDao.updateTeacher(delT);
	
	if(row > 0) {
		System.out.println("수정완료");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	} else {
		System.out.println("수정실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	}

%>
