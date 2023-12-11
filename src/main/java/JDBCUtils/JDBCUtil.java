package JDBCUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			String url = "jdbc:mysql://localhost:3306/project_web";//localhost
			String username = "root"; //root    //final_project_web
			String password = "1234"; //truong050123    //project_web
			
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connection succcessfully");
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeConnection(Connection conn) {
		try {
			if(conn!=null) {
				System.out.println("Close connection!");
				conn.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
