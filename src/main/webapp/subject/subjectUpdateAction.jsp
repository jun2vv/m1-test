<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	//요청값 검사
	if(request.getParameter("subjectName")==null
		||request.getParameter("subjectTime")==null
		||request.getParameter("subjectNo")==null
		||request.getParameter("subjectName").equals("")
		||request.getParameter("subjectTime").equals("")
		||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	// 요청값 변수
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	System.out.println(subjectName+ "<--- subjectUpdateAction subjectName");
	System.out.println(subjectTime+ "<--- subjectUpdateAction subjectTime");
	System.out.println(subjectNo+ "<--- subjectUpdateAction subjectNo");
	
	// 메서드를 사용하기 위해 클래스객체생성
	SubjectDao upDao = new SubjectDao();
	
	Subject s = new Subject();
	// 수정받은 값 저장
	s.setSubjectName(subjectName);
	s.setSubjectTime(subjectTime);
	s.setSubjectNo(subjectNo);
	
	
	int row = upDao.updateSubject(s);
	
	if(row > 0) {
		System.out.println("수정완료");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	} else {
		System.out.println("수정실패");
	}
	
		
%>
