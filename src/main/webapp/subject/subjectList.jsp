<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "java.util.*" %>

<%
	// 메서드 매개변수
	int beginRow = 0;
	int rowPerPage = 10;
	
	// SubjectDao 클래스 호출하기 위한객체
	SubjectDao sDao = new SubjectDao();
	
	// 모든행을 출력하기위해 Subject 배열을 만듬
	ArrayList<Subject> list = sDao.selectSubjectListByPage(beginRow, rowPerPage);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>subject_list</h1>
	<table>
		<tr>
			<td>subject_no</td>
			<td>subject_name</td>
			<td>subject_time</td>
			<td>createdate</td>
			<td>updatedate</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<%
			for(Subject s : list) {
		%>	
				<tr>
					<td><%=s.getSubjectNo() %></td>
					<td><%=s.getSubjectName() %></td>
					<td><%=s.getSubjectTime() %></td>
					<td><%=s.getCreatedate() %></td>
					<td><%=s.getUpdatedate() %></td>
					<td>																	<!--  번호를 통해 수정하기 때문에 값 전송 -->
						<a href="<%=request.getContextPath()%>/subject/subjectUpdate.jsp?subjectNo=<%=s.getSubjectNo()%>">수정</a>
					</td>
					<td>
																							<!--  번호를 통해 삭제하기 때문에 값 전송 -->
						<a href="<%=request.getContextPath()%>/subject/subjectDeleteAction.jsp?subjectNo=<%=s.getSubjectNo()%>">삭제</a>
					</td>
				</tr>		
		<% 	}
		%>
	</table>
	<a href="<%=request.getContextPath() %>/subject/subjectInsert.jsp">과목추가</a>
</body>
</html>