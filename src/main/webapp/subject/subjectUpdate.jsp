<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	//요청값 유효성 검사
	if(request.getParameter("subjectNo") == null  
			|| request.getParameter("subjectNo").equals("")) {
			// subjectList.jsp으로
			response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
			return;
	}
	// 요청값 변수에 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println(subjectNo + "<--- subjectUpdate subjectNo");
	
	// sql 메서드들이 있는 클래스의 객체 생성
	SubjectDao sDao = new SubjectDao();
		
	// 수정 페이지에 표시할 subject 객체
	Subject s = sDao.selectSubjectOne(subjectNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목수정창</h1>
	<a href="<%=request.getContextPath() %>/subject/subjectOne.jsp?subjectNo=<%=subjectNo%>">뒤로</a>
	<form action="<%=request.getContextPath()%>/subject/subjectUpdateAction.jsp">
		<table>
			<tr>
				<th>과목이름</th>
				<td>
					<input type="hidden" name="subjectNo" value="<%=s.getSubjectNo()%>">
					<input type="text" value="<%=s.getSubjectName() %>" name="subjectName">
				</td>
			</tr>
			<tr>
				<th>과목시간</th>
				<td>
					<input type="text" value="<%=s.getSubjectTime() %>" name="subjectTime">분
				</td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>