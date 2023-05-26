<%@page import="java.util.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 메서드를 사용하기위해 Dao클래스 호출
	TeacherDao listDao = new TeacherDao();

	// 페이징 부분
	//현재페이지 변수
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 페이지당 출력할 행의 수
	int rowPerPage = 5;
	// 페이지당 시작 행번호
	int beginRow = (currentPage-1) * rowPerPage;
	
	// 전체행의수 구하기 DAO에 메서드로 만들어서 호출
	int totalRow = listDao.selectTeacherCnt();
	
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

	// 리스트를 출력하기 위해 반환타입에 맞는 메서드 호출
	ArrayList<HashMap<String, Object>> listArr = listDao.selectTeacherListByPage(beginRow, rowPerPage);
	
	


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
	<h1>강사목록</h1>
	<table class="table table-bordered">
		<tr class="table-info">
			<td>강사ID</td>
			<td>강사이름</td>
			<td>담당과목</td>
		</tr>
		
		<%
			for(HashMap<String, Object> map : listArr) {
		%>
				<tr>
					<td><%=map.get("teacherId") %></td>
					<td><a href="<%=request.getContextPath() %>/teacher/teacherOne.jsp?teacherNo=<%=map.get("teacherNo") %>"><%=map.get("teacherName")%></a></td>
					<td><%=map.get("groupConcat") %></td>
				</tr>
		<% 
			}
		%>
	</table>
		<div><a class="btn btn-success" href="<%=request.getContextPath() %>/teacher/teacherInsert.jsp">과목추가</a></div>
	
		<% 
			// 최소페이지가 1보다크면 이전페이지(이전페이지는 만약 내가 11페이지면 1페이지로 21페이지면 11페이지로)버튼
			if(minPage>1) {
		%>
				<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage-pagePerPage%>">이전</a>
		<%			
			}
			// 최소 페이지부터 최대 페이지까지 표시
			for(int i = minPage; i<=maxPage; i=i+1) {
				if(i == currentPage) {	// 현재페이지는 링크 비활성화
		%>	
					<!-- i와 현재페이지가 같은곳이라면 현재위치한 페이지 빨간색표시 -->
					<span style="color: red;"><%=i %></span>
		<%			
				// i가 현재페이지와 다르다면 출력
				}else {					
		%>	
					<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i%></a>
		<%				
				}
			}
			
			// maxPage가 마지막페이지와 다르다면 다음버튼 마지막페이지에서는 둘이 같으니 다음버튼이 안나오겠죠
			// 다음페이지(만약 내가 1페이지에서 누르면 11페이지로 11페이지에서 누르면 21페이지로)버튼
			if(maxPage != lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/teacher/teacherListjsp?currentPage=<%=minPage+pagePerPage%>">다음</a>
		<%	
			}
		%>
	</div>
		
</body>
</html>