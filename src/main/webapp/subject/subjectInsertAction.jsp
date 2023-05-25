<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// 요청값 검사
	if(request.getParameter("subjectName")==null
	||request.getParameter("subjectTime")==null
	||request.getParameter("subjectName").equals("")
	||request.getParameter("subjectTime").equals("")){
	   response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	   return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	System.out.println(subjectName+ "<--- subjectInsertAction subjectName");
	System.out.println(subjectTime+ "<--- subjectInsertAction subjectTime");
	
	
	SubjectDao iDao = new SubjectDao();
    Subject s = new Subject();
    
 	// 과목 이름 설정
 	// 과목 시간 설정
    s.setSubjectName(subjectName); 
    s.setSubjectTime(subjectTime); 
    
	 // insertSubject메서드 반환값이 int타입이므로 int 변수에 지정해서 선언
    int row = iDao.insertSubject(s); 
    if (row > 0) {
        response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
        System.out.println("과목 추가 성공");
    } else {
    	response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
    	System.out.println("과목 추가 실패");
    	 
    }
%>
