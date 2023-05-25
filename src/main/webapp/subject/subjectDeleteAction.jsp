<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	// 요청값 검사
	if(request.getParameter("subjectNo") == null
		|| request.getParameter("subjectNo").equals("")) {
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println(subjectNo + " <--- subjectDeleteAction subjectNo");
	
	// 메서드 클래스 객채생성 후 사용가능
	SubjectDao delDao = new SubjectDao();
	
	// deleteSubject메서드 반환값이 int타입이므로 int 변수에 지정해서 선언
	int row = delDao.deleteSubject(subjectNo);
	if(row > 1) {
		System.out.println("과목 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	} else {
		System.out.println("과목 삭제 실패");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	}
%>
