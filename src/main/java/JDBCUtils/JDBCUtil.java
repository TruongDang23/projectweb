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
			String username = System.getenv("DB_USERNAME");
			String password =System.getenv("DB_PASSWORD"); //truong050123    //1234
			
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
