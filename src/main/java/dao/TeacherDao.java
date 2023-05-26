package dao;


import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Subject;
import vo.Teacher;

public class TeacherDao {
	// 1) 강사목록
	/*
	 issue : 교과목이 연결되지 않은 강사는 출력되지 않는다. inner join -> outer join
	 
	SELECT t.teacher_no, t.teacher_id, t.teacher_name, s.subject_name, GROUP_CONCAT(s.subject_name, '/')
	FROM teacher t left outer JOIN teacher_subject ts
					ON t.teacher_no = ts.teacher_no
						left outer join subject s
						ON ts.teacher_no = s.subject_no
	GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT 0, 10; 
	 
	 */
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
			// ArrayList<HashMap<String, Object>> 을 반환해야하니 객체생성
			ArrayList<HashMap<String,Object>> arrList = new ArrayList<HashMap<String,Object>>();
			DBUtil dbutil = new DBUtil();
			Connection conn = dbutil.getConnection();
			
			String sql = "SELECT t.teacher_no teacherNo, t.teacher_id teacherId,t.teacher_name teacherName,ifnull(GROUP_CONCAT(s.subject_name),'없음') groupConcat\r\n"
					+ "FROM teacher t LEFT OUTER JOIN teacher_subject ts\r\n"
					+ "   ON t.teacher_no = ts.teacher_no\r\n"
					+ "      LEFT OUTER JOIN subject s\r\n"
					+ "         ON ts.subject_no = s.subject_no\r\n"
					+ "GROUP BY t.teacher_no,t.teacher_id,t.teacher_name LIMIT ?, ?; ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("teacherNo", rs.getInt("teacherNo"));
				map.put("teacherId",rs.getString("teacherId"));
				map.put("teacherName",rs.getString("teacherName"));
				map.put("groupConcat", rs.getString("groupConcat"));
				arrList.add(map);
			}
			
		return arrList;
	}
	// 2) 강사추가
	public int insertTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
	
		/* INSERT쿼리
		 INSERT INTO teacher (teacher_id, teacher_name, teacher_history, createdate, updatedate) VALUES(?, ?, ?, NOW(), NOW());
		*/
		String sql="INSERT INTO teacher (teacher_id, teacher_name, teacher_history, createdate, updatedate) VALUES(?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		row = stmt.executeUpdate();
		
		return row;
	}
	
	// count(*)
	public int selectTeacherCnt() throws Exception {
		// 반환할 전체 행의 수
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		  SELECT COUNT(*) FROM teacher
		*/
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM teacher");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt(1);
		}
		return row;
	}
}
