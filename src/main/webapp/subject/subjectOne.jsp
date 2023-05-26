<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%
	
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("subjectNo") == null) {
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao oneDao = new SubjectDao();
	
	// 상세 페이지용 subject 객체
	Subject s = oneDao.selectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세보기</h1>
	<a href="<%=request.getContextPath() %>/subject/subjectList.jsp">리스트로</a>
	<table>
		<tr>
			<th>과목이름</th>
			<td>
				<input type="text" value="<%=s.getSubjectName() %>" name="subjectName" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>과목시간</th>
			<td>
				<input type="text" value="<%=s.getSubjectTime() %>" name="subjectTime" readonly="readonly">분
			</td>
		</tr>
		<tr>
			<th>과목개설일</th>
			<td>
				<input type="text" value="<%=s.getCreatedate() %>" name="subjectTime" readonly="readonly">분
			</td>
		</tr>
		<tr>
			<th>과목수정일</th>
			<td>
				<input type="text" value="<%=s.getUpdatedate() %>" name="subjectTime" readonly="readonly">분
			</td>
		</tr>
	</table>
		<a href="<%=request.getContextPath() %>/subject/subjectUpdate.jsp?subjectNo=<%=subjectNo%>">수정하기</a>
		<a href="<%=request.getContextPath()%>/subject/subjectDeleteAction.jsp?subjectNo=<%=subjectNo%>">과목삭제</a>
</body>
</html>