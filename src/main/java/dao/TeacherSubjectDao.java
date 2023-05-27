package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.*;

public class TeacherSubjectDao {
	// 1) subject_name출력
	public ArrayList<HashMap<String, Object>> selectSubject() throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();	
		/*
		 SELECT subject_no subjectNo, subject_name, subjectName FROM subject
		 */
		String sql = "SELECT subject_no subjectNo, subject_name subjectName FROM subject";
		PreparedStatement sStmt = conn.prepareStatement(sql);
		ResultSet rs = sStmt.executeQuery();
		
		ArrayList<HashMap<String,Object>> sList = new ArrayList<HashMap<String,Object>>();
		while(rs.next()) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("subjectNo", rs.getInt("subjectNo"));
			map.put("subjectName", rs.getString("subjectName"));
			sList.add(map);
		}
		System.out.println(sStmt + "<--- TeacherSubjectDao sStmt");
		return sList;
	}
	
	// 2) teacher_name출력
	public ArrayList<HashMap<String, Object>> selectTeacher() throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		 SELECT teacher_no teacherNo, teacher_name, teacherName FROM teacher
		 */
		String sql="SELECT teacher_no teacherNo, teacher_name teacherName FROM teacher";
		PreparedStatement tStmt = conn.prepareStatement(sql);
		ResultSet rs = tStmt.executeQuery();
		ArrayList<HashMap<String, Object>> tList = new ArrayList<>();
		while(rs.next()) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("teacherNo", rs.getInt("teacherNo"));
			map.put("teacherName", rs.getString("teacherName"));
			tList.add(map);
		}
		System.out.println(tStmt + "<--- TeacherSubjectDao stmt");
		return tList;	
	}
	
	// 3) insert 
	public int insertTeacherSubject(TeacherSubject teacherSubject) throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		 INSERT INTO teacher_subject (teacher_no, subject_no, updatedate, createdate VALUE(?,?,now(),now())
		 */
		String sql="INSERT INTO teacher_subject (teacher_no, subject_no, updatedate, createdate) VALUE(?,?,now(),now())";
		PreparedStatement insertStmt = conn.prepareStatement(sql);
		insertStmt.setInt(1, teacherSubject.getTeacherNo());
		insertStmt.setInt(2, teacherSubject.getSubjectNo());
		row = insertStmt.executeUpdate();
		
		System.out.println(insertStmt + "<--- TeacherSubjectDao insertStmt");
		
		return row;
		
	}
	
	// 4) update
	public int updateTeacherSubject(TeacherSubject teacherSubject) throws Exception {
		int row =0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		  UPDATE teacher_subject SET teacher_no = ? , subject_no = ?, updatedate = now() WHERE teacher_subject_no = ?
		 */
		String sql = "UPDATE teacher_subject SET teacher_no = ? , subject_no = ?, updatedate = now() WHERE teacher_subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherSubject.getTeacherNo());
		stmt.setInt(2, teacherSubject.getSubjectNo());
		stmt.setInt(3, teacherSubject.getTeacherSubjectNo());
		row = stmt.executeUpdate();
		return row;
	}
}
