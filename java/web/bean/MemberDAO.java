package web.bean;
import java.sql.*;
import java.util.*;

public class MemberDAO {
   String driver = "com.mysql.jdbc.Driver";
   String url ="jdbc:mysql://localhost:3306/testdb?&serverTimezone=UTC";
   String userid = "root";
   String passwd = "7684592a";
   
   public MemberDAO() {
      try {
         Class.forName(driver);
         
      }catch(ClassNotFoundException e) {
         e.printStackTrace();
      }
   }
   
   public ArrayList<Member> select(){
      ArrayList<Member> list = new ArrayList<Member>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         con = DriverManager.getConnection(url,userid,passwd);
         String sql = "SELECT id,pw,name,zipcode,address,email from member";
         pstmt = con.prepareStatement(sql);
         rs=pstmt.executeQuery();
         while(rs.next()) {
            String emp_id = rs.getString("id");
            String ename = rs.getString("pw");
            String salary = rs.getString("name");
            int depart = rs.getint("zipcode");
            String address = rs.getString("Address");
            String ad
            
            empDTO dto = new empDTO(emp_id,ename,salary,depart);
            list.add(dto);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(con!=null) con.close();
            
         }
         catch(SQLException e) {
            e.printStackTrace();
         }
      }
      return list;
   }
}
