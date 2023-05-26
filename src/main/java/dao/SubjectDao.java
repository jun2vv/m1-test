package dao;

import java.sql.*;
import java.util.ArrayList;

import util.DBUtil;
import vo.*;

public class SubjectDao {
	// 1) 과목목록
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Subject> list = new ArrayList<>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();				
		/* 리스트 쿼리
		 	SELECT subject_no subjectNo, subject_name subjectName, sub_time subjectTime, createdate createdate, updatedate updatedate 
		 	FROM subject ORDER BY DESC createdate LIMIT ?, ?
		*/
		String sql = "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, createdate createdate, updatedate updatedate FROM subject ORDER BY createdate DESC LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(rs.getInt("subjectNo"));
			s.setSubjectName(rs.getString("subjectName"));
			s.setSubjectTime(rs.getInt("subjectTime"));
			s.setCreatedate(rs.getString("createdate"));
			s.setUpdatedate(rs.getString("updatedate"));
			list.add(s);
		}
		System.out.println(stmt + "<--- SubjectDao 리스트stmt");
		System.out.println(list.size() + "<--- SubjectDao list.size");
		
		return list;
	}
	// 2) 과목추가
	public int insertSubject(Subject subject) throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
	
		/* INSERT쿼리
		 INSERT INTO subject (subject_name, subject_time, createdate, updatedate) VALUES(?, ?, NOW(), NOW());
		*/
		String sql="INSERT INTO subject (subject_name, subject_time, createdate, updatedate) VALUES(?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		row = stmt.executeUpdate();
		
		return row;
		
	}
	// 3) 과목삭제
	public int deleteSubject(int subjectNo) throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		 DELETE FROM subject where subject_no = ?
		*/
		String sql = "DELETE FROM subject where subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 4) 과목수정
	public int updateSubject(Subject subject) throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		 UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = now() WHERE subject_no = ?
		*/
		String sql ="UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = now() WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		stmt.setInt(3, subject.getSubjectNo());
		row = stmt.executeUpdate();
		System.out.println(stmt + "<--- stmt");
		return row;
	}
	
	// 5) 과목상세
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		 "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, createdate createdate, updatedate updatedate FROM subject
		 */
		String sql="SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, createdate createdate, updatedate updatedate FROM subject WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			subject = new Subject();
			subject.setSubjectNo(rs.getInt("subjectNo"));
			subject.setSubjectName(rs.getString("subjectName"));
			subject.setSubjectTime(rs.getInt("subjectTime"));
			subject.setCreatedate(rs.getString("createdate"));
			subject.setUpdatedate(rs.getString("updatedate"));
		}
		
		return subject;
	}
	
	// 5) 과목전체(row)
	public int selectSubjectCnt() throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		/*
		  SELECT COUNT(*) FROM subject
		*/
		String sql = "SELECT COUNT(*) FROM subject";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt(1);
		}
		return row;
		
	}
}
