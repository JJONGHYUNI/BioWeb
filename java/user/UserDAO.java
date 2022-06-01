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
	public int login(String ID, String PW) {
		String SQL = "SELECT pw FROM member WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(PW)) {
					return 1;
				}
				else
					return 0;
			}
			return -1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public int IdCheck(String ID){
		int result = -1;
		try {
			String SQL = "SELECT pw FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			if(rs.next()){	
				result = 0;
			}else{
				result = 1;
			}
			System.out.println("아이디 중복체크결과 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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