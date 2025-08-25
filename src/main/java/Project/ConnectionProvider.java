package Project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    // method to get DB connection
    public static Connection getCon() {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/bloodbank"; // default MySQL port = 3306
            String user = "root"; 
            String password = "admin123";
            
            // Create connection
            Connection con = DriverManager.getConnection(url, user, password);
            return con;
        } catch (Exception e) {
            e.printStackTrace(); // helpful for debugging
            return null;
        }
    }

    // test the connection
    public static void main(String[] args) {
        Connection con = getCon();
        if (con != null) {
            System.out.println("✅ Connection successful!");
        } else {
            System.out.println("❌ Connection failed.");
        }
    }
}
