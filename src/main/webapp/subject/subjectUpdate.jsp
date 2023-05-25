<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	// 요청값 검사
	if(request.getParameter("subjectNo")==null
		||request.getParameter("subjectNo").equals("")){
	    response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	    return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));

	System.out.println(subjectNo + "<--- subjectUpdate subjectNo");
	SubjectDao uDao = new SubjectDao();
	Subject s = uDao.selectSubjectOne(subjectNo);
	// subject 객체 생성
	if (s == null) {
	    s = new Subject();
	    s.setSubjectNo(subjectNo);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목수정창</h1>
	<form action="<%=request.getContextPath()%>/subject/subjectUpdateAction.jsp">
		<table>
			<tr>
				<th>과목이름</th>
				<td>
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