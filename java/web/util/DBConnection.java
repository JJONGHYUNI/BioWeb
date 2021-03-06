package web.util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DBConnection 
{
	public static Connection getConnection() throws SQLException, NamingException, 
	ClassNotFoundException{
			Context init = new InitialContext();
			
			Context env = (Context) init.lookup("java:comp/env");
			
			DataSource ds = (DataSource) env.lookup("jdbc/mysql");
			
			Connection conn = ds.getConnection();
			return conn;
	}
}	