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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<div class="container">
	<h1>상세보기</h1>
	<a class="btn btn-info"  href="<%=request.getContextPath() %>/subject/subjectList.jsp">리스트로</a>
		<table class="table table-striped">
			<tr>
				<th>과목이름</th>
				<td>
					<input type="text" value="<%=s.getSubjectName() %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>과목시간</th>
				<td>
					<input type="text" value="<%=s.getSubjectTime() %>" readonly="readonly">시간
				</td>
			</tr>
			<tr>
				<th>과목개설일</th>
				<td>
					<input type="text" value="<%=s.getCreatedate() %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>과목수정일</th>
				<td>
					<input type="text" value="<%=s.getUpdatedate() %>"  readonly="readonly">
				</td>
			</tr>
		</table>
		<a class="btn btn-success" href="<%=request.getContextPath() %>/subject/subjectUpdate.jsp?subjectNo=<%=subjectNo%>">수정하기</a>
		<a class="btn btn-danger" href="<%=request.getContextPath()%>/subject/subjectDeleteAction.jsp?subjectNo=<%=subjectNo%>">과목삭제</a>
	</div>
</body>
</html>