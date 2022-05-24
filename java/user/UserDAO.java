package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import web.bean.Member;
public class UserDAO{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/profile?&serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "7684592a";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int signUP(Member member) {
		String SQL = "INSERT INTO member VALUES( ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getID());
			pstmt.setString(2, member.getPW());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getZipCode());
			pstmt.setString(5, member.getRoadAddress());
			pstmt.setString(6, member.getDetailAddress());
			pstmt.setString(7, member.getEmail());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		}

}