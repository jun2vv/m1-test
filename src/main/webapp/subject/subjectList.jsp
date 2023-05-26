<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "util.*" %>
<%@ page import = "java.util.*" %>

<%
	// SubjectDao 클래스 호출하기 위한객체
	SubjectDao sDao = new SubjectDao();

	// 메서드 매개변수
	
	// 페이징 부분
	//현재페이지 변수
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	// 페이지당 출력할 행의 수
	int rowPerPage = 3;
	// 페이지당 시작 행번호
	int beginRow = (currentPage-1) * rowPerPage;
	
	int totalRow = sDao.selectSubjectCnt();
	
	int lastPage = totalRow / rowPerPage;
	//rowPerPage가 딱 나뉘어 떨어지지 않으면 그 여분을 보여주기 위해 +1
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
	// 페이지 네비게이션 페이징
		int pagePerPage = 10;
		/*	cp	minPage		maxPage
			1		1	~	10
			2		1	~	10
			10		1	~	10
			
			11		11	~	20
			12		11	~	20
			20		11	~	20
			
			((cp-1) / pagePerPage) * pagePerPage + 1 --> minPage
			minPage + (pagePerPgae -1) --> maxPage
			maxPage > lastPage --> maxPage = lastPage;
		*/
		// 마지막 페이지 구하기
		// 최소페이지,최대페이지 구하기
		int minPage = ((currentPage-1) / pagePerPage) * pagePerPage + 1;
		int maxPage = minPage + (pagePerPage -1);
		if(maxPage > lastPage) {
			maxPage = lastPage;
		}

	// 모든행을 출력하기위해 Subject 배열을 만듬
	ArrayList<Subject> list = sDao.selectSubjectListByPage(beginRow, rowPerPage);

	
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
	<h1>과목 리스트</h1>
	<table class="table table-bordered">
		<tr class="table-danger">
			<td>과목 번호</td>
			<td>과목 이름</td>
			<td>과목 시간</td>
		</tr>
		<%
			for(Subject s : list) {
		%>	
				<tr>
					<td><%=s.getSubjectNo() %></td>
					<td><a href="<%=request.getContextPath() %>/subject/subjectOne.jsp?subjectNo=<%=s.getSubjectNo() %>"><%=s.getSubjectName() %></a></td>
					<td><%=s.getSubjectTime() %>시간</td>
				</tr>		
		<% 	}
		%>
		
	</table>
			<div><a class="btn btn-success" href="<%=request.getContextPath() %>/subject/subjectInsert.jsp">과목추가</a></div>
		<ul class="pagination justify-content-center list-group list-group-horizontal">
			<% 
				// 최소페이지가 1보다크면 이전페이지(이전페이지는 만약 내가 11페이지면 1페이지로 21페이지면 11페이지로)버튼
				if(minPage>1) {
			%>
					<li class="list-group-item">
						<a href="<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=minPage-pagePerPage%>">이전</a>
					</li>
			<%			
				}
				// 최소 페이지부터 최대 페이지까지 표시
				for(int i = minPage; i<=maxPage; i=i+1) {
					if(i == currentPage) {	// 현재페이지는 링크 비활성화
			%>	
						<!-- i와 현재페이지가 같은곳이라면 현재위치한 페이지 빨간색표시 -->
						<li class="list-group-item">
							<span style="color: red;"><%=i %></span>
						</li>
			<%			
					// i가 현재페이지와 다르다면 출력
					}else {					
			%>		
						<li class="list-group-item">
							<a href="<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=i%>"><%=i%></a>
						</li>
			<%				
					}
				}
				
				// maxPage가 마지막페이지와 다르다면 다음버튼 마지막페이지에서는 둘이 같으니 다음버튼이 안나오겠죠
				// 다음페이지(만약 내가 1페이지에서 누르면 11페이지로 11페이지에서 누르면 21페이지로)버튼
				if(maxPage != lastPage) {
			%>
					<li class="list-group-item">
						<a href="<%=request.getContextPath()%>/subject/subjectListjsp?currentPage=<%=minPage+pagePerPage%>">다음</a>
					</li>
			<%	
				}
			%>
		</ul>
	</div>
</body>
</html>