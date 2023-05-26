package dao;
import java.sql.*;
import java.util.ArrayList;
import util.DBUtil;
import vo.*;

public class TeacherSubjectDao {
	public ArrayList<Subject> selectSubject(int subjectNo) throws Exception {
		ArrayList<Subject> sList = new ArrayList<>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();	
		/*
		 SELECT subject_no subjectNo, subject_name, subjectName FROM subject
		 */
		String sql = "SELECT subject_no subjectNo, subject_name, subjectName FROM subject";
		
		return sList;
	}
}
